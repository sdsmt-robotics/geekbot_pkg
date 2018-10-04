#!/bin/bash
systemctl stop geekbot_bringup.service
rm -rf /etc/systemd/system/geekbot_bringup.service
link /root/geekbot_ws/src/geekbot_pkg/bringup/geekbot_bringup.service /etc/systemd/system/geekbot_bringup.service
systemctl enable /etc/systemd/system/geekbot_bringup.service
systemctl daemon-reload
systemctl start geekbot_bringup.service
