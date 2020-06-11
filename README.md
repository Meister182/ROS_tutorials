## [02] Creating a ROS package

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

- #### Following along | Ros tutorials : http://wiki.ros.org/ROS/Tutorials