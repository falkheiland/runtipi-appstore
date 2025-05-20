# docker-db-backup

Backup multiple database types on a scheduled basis with many customizable options.

## Links

<https://github.com/tiredofit/docker-db-backup>

<https://hub.docker.com/r/tiredofit/db-backup>

## Prerequisites

- Shared network between docker_db_backup and backed up container

create network `shared_docker-db-backup_network`:

```
docker network create shared_docker-db-backup_network
```

```
# docker network ls | grep shared_docker-db-backup_network
c2317150d36e   shared_docker-db-backup_network                               bridge    local
```

## Installation

- disable `Open Port` during the installation as there is no service to be exposed.

## Usage

- set network `shared_docker-db-backup_network` on all necessary containers
 
- edit docker-db-backup user-config:

  `runtipi/user-config/appstore/docker-db-backup/docker-compose.yml`

  ```
  services:
    docker-db-backup:
      networks:
        - shared_docker-db-backup_network

  networks:
    shared_docker-db-backup_network:
      external: true
  ```

  - edit tipi-compose (tipi db):

  `runtipi/user-config/tipi-compose.yml`

  ```
  services:
    runtipi-db:
      networks:
        - shared_docker-db-backup_network

  networks:
    shared_docker-db-backup_network:
      external: true
  ```

  - restart tipi:

  ```
  sudo ./runtipi-cli restart
  ```

  - edit user-configs:

  `runtipi/user-config/appstore/my-app/docker-compose.yml`

  ```
  services:
    my-app-db:
      networks:
        - shared_docker-db-backup_network

  networks:
    shared_docker-db-backup_network:
      external: true
  ```
## Jobs

To define jobs you have to use a user-config. Create a folder `user-config/{{appstore}}/docker-db-backup` with a file `docker-compose.yml`. Configure your jobs as environment vars.

Consult the backup configuration [here](https://github.com/tiredofit/docker-db-backup?tab=readme-ov-file#job-backup-options) for more.

- docker-compose.yml

```yml
services:
  docker-db-backup:
    environment:
      # DB01 tipi
      - DB01_TYPE=pgsql
      - DB01_HOST=runtipi-db
      - DB01_NAME=tipi
      - DB01_USER=tipi
      - DB01_PASS=${POSTGRES_PASSWORD}
```

## Manual Backup

Manual backups can be executed by using:

```bash
docker exec -it docker-db-backup bash
backup-now
```

## Restore

A Restore can be initiated by using:

```bash
docker exec -it docker-db-backup bash
restore
```
