FROM althack/ros2:foxy-cuda-gazebo-nvidia

ENV ROS_DISTRO foxy

# install utils
RUN apt-get update && DEBIAN_FRONTEND=noninteractive  && apt-get install -y  --no-install-recommends\
    autoconf \
    automake \
    libtool \
    make \
    g++ \
    unzip \
    libprotobuf-dev \
    wget \
    openssh-server \
    curl \
    gnupg \
    git \
    build-essential \
    cmake \
    gdb-multiarch \
    default-jre \
    python3 \
    python3-setuptools \
    python3-pip \
    python3-venv \
    ros-foxy-rosbridge-suite \    
    && rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update && apt-get install -y \
    ros-$ROS_DISTRO-rosbag2-storage-mcap \
    ros-$ROS_DISTRO-rosbag2 \
    ros-$ROS_DISTRO-ros-base \
    ros-$ROS_DISTRO-ros2bag \
    ros-$ROS_DISTRO-rosbag2-transport \
    && rm -rf /var/lib/apt/lists/* 

RUN apt-get update \
   && apt-get -y install --no-install-recommends ros-foxy-gazebo-*\
   ros-foxy-cartographer \
   ros-foxy-cartographer-ros \
   ros-foxy-navigation2 \
   ros-foxy-nav2-bringup \
   ros-foxy-dynamixel-sdk \
   ros-foxy-turtlebot3-msgs \
   ros-foxy-turtlebot3 \
   #
   # Clean up
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*

RUN echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc

RUN  pip install mcap-ros2-support

WORKDIR /workspaces/turtlebot3
COPY . .
RUN . /opt/ros/foxy/setup.sh
RUN rm -rf build install log
RUN colcon build --symlink-install

RUN pip install citros

RUN chmod +x ros2_entrypoint.sh
ENTRYPOINT ["/workspaces/turtlebot3/ros2_entrypoint.sh"]

CMD ["bash"]