for ((i=0;i<$1;i++))
do
  port=$4+$i
  cd \
  && mkdir peer2profit$i && cd peer2profit$i \
  && wget -q https://raw.githubusercontent.com/xuchengcheng926/peer2profit/main/peer2fly.sh -O peer2fly.sh \
  && chmod +x peer2fly.sh \
  #&&./peer2fly.sh --email "$2" --number "10"  --socks "socks5 $3 $4+$i"  
  echo  email "$2" "socks5 $3 $port"
done
