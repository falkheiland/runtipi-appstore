# runtipi-appstore

This is the repository for my Custom Tipi App Store.

## Usage

- log in to your tipi instance and go to Settings -> App Stores.
- `Add App Store`
- Choose a `Appstore name` ( if you are using my [user-config](https://github.com/falkheiland/user-config) use `falkheiland` )
- Set `Appstore URL` to `https://github.com/falkheiland/runtipi-appstore/tree/prod`
- go to App Stores -> Select an AppStore and mark the added store to get to my apps

## Apps

| Name             | Description                                                                                             | Website                                       | In maintenance | Port |
| ---------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------- | -------------- | ---- |
| Arkanum          | An opinionated VS Code distribution.                                                                    | https://arkanum.dev                           | yes            | 8153 |
| Authentik        | The authentication glue you need.                                                                       | https://goauthentik.io                        | yes            | 9000 |
| Cup              | The easiest way to check for your container updates.                                                    | https://cup.sergi0g.dev                       | yes            | 9004 |
| docker-db-backup | Backup databases.                                                                                       | https://github.com/tiredofit/docker-db-backup | yes            | n.a. |
| Dozzle           | Realtime log viewer for containers. Supports Docker, Swarm and K8s.                                     | https://dozzle.dev                            | yes            | 9005 |
| FreshRSS-OIDC    | FreshRSS is a self-hosted RSS feed aggregator. OIDC support.                                            | https://freshrss.org                          | yes            | 9003 |
| Nextcloud-FPM    | Nextcloud server, a safe home for all your data. php-fpm version.                                       | https://nextcloud.com                         | yes            | 9002 |
| WUD              | WUD (aka What's up Docker?) gets you notified when a new version of your Docker Container is available. | https://getwud.github.io/wud                  | no             | 9001 |

## Branches

- `prod`: this is the main branch for the use in the app store
- `dev`: development branch, used for new apps and features, also fixes
- `official`: this is a copy of the official app store

## Contribution

Issues and PRs are welcome.

## Contact

use channel `appstores/falk's appstore` on the [Runtipi Discord](https://discord.gg/Bu9qEPnHsc).