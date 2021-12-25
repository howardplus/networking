# Sample script to create wireguard interface
cat <<EOT >> wg0.conf
wg0.conf:
echo 
[Interface]
ListenPort=51820
PrivateKey=oDRhHAZJaXfh2pL2GqnmKNGxhxszHa4TTJ4FMZtT0mY=

[Peer]
AllowedIPS=0.0.0.0/0
PublicKey=EnYK8BLTd5pv2bNpn0sk7SJSC7CV8IbRnw79FpjLRG8=
Endpoint=10.253.8.6:51840
EOT

ip link add dev wg0 type wireguard
ip addr add dev wg0 10.1.0.1 peer 10.1.0.2
wg setconf wg0 ./wg0.conf
ip link set dev wg0 up
