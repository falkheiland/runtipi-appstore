# Nextcloud-FPM

Nextcloud server, a safe home for all your data.

Remote collaboration made easy.

php-fpm version

## Links

<https://nextcloud.com/>

<https://github.com/nextcloud/server>

<https://hub.docker.com/_/nextcloud>

## Installation

Due to tipi's nature of handling the APP_DOMAIN environment variable and the way Nextcloud handles trusted domains and virtual host, it is important to install Nextcloud-FPM by using either:

- Expose app on local network

or

- Expose app on the internet

You can change the apps behavior by editing `runtipi/app-data/nextcloud-fpm/data/nextcloud-fpm/config/config.php` afterwards
