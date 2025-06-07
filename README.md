# runtipi-appstore

This is the repository for my Custom Tipi App Store.

## Usage

- log in to your tipi instance and go to Settings -> App Stores.
- `Add App Store`
- Choose a `Appstore name` ( if you are using my [user-config](https://github.com/falkheiland/user-config) use `falkheiland` )
- Set `Appstore URL` to `https://github.com/falkheiland/runtipi-appstore/tree/prod`
- go to App Stores -> Select an AppStore and mark the added store to get to my apps

## Apps

| Name                                                              | Description                                                                                                                                              | Category        | In maintenance | Port |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | -------------- | ---- |
| [2FAuth](https://docs.2fauth.app)                                 | A Web app to manage your Two-Factor Authentication (2FA) accounts and generate their security codes.                                                     | 2FA             | yes            | 9011 |
| [Arkanum](https://arkanum.dev)                                    | An opinionated VS Code distribution.                                                                                                                     | Coding          | yes            | 8153 |
| [Authentik](https://goauthentik.io)                               | The authentication glue you need.                                                                                                                        | Identity        | yes            | 9000 |
| [Bookstack](https://www.bookstackapp.com)                         | A platform to create documentation/wiki content built with PHP & Laravel need.                                                                           | Wiki            | yes            | 9012 |
| [Cup](https://cup.sergi0g.dev)                                    | The easiest way to check for your container updates.                                                                                                     | Updates         | yes            | 9004 |
| [Crowdsec](https://www.crowdsec.net)                              | Curated thread intelligence curated by the crowd.                                                                                                        | Security        | yes            | 9006 |
| [ddns-updater-CF](https://github.com/qdm12/ddns-updater)          | Container to update DNS records periodically with WebUI for many DNS providers.                                                                          | DNS             | yes            | 9007 |
| [docker-db-backup](https://github.com/tiredofit/docker-db-backup) | Backup databases.                                                                                                                                        | Backup          | yes            | n.a. |
| [Dozzle](https://dozzle.dev)                                      | Realtime log viewer for containers. Supports Docker, Swarm and K8s.                                                                                      | Logging, Shell  | yes            | 9005 |
| [FreshRSS-OIDC](https://freshrss.org)                             | FreshRSS is a self-hosted RSS feed aggregator. OIDC support.                                                                                             | RSS             | yes            | 9003 |
| [Home Assistant](https://www.home-assistant.io)                   | Open source home automation that puts local control and privacy first. aggregator. OIDC support.                                                         | Home automation | yes            | 9012 |
| [Immich](https://immich.app)                                      | Self-hosted photo and video management solution.                                                                                                         | Media           | yes            | 9008 |
| [IT-Tools](https://it-tools.tech)                                 | Collection of handy online tools for developers, with great UX.                                                                                          | Tools           | yes            | 9013 |
| [Jellyfin](https://jellyfin.org)                                  | The Free Software Media System - Server Backend & API                                                                                                    | Media           | yes            | 9014 |
| [Joplin](https://joplinapp.org)                                   | Joplin - the privacy-focused note taking app with sync capabilities for Windows, macOS, Linux, Android and iOS.                                          | Note taking     | yes            | 9015 |
| [Linkwarden](https://linkwarden.app)                              | Bookmark Preservation for Individuals and Teams                                                                                                          | Bookmarks       | yes            | 9016 |
| [MeTube](https://github.com/alexta69/metube)                      | Self-hosted YouTube downloader (web UI for youtube-dl / yt-dlp)                                                                                          | Media           | yes            | 9017 |
| [Moodist](https://moodist.app)                                    | Ambient sounds for focus and calm.                                                                                                                       | Media           | yes            | 9018 |
| [Navidrome](https://navidrome.org")                               | Your Personal Streaming Service"                                                                                                                         | Media           | yes            | 9019 |
| [Nextcloud-FPM](https://nextcloud.com)                            | Nextcloud server, a safe home for all your data. php-fpm version.                                                                                        | Groupware       | yes            | 9002 |
| [NocoDB](https://nocodb.com)                                      | Open Source Airtable Alternative                                                                                                                         | Data            | yes            | 9020 |
| [Paperless-ngx](https://docs.paperless-ngx.com)                   | Paperless-ngx is a document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper | DMS             | yes            | 9009 |
| [Pinchflat](https://github.com/kieraneglin/pinchflat)             | Your next YouTube media manager                                                                                                                          | Media           | yes            | 9021 |
| [SearXNG](https://docs.searxng.org)                               | Privacy-respecting, hackable metasearch engine                                                                                                           | Search Engine   | yes            | 9022 |
| [Vaultwarden](https://github.com/dani-garcia/vaultwarden)         | Unofficial Bitwarden compatible server written in Rust, formerly known as bitwarden_rs                                                                   | Secrets         | yes            | 9010 |
| [WUD](https://getwud.github.io/wud)                               | WUD (aka What's up Docker?) gets you notified when a new version of your Docker Container is available.                                                  | Updates         | no             | 9001 |

## Branches

- `prod`: this is the main branch for the use in the app store
- `dev`: development branch, used for new apps and features, also fixes
- `official`: this is a copy of the official app store

## Contribution

Issues and PRs are welcome.

## Contact

use channel `appstores/falk's appstore` on the [Runtipi Discord](https://discord.gg/Bu9qEPnHsc).

## License

This project is licensed under the GNU GENERAL PUBLIC LICENSE.
