## [00] Setting up Ros

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


- #### Following along | Ros tutorials : http://wiki.ros.org/ROS/Tutorials