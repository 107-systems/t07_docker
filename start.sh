#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: sudo ./docker-run.sh [t07.py | t07_4wd.py | t07_tracked.py]"
  exit 1
fi

cd /tmp/colcon_ws
. /opt/ros/humble/setup.sh
. install/setup.sh
ros2 launch t07_robot $1
