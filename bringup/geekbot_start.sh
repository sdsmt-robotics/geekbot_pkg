source /opt/ros/kinetic/setup.bash
source /root/geekbot_ws/devel/setup.bash

ETH_IP=$(ifconfig | grep "inet addr:10" | awk '/inet addr/{print substr($2,6)}') #look for an IP in the 10.xx.xxx.xxx range
if [ ${#ETH_IP} -lt 7 ]															 #this is standard Ubuntu's DHCP server
then
	while [ ${#ETH_IP} -lt 7 ]; do #if the value of ETH_IP is less than 7 chars 
		echo "Could not detect an IP address assigned to Geekbot, retrying...."
		sleep 1
		ETH_IP=$(ifconfig | grep "inet addr:10" | awk '/inet addr/{print substr($2,6)}')
	done
fi

ETH_GATEWAY=${ETH_IP%.*}.1 #scrape the gateway/host in our case from ETH_IP

echo "Geekbot IP:  $ETH_IP"
echo "Geekbot gateway: $ETH_GATEWAY"

# local robot env vars
export ROS_IP=$ETH_IP
export ROS_MASTER_URI=http://$ETH_IP:11311

roslaunch geekbot_pkg geekbot_launch.launch
