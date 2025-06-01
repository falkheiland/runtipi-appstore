# Vaultwarden

Unofficial Bitwarden compatible server written in Rust, formerly known as bitwarden_rs

An alternative server implementation of the Bitwarden Client API, written in Rust and compatible with official Bitwarden clients, perfect for self-hosted deployment where running the official resource-heavy service might not be ideal.

## Links

<https://github.com/dani-garcia/vaultwarden>

<https://github.com/dani-garcia/vaultwarden/pkgs/container/vaultwarden>

## KB

Using argon2:

```sh
sudo apt install argon2

echo -n '!MySecretPassword' | argon2 "$(openssl rand -hex 16)" -e -id -t 3 -m 16 -p 4 | sed 's/\$/\$\$/g'
$$argon2id$$v=19$$m=65536,t=3,p=4$$YWJhN2Y5MzA1NTg0ZDk4NDYwZDE5YzQxYTY2ZWQ3ZTI$$e5dMRGT8k2p6ceB/jRFRqOh4RwGIj9Oxpusutf6VUc
```
