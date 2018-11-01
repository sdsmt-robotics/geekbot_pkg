#!/bin/bash

echo "Deleting and re-cloning geekbot_pkg..."
rm -rf /root/geekbot_ws/src/geekbot_pkg
mkdir /root/geekbot_ws/src/geekbot_pkg
git clone https://github.com/sdsmt-robotics/geekbot_pkg.git /root/geekbot_ws/src/geekbot_pkg

echo "Rebuilding workspace..."
catkin_make

echo "Reinstalling system services..."
/root/geekbot_ws/src/geekbot_pkg/bringup/update_service.sh

echo "Should be good to go! Please restart the robot." 
