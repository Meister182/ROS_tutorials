#include "ros/ros.h"            // the most common public pieces of the ROS system
#include "std_msgs/String.h"    // a message from the std_msgs package

#include <sstream>

int main(int argc, char **argv)
{
  // Initialize ROS
  ros::init(argc, argv, "talker");
  
  // A handle to this process' node, also initializes the node "talker"
  ros::NodeHandle n;
  
  // Advertise that we are going to be publishing std_msgs/String messages on the chatter topic to the master
  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
  
  // Specify the loop frequency, It will keep track of how long it has been since the last call to Rate::sleep().
  ros::Rate loop_rate(10);

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


  return 0;
}