mkdir proxylogs
curl -L https://mirrors.host900.com/https://raw.githubusercontent.com/snail007/goproxy/master/install_auto.sh | bash
for ((i=0;i<$1;i++))
do
  port=$(($3+5000))
  logdir="proxylogs/"proxy$port".log"
  proxy socks -t tcp -p "0.0.0.0:$port" -T tcp -P "$2:$port"  --udp-port 0 --udp --forever --log $logdir --daemon
done
