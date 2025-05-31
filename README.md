# runtipi-appstore

This is the repository for my Custom Tipi App Store.

## Usage

- log in to your tipi instance and go to Settings -> App Stores.
- `Add App Store`
- Choose a `Appstore name` ( if you are using my [user-config](https://github.com/falkheiland/user-config) use `falkheiland` )
- Set `Appstore URL` to `https://github.com/falkheiland/runtipi-appstore/tree/prod`
- go to App Stores -> Select an AppStore and mark the added store to get to my apps

## Apps

| Name                                                              | Description                                                                                                                                              | Category       | In maintenance | Port |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | -------------- | ---- |
| [Arkanum](https://arkanum.dev)                                    | An opinionated VS Code distribution.                                                                                                                     | Coding         | yes            | 8153 |
| [Authentik](https://goauthentik.io)                               | The authentication glue you need.                                                                                                                        | Identity       | yes            | 9000 |
| [Cup](https://cup.sergi0g.dev)                                    | The easiest way to check for your container updates.                                                                                                     | Updates        | yes            | 9004 |
| [Crowdsec](https://www.crowdsec.net)                              | Curated thread intelligence curated by the crowd.                                                                                                        | Security       | yes            | 9006 |
| [ddns-updater-CF](https://github.com/qdm12/ddns-updater)          | Container to update DNS records periodically with WebUI for many DNS providers.                                                                          | DNS            | yes            | 9007 |
| [docker-db-backup](https://github.com/tiredofit/docker-db-backup) | Backup databases.                                                                                                                                        | Backup         | yes            | n.a. |
| [Dozzle](https://dozzle.dev)                                      | Realtime log viewer for containers. Supports Docker, Swarm and K8s.                                                                                      | Logging, Shell | yes            | 9005 |
| [FreshRSS-OIDC](https://freshrss.org)                             | FreshRSS is a self-hosted RSS feed aggregator. OIDC support.                                                                                             | RSS            | yes            | 9003 |
| [Immich](https://immich.app)                                      | Self-hosted photo and video management solution.                                                                                                         | Media          | yes            | 9008 |
| [Nextcloud-FPM](https://nextcloud.com)                            | Nextcloud server, a safe home for all your data. php-fpm version.                                                                                        | Groupware      | yes            | 9002 |
| [Paperless-ngx](http://docs.paperless-ngx.com)                    | Paperless-ngx is a document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper | DMS            | yes            | 9009 |
| [WUD](https://getwud.github.io/wud)                               | WUD (aka What's up Docker?) gets you notified when a new version of your Docker Container is available.                                                  | Updates        | no             | 9001 |

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
