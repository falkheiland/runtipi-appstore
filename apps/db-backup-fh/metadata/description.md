# db-backup-FH

Backup multiple database types on a scheduled basis with many customizable options.

## Installation

During the installation from the tipi app store you will getting asked in the dialog "Install db-backup-fh" for Reverse proxy settings. This can be ignored, since db-backup-fh does not provide a web ui.

## Jobs

To be able to backup and restore databases, the db containers to be backed up have to on the same network as the db-backup-fh service (default in tipi v3.8.4).

To define jobs you have to use a user-config. Create a folder `user-config/db-backup-fh` with a file `docker-compose.yml`. Configure your jobs as environment vars.

Consult the backup configuration [here](https://github.com/tiredofit/docker-db-backup?tab=readme-ov-file#job-backup-options) for more.

- docker-compose.yml

```yml
services:
  db-backup-fh:
    pull_policy: missing
    environment:
      - CONTAINER_ENABLE_MONITORING=FALSE
      - DEFAULT_CLEANUP_TIME=1440
      # DB01 tipi
      - DB01_TYPE=pgsql
      - DB01_HOST=runtipi-db
      - DB01_NAME=tipi
      - DB01_USER=tipi
      - DB01_PASS=${POSTGRES_PASSWORD}
```

## Backup

Manual backups can be executed by using:

```bash
docker exec -it db-backup-fh bash
backup-now
```

## Restore

A Restore can be initiated by using:

```bash
docker exec -it db-backup-fh bash
restore
```

## Links

<https://github.com/tiredofit/docker-db-backup>

<https://hub.docker.com/r/tiredofit/db-backup>
