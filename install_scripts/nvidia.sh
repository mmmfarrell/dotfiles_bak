# For NVIDIA stuff
sudo apt install -y mokutil

# Change drivers from "Software & Updates"
# Go to "Software & Updates", "Additional Drivers",
# And select "Using NVIDIA driver ..." then "Apply Changes"
# Test install by typing "nvidia-smi"
nvidia-smi

# Fix weird Touchpad
sudo apt install -y xserver-xorg-input-libinput
sudo apt remove -y --purge xserver-xorg-input-synaptics

# Battery life
sudo apt update
sudo apt install -y tlp tlp-rdw powertop
sudo tlp start
sudo powertop --auto-tune

# Remember you can always switch between intel and nvidia gpu for battery with
# sudo prime-select intel
# sudo prime-select nvidia

# Remember to reboot now
sudo reboot

# CUDA stuff
# PreReqs
sudo apt install -y g++ freeglut3-dev build-essential libx11-dev libxmu-dev \
     libxi-dev libglu1-mesa libglu1-mesa-dev
sudo apt install -y gcc-6 g++-6

# Just to be sure we should make a file to blacklist the nouveau driver
# File: /etc/modprobe.d/blacklist-nouveau.conf
# blacklist nouveau
# options nouveau modeset=0

# We already installed the drivers, so hopefully this works

# cd ~/installed_stuff/nvidia
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
chmod +x cuda_9.0.176_384.81_linux-run 
sudo ./cuda_9.0.176_384.81_linux-run --override

# Answer the following questions
# accept - EULA
# Yes - You are attempting to install on an unsupported config. Wish to cont?
# No - Install NVIDIA Accel Graphics Driver for Linux-x86_64 ...
# Yes - Install CUDA 9.0 Toolkit
# (default) - location
# Yes - create symbolic links
# y/n - install cuda samples

# Put these lines in bashrc
export PATH=${PATH}:/usr/local/cuda-9.0/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-9.0/lib64

# To uninstall run the uninstall script in /usr/local/cuda-9.0/bin

# Now install CuDNN 7.0 (just make sure it goes with cuda 9)
# have to go to developer website
# https://developer.nvidia.com/cudnn 
# then untar it
# tar -xzvf ${CUDNN_FILE}
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-9.0/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-9.0/lib64/
sudo chmod a+r /usr/local/cuda-9.0/lib64/libcudnn*

# Something else you need to install
sudo apt install -y nvidia-cuda-toolkit

# Test install with 
nvidia-smi
nvcc -V

# To test tensorflow gpu setup (add add visible gpu which takes forever)
# import tensorflow as tf
# with tf.device('/gpu:0'):
#     a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
#     b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
#     c = tf.matmul(a, b)

# with tf.Session() as sess:
#     print (sess.run(c))
