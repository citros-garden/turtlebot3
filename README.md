# General Information 🌍
This repository contains a ROS workspace of [Turtlebot3 ARM](https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/#pc-setup).

# Installation 🛫

Clone the repository:

             git clone git@github.com:citros-garden/turtlebot3.git

and then open the workspace in a container with VSCode `reopen in container` option.  

# Build :tractor:

Use the `VSCode tasks` to build, just run the `build` task.


# Run 🚀
Use the `VSCode tasks` to launch, currently there are 3 options:

1. `launch-empty` - launching turtlebot3 in an empty world.
2. `launch-3d-world` - launching turtlebot3 in an 3D world.
3. `launch-house` - launching turtlebot3 in a house.

Before launching, the system builds the ROS workspace, so no need to use `colcon build` and source the workspace before.


# Develop :bulb:
Add your custom nodes in a dedicated package, add the relevant launch file.

# Extras :eyes:
Images / Videos from Foxglove