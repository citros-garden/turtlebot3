#!/bin/bash
set -e

source /opt/ros/foxy/setup.bash
source /workspaces/turtlebot3/install/setup.bash 

exec "$@"
