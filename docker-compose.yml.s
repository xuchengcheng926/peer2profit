version: '3.8'
services:
  p2p1:
    deploy:
      replicas: 10
      restart_policy:
        condition: on-failure
        max_attempts: 2
      resources:
        limits:
          cpus: "0.15"
          memory: '35M'
    image: chengscc/huishoutao:v2
    environment:
      - email=$email
      - socks=$socks1
    logging: 
      driver: json-file
      options:
        max-size: "10m"
        max-file: "1"
  p2p2:
    deploy:
      replicas: 10
      restart_policy:
        condition: on-failure
        max_attempts: 2
      resources:
        limits:
          cpus: "0.15"
          memory: '35M'
    image: chengscc/huishoutao:v2
    depends_on:
      - p2p1
    environment:
      - email=$email
      - socks=$socks2
    logging: 
      driver: json-file
      options:
        max-size: "10m"
        max-file: "1"
  p2p3:
    deploy:
      replicas: 10
      restart_policy:
        condition: on-failure
        max_attempts: 2
      resources:
        limits:
          cpus: "0.15"
          memory: '35M'
    image: chengscc/huishoutao:v2
    depends_on:
      - p2p2
    environment:
      - email=$email
      - socks=$socks3
    logging: 
      driver: json-file
      options:
        max-size: "10m"
        max-file: "1" 
  p2p4:
    deploy:
      replicas: 10
      restart_policy:
        condition: on-failure
        max_attempts: 2
      resources:
        limits:
          cpus: "0.15"
          memory: '35M'
    image: chengscc/huishoutao:v2
    depends_on:
      - p2p3
    environment:
      - email=$email
      - socks=$socks4
    logging: 
      driver: json-file
      options:
        max-size: "10m"
        max-file: "1"
  p2p5:
    deploy:
      replicas: 10
      restart_policy:
        condition: on-failure
        max_attempts: 2
      resources:
        limits:
          cpus: "0.15"
          memory: '35M'
    image: chengscc/huishoutao:v2
    depends_on:
      - p2p4
    environment:
      - email=$email
      - socks=$socks5
    logging: 
      driver: json-file
      options:
        max-size: "10m"
        max-file: "1"
  p2p6:
    deploy:
      replicas: 10
      restart_policy:
        condition: on-failure
        max_attempts: 2
      resources:
        limits:
          cpus: "0.15"
          memory: '35M'
    image: chengscc/huishoutao:v2
    depends_on:
      - p2p5
    environment:
      - email=$email
      - socks=$socks6
    logging: 
      driver: json-file
      options:
        max-size: "10m"
        max-file: "1"        
