adduser -D -h /home/"$SOCKS_USERNAME" "$SOCKS_USERNAME"
echo "$SOCKS_USERNAME:$SOCKS_PASSWORD" | chpasswd

EXT_IP=$(ip -4 addr show | awk '/inet/ && !/127.0.0.1/ {print $2}' | cut -d/ -f1 | head -n1)
sed "s/__EXTERNAL_IP__/$EXT_IP/" /app/dante_env.conf > /app/dante.conf

sockd -f /app/dante.conf