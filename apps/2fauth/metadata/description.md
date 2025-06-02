# 2FAuth

A Web app to manage your Two-Factor Authentication (2FA) accounts and generate their security codes

2FAuth is a web based self-hosted alternative to One Time Passcode (OTP) generators like Google Authenticator, designed for both mobile and desktop.

## Links

<https://docs.2fauth.app>

<https://github.com/Bubka/2FAuth>

<https://hub.docker.com/r/2fauth/2fauth>

## Configuration

Since the container runs without root as user 1000:1000, you need to fix the ownership and permissions of that directory:

<https://docs.2fauth.app/getting-started/installation/docker/docker-cli/#docker-cli-setup>

```bash
sudo chown 1000:1000 ~/runtipi/app-data/falkheiland/2fauth/data/
sudo chmod 700 ~/runtipi/app-data/falkheiland/2fauth/data/
```
