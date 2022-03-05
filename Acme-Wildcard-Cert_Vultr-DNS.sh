if [[ ! -z $(which yum) ]]; then
    yum install socat -y
elif [[ ! -z $(which apt) ]]; then
    apt install socat -y
else
    echo "Unsupported system."
    exit 1;
fi
curl https://get.acme.sh | sh -s email=my@example.com
read -p "Enter your domain: " ANSDOMAIN
read -p "Enter your Vultr API key: " ANSAPIKEY
export VULTR_API_KEY="$ANSAPIKEY"
/root/.acme.sh/acme.sh --issue --dns dns_vultr -d $ANSDOMAIN -d *.$ANSDOMAIN -k ec-256 --key-file /root/xray.key --fullchain-file /root/xray.pem --renew-hook "systemctl restart nginx xray"