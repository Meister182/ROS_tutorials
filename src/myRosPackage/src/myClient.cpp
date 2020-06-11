#include "ros/ros.h"
#include "myRosPackage/AddTwoIntsCopy.h"
#include <cstdlib>

int main(int argc, char **argv)
{
  // Verify input
  ros::init(argc, argv, "add_two_ints_client");
  if (argc != 3)
  {
    ROS_INFO("usage: add_two_ints_client X Y");
    return 1;
  }

  // Creates a client for the add_two_ints service.
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<myRosPackage::AddTwoIntsCopy>("add_two_ints");

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

  return 0;
}