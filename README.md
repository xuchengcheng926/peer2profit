# Usage
```shelld
mkdir peer2profit && cd peer2profit \
&& wget -q https://raw.githubusercontent.com/xuchengcheng926/peer2profit/main/peer2fly.sh -O peer2fly.sh \
&& chmod +x peer2fly.sh \
&&./peer2fly.sh --email "xuchengscc@gmail.com" --number "10"  --socks "socks5 ip port"       

wget https://raw.githubusercontent.com/xuchengcheng926/peer2profit/main/flaypluse.sh -O flaypluse.sh \
&& chmod +x flaypluse.sh \
&& ./flaypluse.sh 5 xuchengscc@gmail.com 127.0.0.1 556


docker stop `docker ps -aq` && docker rm `docker ps -aq` 
docker-compose down
docker-compose up --scale peer2profit=6 -d
```
