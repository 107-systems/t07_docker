#!/bin/sh
cd /tmp/colcon_ws
. /opt/ros/humble/setup.sh
. install/setup.sh
ros2 launch t07_robot robot.py
