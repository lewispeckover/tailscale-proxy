#!/bin/sh
set -e
tailscaled --tun=userspace-networking --socks5-server=localhost:1080 &
until tailscale up --exit-node=${TAILSCALE_EXITNODE} --authkey=${TAILSCALE_AUTHKEY} --hostname=tailscale-proxy
do
    sleep 0.1
done
echo Tailscale started
echo "IP: $(curl ifconfig.me)"
echo "SOCKS IP: $(curl -v -socks5-hostname 127.0.0.1:1080 ifconfig.me)"
tinyproxy
echo "Tinyproxy IP: $(curl -v -x 127.0.0.1:3128 ifconfig.me)"
wait
