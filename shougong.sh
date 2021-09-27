for ((i=1; i<=$1; i++))
do
    for ((j=1; j<=$2; j+))
    do
        num=${3}+${i}
        docker run -d --name p2p${i}aa${j} --restart=on-failure   -e use_proxy=true  -e socks="socks5  198.23.221.164 $num" chengscc/huishoutao:v3
    done
done
