# Install ROS Melodic.
# Following steps from http://wiki.ros.org/melodic/Installation/Ubuntu

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Update and install
sudo apt-get update
sudo apt-get -y install ros-melodic-desktop-full

# Initialize rosdep
sudo rosdep init
rosdep update

# Dependencies for build packages (optional?)
sudo apt-get -y install python-rosinstall python-rosinstall-generator python-wstool build-essential
