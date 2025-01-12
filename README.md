# Simple SOCKS5 server
To run a SOCKS5 server, execute the following command:
```
podman run -d --name socks5 -p 60000:1080 --restart unless-stopped --memory=128M --cpus=0.25 docker.io/dv0vd/socks5
```

Default Credentials:
- Default user is `user`  
- Default password is `password`

It is strongly recommended to specify your own custom credentials. You can set these using the environment variables **SOCKS_USERNAME** and **SOCKS_PASSWORD**:
```
podman run -d -e SOCKS_USERNAME=custom_username -e SOCKS_PASSWORD=custom_password --name socks5 -p 60000:1080 --restart unless-stopped --memory=128M --cpus=0.25 docker.io/dv0vd/socks5
```

Inside the container, you can view some basic logs (connect/disconnect) with the following command:
```
podman logs -f socks5
```

If you encounter IPv6 errors, you will need to create a custom network with IPv6 support:
```
podman network create --ipv6 podman_network
```
Then, specify the network in the `podman run` command:
```
podman run -d --name socks4 --network podman_network -p 60000:1080 --restart unless-stopped --memory=128M --cpus=0.25 docker.io/dv0vd/socks4
```