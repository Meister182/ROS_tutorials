## ROS tutorials

#### Following along | Ros tutorials : http://wiki.ros.org/ROS/Tutorials

---
<details closed>
<summary> [09] Recording and playing back data </summary>

```bash
# Create a dumping directory. (does not need to be inside the package)
mkdir -p ~/ROS_tutorials/src/myRosPackage/bagfiles
cd ~/ROS_tutorials/src/myRosPackage/bagfiles

# For Recording all publish topics
rosbag record -a -O myBag

# Displaing the bag info
rosbag info myBag

# Displaing the bag info
rosbag play myBag


## Example
# Terminal 0: ROS master
roscore

# Terminal 1: turtlesim_node
rosrun turtlesim turtlesim_node 

# Terminal 2: turtlesim controls
rosrun turtlesim turtle_teleop_key

# Terminal 3: RECORDING.
#All topcis
rosbag record -a -O myBag
#Only a subset of topics
rosbag record -O subset /turtle1/cmd_vel /turtle1/pose

# Terminal 3: checking a bag info
rosbag info myBag
rosbag info subset

# Terminal 4: playing back the info
rosbag play myBag
rosbag play subset

# Terminal 4: playing back a specific topic
rosbag play myBag --topic /turtle1/cmd_vel
```
</details>


---
<details closed>
<summary> [08] Service Client (C++) | Build </summary>

```bash
# Add to CMakeLists.txt :
add_executable(add_two_ints_server src/myServer.cpp)
target_link_libraries(add_two_ints_server ${catkin_LIBRARIES})
add_dependencies(add_two_ints_server myRosPackage_generate_messages_cpp)

add_executable(add_two_ints_client src/myClient.cpp)
target_link_libraries(add_two_ints_client ${catkin_LIBRARIES})
add_dependencies(add_two_ints_client myRosPackage_generate_messages_cpp)

# Building
cd ~/ROS_tutorials/
catkin_make
```
</details>

<details closed>
<summary> [08] Service Client (C++) </summary>

```bash
# Create a src directory inside the package
mkdir -p ~/ROS_tutorials/src/myRosPackage/src

# Create a Service.cpp
touch ~/ROS_tutorials/src/myRosPackage/src/myService.cpp

# Create a Client.cpp
touch ~/ROS_tutorials/src/myRosPackage/src/myClient.cpp
```

<details closed>
<summary> myService.cpp : </summary>

- ### Include files :
```cpp
#include "ros/ros.h"
//my service created in [06] Creating a ROS message and service
#include "myRosPackage/AddTwoIntsCopy.h"  
```

- ### ROS configs :
```cpp
  // Initialize the node "add_two_ints_server"
  ros::init(argc, argv, "add_two_ints_server"); 
  ros::NodeHandle n;
  
  // The service is created and advertised over ROS
  ros::ServiceServer service = n.advertiseService("add_two_ints", add);
  ROS_INFO("Ready to add two ints.");
  ros::spin();
```
- ### Service code :
```cpp
// Callback function that will get called when this service is requested.
bool add(myRosPackage::AddTwoIntsCopy::Request  &req,
         myRosPackage::AddTwoIntsCopy::Response &res)
{
  res.sum = req.a + req.b;
  ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
  ROS_INFO("sending back response: [%ld]", (long int)res.sum);
  return true;
}

```

</details>

<details closed>
<summary> myClient.cpp : </summary>

- ### Include files :
```cpp
#include "ros/ros.h"
#include <cstdlib>
//my service created in [06] Creating a ROS message and service
#include "myRosPackage/AddTwoIntsCopy.h"
```

- ### ROS configs :
```cpp
  // Creates a client for the add_two_ints service.
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<myRosPackage::AddTwoIntsCopy>("add_two_ints");
```

- ### Client code :
```cpp
  // Verify input
  ros::init(argc, argv, "add_two_ints_client");
  if (argc != 3)
  {
    ROS_INFO("usage: add_two_ints_client X Y");
    return 1;
  }

  // Building the request
  myRosPackage::AddTwoIntsCopy srv;
  srv.request.a = atoll(argv[1]);
  srv.request.b = atoll(argv[2]);

  // Try to call service with the request
  if (client.call(srv))
  {
    ROS_INFO("Sum: %ld", (long int)srv.response.sum);
  }
  else
  {
    ROS_ERROR("Failed to call service add_two_ints");
    return 1;
  }
```

</details>
<br>
</details>
</details>

---
<details closed>
<summary> [07] Publisher Subscriber (C++) | Build </summary>

```bash
# Add to CMakeLists.txt :
add_executable(talker src/myPublisher.cpp)
target_link_libraries(talker ${catkin_LIBRARIES})
add_dependencies(talker myRosPackage_generate_messages_cpp)

add_executable(listener src/mySubscriber.cpp)
target_link_libraries(listener ${catkin_LIBRARIES})
add_dependencies(listener myRosPackage_generate_messages_cpp)

# Building
cd ~/ROS_tutorials/
catkin_make
```
</details>

<details closed>
<summary> [07] Publisher Subscriber (C++) | Creation </summary>

```bash
# Create a src directory inside the package
mkdir -p ~/ROS_tutorials/src/myRosPackage/src

# Create a Publisher.cpp
touch ~/ROS_tutorials/src/myRosPackage/src/myPublisher.cpp

# Create a Subscriber.cpp
touch ~/ROS_tutorials/src/myRosPackage/src/mySubscriber.cpp
```

<details closed>
<summary> myPublisher.cpp : </summary>

- ### Include files :
```cpp
#include "ros/ros.h"            // the most common public pieces of the ROS system
#include "std_msgs/String.h"    // a message from the std_msgs package
```

- ### ROS configs :
```cpp
  // Initialize ROS
  ros::init(argc, argv, "talker");
  
  // A handle to this process' node, also initializes the node "talker"
  ros::NodeHandle n;
  
  // Advertise that we are going to be publishing std_msgs/String messages on the chatter topic to the master
  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
  
  // Specify the loop frequency, It will keep track of how long it has been since the last call to Rate::sleep().
  ros::Rate loop_rate(10);
```
- ### Publisher code :
```cpp
  int count = 0;
  while (ros::ok())
  {
    // Create a message
    std_msgs::String msg;
    std::stringstream ss;

    // Add info to the message
    ss << "hello world " << count;
    msg.data = ss.str();

    // debug
    ROS_INFO("%s", msg.data.c_str());

    //Publish message
    chatter_pub.publish(msg); // 

    // In case this node is also subscriber, spinOnce() is necessary for the callbacks to be called
    // ros::spinOnce();

    // sleep for the time remaining to let us hit our 10Hz publish rate.
    loop_rate.sleep();
    ++count;
  }
```

</details>

<details closed>
<summary> mySubscriber.cpp : </summary>

- ### Include files :
```cpp
#include "ros/ros.h"            // the most common public pieces of the ROS system
#include "std_msgs/String.h"    // a message from the std_msgs package
```

- ### ROS configs :
```cpp
  // Initialize ROS
  ros::init(argc, argv, "listener");
  
  // A handle to this process' node, also initializes the node "listener"
  ros::NodeHandle n;

  // Subscribe to the chatter topic
  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);

  // ros::spin() enters a loop, calling message callbacks as fast as possible.
  ros::spin();
  // ros::spin() will exit once ros::ok() returns false, which means ros::shutdown() has been called.
```

- ### Subscriber code :
```cpp
// Callback function that will get called when a new message has arrived on the chatter topic.
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s]", msg->data.c_str());
}
```

</details>
<br>
</details>

<details closed>
<summary> [07] Publisher Subscriber (C++) | Vscode including ros path. </summary>

```bash
mkdir -p ~/ROS_tutorials/.vscode/
touch ~/ROS_tutorials/.vscode/c_pp_properties.json
```
### c_pp_properties.json :
```json
{
  "configurations": [
    {
      "name": "Linux",
      "includePath": [
        "${workspaceFolder}/**",
        "/opt/ros/kinetic/include"c_pp_properties.json
      ],
      "defines": [],
      "compilerPath": "/usr/bin/gcc",
      "cStandard": "c11",
      "cppStandard": "c++17",
      "intelliSenseMode": "clang-x64"
    }
  ],
  "version": 4
}
```
</details>

---
<details>
<summary> [06] Creating a ROS message and service </summary>

  - msg: msg files are simple text files that describe the fields of a ROS message. They are used to generate source code for messages in different languages.
  - srv: an srv file describes a service. It is composed of two parts: a request and a response.

<details closed>
<summary> Create a Message </summary>

```bash
  # Message files are stored in the msg directory of a package
  mkdir -p ~/ROS_tutorials/src/myRosPackage/msg
  touch ~/ROS_tutorials/src/myRosPackage/msg/myMSG.msg

  # Messages are just simple text files with a field type and field name per line. 
  # The field types you can use are:
  #   - int8, int16, int32, int64 (plus uint*)
  #   - float32, float64
  #   - string
  #   - time, duration
  #   - other msg files
  #   - variable-length array[] and fixed-length array[C]

  echo "string nickname" > ~/ROS_tutorials/src/myRosPackage/msg/myMSG.msg
  echo "int64 score" >> ~/ROS_tutorials/src/myRosPackage/msg/myMSG.msg
```

### In order for messages to be used in C++ or Python code they need to be converted into source code. For that to happen we need to make sure that:
  - The next two lines are in the  '/myRosPackage/package.xml' file
```xml
  <build_depend>message_generation</build_depend>
  <exec_depend>message_runtime</exec_depend>
```
  - We add message_generation to the find_package, in '/myRosPackage/CMakeLists.txt' file
```bash
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
+ message_generation
)
```

  - We uncomment the generate_messages and the add_message_files, and add our message. in '/myRosPackage/CMakeLists.txt'
```bash
add_message_files(
  FILES
+  myMSG.msg
)

generate_messages(
  DEPENDENCIES
  std_msgs
)
```
</details>

<details closed>
<summary> Create a Service </summary>


```bash
  # Service files are stored in the srv directory of a package
  mkdir -p ~/ROS_tutorials/src/myRosPackage/srv

  # Using an existing service
  roscp rospy_tutorials AddTwoInts.srv srv/AddTwoIntsCopy.srv

  cat srv/AddTwoIntsCopy.srv
  #output:
  # int64 a
  # int64 b
  # ---
  # int64 sum

```
### In order for services to be used in C++ or Python code they need to be converted into source code. For that to happen we need to make sure that:

  - The next two lines are in the  '/myRosPackage/package.xml' file
```xml
  <build_depend>message_generation</build_depend>
  <exec_depend>message_runtime</exec_depend>
```
  - We add message_generation to the find_package dependecies, in '/myRosPackage/CMakeLists.txt' file
```bash
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
+ message_generation
)
```

  - We uncomment the generate_messages and the add_message_files, and add our message. in '/myRosPackage/CMakeLists.txt'
```bash
add_service_files(
  FILES
  AddTwoIntsCopy.srv
)
```
</details>
<br>
</details>

---
<details>
<summary> [05] Debugging with rqt </summary>

```bash
- rqt is a software framework of ROS that implements the various GUI tools in the form of plugins, making it easier to manage all the various windows on the screen at one moment.
 
# The GUI tools can run in a traditional standalone method.
rqt_logger_level   # to chose which message to show [Fatal, Error, Warn, Info, Debug]
rqt_console        # A consolo to monitor messages
rqt_graph          # See which nodes publish and subscribe to which topics


# Or as dockable windows within rqt.
rqt      # then go to puglins and select which one you want to use.

# Its even possible to create your own plugins
http://wiki.ros.org/rqt/Tutorials/Create%20your%20new%20rqt%20plugin
```
</details>


---
<details closed>
<summary> [04] Launch files </summary>

```bash
    - launch files allow you to run multiple nodes at once
    - roslaunch starts nodes as defined in a launch file.

    # Creating a launch file
    #   - launch files do not need to e in a specific directory, they can just be in the package directory.
    mkdir -p ~/ROS_tutorials/src/myRosPackage/launch
    touch ~/ROS_tutorials/src/myRosPackage/launch/myTurtleLauncher.launch

    # myTurtleLauncher.launch :
    - Launches 2 nodes : turtlesim1 and turlesim2
    - The nodes are of the type of turtlesim_node from the turtlesim package
    - Also sets turtlesim2 to mimic turtlesim 1
```
```xml
<launch>

  <group ns="turtlesim1">
    <node pkg="turtlesim" name="sim" type="turtlesim_node"/>
  </group>

  <group ns="turtlesim2">
    <node pkg="turtlesim" name="sim" type="turtlesim_node"/>
  </group>

  <node pkg="turtlesim" name="mimic" type="mimic">
    <remap from="input" to="turtlesim1/turtle1"/>
    <remap from="output" to="turtlesim2/turtle1"/>
  </node>

</launch>
```
```bash
    # launching
    roslaunch myRosPackage 

    # Testing:
    rostopic pub /turtlesim1/turtle1 cmd_vel geometry_msgs/Twist -r 1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'
```
</details>

---
<details closed>
<summary>  [03] Nodes, Topics, Services & Parameters </summary>

```bash
# Quick Overview of Graph Concepts:
  - Nodes: A node is an executable that uses ROS to communicate with other nodes.
  - Messages: ROS data type used when subscribing or publishing to a topic.
  - Topics: Nodes can publish messages to a topic as well as subscribe to a topic to receive messages.
  - Services: another way that nodes can communicate, allows nodes to send a request and receive a response.
  - Master: Name service for ROS (i.e. helps nodes find each other)
  - rosout: ROS equivalent of stdout/stderr
  - roscore: Master + rosout + parameter server (parameter server will be introduced later)
```

<details>
<summary> ROS Nodes </summary>

```bash
# Nodes: A node is an executable that uses ROS to communicate with other nodes.

# Example:
## Terminal 0: Launch the ROS master node
roscore

## Terminal 1: Run a Package (turtlesim)
rosrun turtlesim turtlesim_node

## Terminal 2: List all nodes
rosnode list
##output:
#/rosout
#/turtlesim
```
</details>


<details>
<summary> Topics </summary>

```bash
# Topics: Nodes can publish messages to a topic as well as subscribe to a topic to receive messages.

# Example: Making turtle sim move
#(Following the Nodes example)

## Terminal 2: List all topics
rostopic list
##output:
#/rosout
#/rosout_agg
#/turtle1/cmd_vel
#/turtle1/color_sensor
#/turtle1/pose

## Terminal 2: Who subscribes to /turtle1/cmd_vel
rostopic info /turtle1/cmd_vel
##ouput:
#Type: geometry_msgs/Twist
#
#Publishers: None    ---> it has no publishers 
#
#Subscribers:        ---> the turtlesim is waiting for some node to publish something here
# * /turtlesim (http://cpu:44857/)

## Terminal 2: Posting to a topic0
# rostopic pub <topic> <msgType> -- <msg>
rostopic pub /turtle1/cmd_vel geometry_msgs/Twist -r 1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'

## Terminal 3: Check nodes!!
nodelist
##output:
#/rosout
#/rostopic_12475_1568754806388  ---> There is a new node!!
#/turtlesim

## Terminal 3: Recheck Topic info
rostopic info /turtle1/cmd_vel
##ouput:
#Type: geometry_msgs/Twist
#
#Publishers:
# * /rostopic_12475_1568754806388 (http://cpu:41131/)   ---> Now it has publisher
#
#Subscribers:        
# * /turtlesim (http://cpu:44857/)

# Tip: For more detailed info about the messages used by the topic
rostopic type /turtle1/cmd_vel | rosmsg show
```
</details>


<details closed>
<summary> Services </summary>

```bash
# Services: another way that nodes can communicate, allows nodes to send a request and receive a response.

# Example: Spawning another turtle
#(Following the Nodes example)

## Terminal 2: List all services
rosservice list
##output:
#/clear
#/kill
#/reset
#/rosout/get_loggers
#/rosout/set_logger_level
#/spawn
#/turtle1/set_pen
#/turtle1/teleport_absolute
#/turtle1/teleport_relative
#/turtlesim/get_loggers
#/turtlesim/set_logger_level

# Terminal 2: Checking input and output arguments of the /spawn service
rosservice info /spawn
##ouput:
#Node: /turtlesim
#URI: rosrpc://cpu:35097
#Type: turtlesim/Spawn
#Args: x y theta name

# Tip: For more detailed info about the service --> rosservice type /spawn | rossrv show 
rossrv show turtlesim/Spawn
##output:
#float32 x      -----> Input arguments
#float32 y      -///
#float32 theta  -//
#string name    -/
#---
#string name    -----> Output arguments

# Terminal 2: Calling a service (Spawn a second turtle)
rosservice call /spawn  2 2 0.2 "" 
##output:
#name: "turtle2"

# Now there are new topics in order to comunicate with turle2
```
</details>


<details closed>
<summary> Parameters </summary>

```bash
# Parameter: Data on the ROS Parameter Server. (integers, floats, boolean, dictionaries, and lists)
# Parameter Server: Used by nodes to store and retrieve parameters at runtime. It's not designed for high-performance, it is best used for static, non-binary data such as configuration parameters.

# Example: Changing turtlesim background color
#(Following the Nodes example)

# Terminal 2: list all parameters
rosparam list
##output:
#/background_b
#/background_g
#/background_r
#/rosdistro
#/roslaunch/uris/host_cpu__43203
#/rosversion
#/run_id

# Terminal 2: Change background_r paramenter value
rosparam set /background_r 150

# Terminal 2: Clear for changes to take effect
rosservice call /clear


# Tip: Getting all Parameter
rosparam get /

# Tip: Parameters can be all dump to a file and load latter. This allows to save configurations.
rosparam dump myParams.yaml
rosparam load myParams.yaml copy

```
</details>
<br>
</details>

---
<details closed>
<summary> [02] Creating a ROS package </summary>

```bash
# Don't forget to overlap your environment.
source devel/setup.bash

# Change diretories to your src directory.
cd src

# Creating a catkin pkg. :
#catkin_create_pkg <package_name> [depend1] [depend2] [depend3]
catkin_create_pkg myRosPackage std_msgs rospy roscpp

# Change diretories back to your environment directory.
cd ..

# Building Your package
catkin_make
```
</details>

---
<details closed>
<summary> [01] Creating a ROS environment </summary>

```bash
# Create your directory
mkdir -p ~/ROS_tutorials/src

# Create ROS environment
cd ~/ROS_tutorials/
catkin_make

# Overaling Workspace
source devel/setup.bash

# Checking all is OK
echo $ROS_PACKAGE_PATH
#output: /home/user/ROS_tutorials/src:/opt/ros/kinetic/share
```
</details>


---
<details closed>
<summary> [00] Setting up Ros </summary>

```bash
# Accepting software from packages.ros.org.
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

#Seting keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

#Update and Install ROS 
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full

#Initialize rosdep for installing dependecies
sudo rosdep init
rosdep update

#ROS env variables automatically in every new terminal
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
env | grep ROS

# installing some build dependecies
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
```
</details>