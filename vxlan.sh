# Sample script to create vxlan-GPE
ip link add vxlan1 type vxlan dstport 4789 external gpe
ip link set dev vxlan1 up
ip link set vxlan1 arp off
ip addr add 10.0.0.1/24 dev vxlan1
ip route add 10.0.0.2 encap ip id 100 dst 10.253.0.7 dev vxlan1
