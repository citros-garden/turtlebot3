#!/bin/bash
set -e

source /opt/ros/humble/setup.bash
source /workspaces/turtlebot3/install/setup.bash 

exec "$@"
