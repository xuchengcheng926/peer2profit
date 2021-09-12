wget --version||yum install wget -y||apt-get install wget -y
/usr/bin/neko-status -v||(wget https://github.com/nkeonkeo/nekonekostatus/releases/download/v0.1/neko-status_linux_386 -O /usr/bin/neko-status && chmod +x /usr/bin/neko-status)
mkdir /etc/neko-status/

echo "key: 49b6c954-e5d5-4f72-a450-6af23f3fffd6
port: 9000
debug: false" > /etc/neko-status/config.yaml

echo "[Unit]
Description=nekonekostatus

[Service]
Restart=always
RestartSec=5
ExecStart=/usr/bin/neko-status -c /etc/neko-status/config.yaml

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/nekonekostatus.service
systemctl daemon-reload
systemctl start nekonekostatus
systemctl enable nekonekostatus 
