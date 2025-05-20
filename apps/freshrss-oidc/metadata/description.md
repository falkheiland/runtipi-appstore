# FreshRSS-OIDC

FreshRSS is a self-hosted RSS feed aggregator.

It is lightweight, easy to work with, powerful, and customizable.

This version supports OIDC auth.

## Links

<https://freshrss.org/>

<https://github.com/FreshRSS/FreshRSS>

<https://hub.docker.com/r/freshrss/freshrss>

## OpenID-Connect

<https://freshrss.github.io/FreshRSS/en/admins/16_OpenID-Connect.html>


Initial Setup Process

When setting up a new FreshRSS instance with OIDC, follow these steps carefully to ensure proper administrator access:

    1. Configure your OIDC environment variables (see configuration section below)
    2. Start your FreshRSS instance
    3. Access the Web interface – it will immediately attempt to authenticate you via your OIDC provider
    4. After successful authentication, you’ll be directed to the setup wizard
    5. In the authentication setup step (currently step 4):
        Enter the exact username that matches your OIDC identity (e.g., admin@idm.example.com) as the default user
        The password field can contain any random value as it won’t be used with OIDC
        Select HTTP Authentication Method as the authentication method
        If configured correctly, you should see your current username displayed as: HTTP (for advanced users with HTTPS) (REMOTE_USER='admin@idm.example.com'). If it doesn’t, recheck your OIDC setup and the variables to avoid locking yourself out from administrator access.
    6. Complete the remaining setup steps

    ⚠️ Important: Using a random username instead of your actual OIDC identity as the default user may result in no administrator access to your instance.

## Backup

configs and sqlite are located in

```
runtipi/app-data/{{appstore}}/freshrss-oidc/data/data/users/*
```