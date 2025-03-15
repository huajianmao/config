LOCAL_PORT=12345
DESTINATION_IP=1.1.1.1:8888

sudo iptables -t nat -A PREROUTING -p tcp --dport $LOCAL_PORT -j DNAT --to-destination $DESTINATION_IP
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
