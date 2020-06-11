#include "ros/ros.h"            // the most common public pieces of the ROS system
#include "std_msgs/String.h"    // a message from the std_msgs package

// Callback function that will get called when a new message has arrived on the chatter topic.
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s]", msg->data.c_str());
}

int main(int argc, char **argv)
{
  // Initialize ROS
  ros::init(argc, argv, "listener");
  
  // A handle to this process' node, also initializes the node "listener"
  ros::NodeHandle n;

  // Subscribe to the chatter topic
  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);

  // ros::spin() enters a loop, calling message callbacks as fast as possible.
  ros::spin();
  // ros::spin() will exit once ros::ok() returns false, which means ros::shutdown() has been called.

  return 0;
}