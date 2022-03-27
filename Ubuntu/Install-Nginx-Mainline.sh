wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
if [[ -r /etc/os-release ]]; then
    . /etc/os-release
    echo 'deb http://nginx.org/packages/mainline/ubuntu/ $VERSION_CODENAME nginx'  >> /etc/apt/sources.list
    echo 'deb-src http://nginx.org/packages/mainline/ubuntu/ $VERSION_CODENAME nginx' >> /etc/apt/sources.list
else
    echo "Not running a distribution with /etc/os-release available"
    exit 1;
fi
apt update -y
apt install nginx -y