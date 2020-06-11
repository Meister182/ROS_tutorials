#include "ros/ros.h"
#include "myRosPackage/AddTwoIntsCopy.h"  //my service created in [06] Creating a ROS message and service

// Callback function that will get called when this service is requested.
bool add(myRosPackage::AddTwoIntsCopy::Request  &req,
         myRosPackage::AddTwoIntsCopy::Response &res)
{
  res.sum = req.a + req.b;
  ROS_INFO("request: x=%ld, y=%ld", (long int)req.a, (long int)req.b);
  ROS_INFO("sending back response: [%ld]", (long int)res.sum);
  return true;
}

int main(int argc, char **argv)
{
  // Initialize the node "add_two_ints_server"
  ros::init(argc, argv, "add_two_ints_server"); 
  ros::NodeHandle n;

  // The service is created and advertised over ROS
  ros::ServiceServer service = n.advertiseService("add_two_ints", add);
  ROS_INFO("Ready to add two ints.");
  ros::spin();

  return 0;
}