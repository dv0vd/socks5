useradd -m "$SOCKS_USERNAME"
echo "$SOCKS_USERNAME:$SOCKS_PASSWORD" | chpasswd
adduser "$SOCKS_USERNAME" sudo

danted -f /app/dante.conf

