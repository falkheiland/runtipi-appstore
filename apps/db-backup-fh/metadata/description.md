# db-backup-FH

Backup multiple database types on a scheduled basis with many customizable options.

## Usage

To be able to backup and restore databases, the db containers to be backed up have to on the same network as the db-backup-fh service (default in tipi v3.8.5).

To configure backup jobs, you have to configure them in `app-data/db-backup-fh/data/scripts-pre/backup_config.sh` and restarting the app. there is a commented section useable as a template in the script.
Consult the backup configuration [here](https://github.com/tiredofit/docker-db-backup?tab=readme-ov-file#job-backup-options).

### Jobs

To define jobs you have to use a user-config. Create a folder `user-config/db-backup-fh` with 2 files:

- docker-compose.yml

```yml
services:
  db-backup-fh:
    env_file: ./app.env
```

- app.env

```
##https://github.com/tiredofit/docker-db-backup
##default container options
#MODE=AUTO
#USER_DBBACKUP=10000
#GROUP_DBBACKUP=10000
#LOG_PATH=/logs
#TEMP_PATH=/tmp/backups/
#MANUAL_RUN_FOREVER=TRUE
#DEBUG_MODE=FALSE
#BACKUP_JOB_CONCURRENCY=1

# #job defaults
#DEFAULT_BACKUP_LOCATION=FILESYSTEM
#DEFAULT_CHECKSUM=MD5
#DEFAULT_LOG_LEVEL=notice
#DEFAULT_RESOURCE_OPTIMIZED=FALSE
#DEFAULT_SKIP_AVAILABILITY_CHECK=FALSE

# #default Compression Options
#DEFAULT_COMPRESSION=ZSTD
#DEFAULT_COMPRESSION_LEVEL=3
#DEFAULT_GZ_RSYNCABLE=FALSE
#DEFAULT_ENABLE_PARALLEL_COMPRESSION=TRUE
#DEFAULT_PARALLEL_COMPRESSION_THREADS=autodetected

# #default Scheduling Options
#DEFAULT_BACKUP_INTERVAL=1440
#DEFAULT_BACKUP_BEGIN=+0    #"2330" or "2023-12-21 23:30:00" or "30 23 * * *"
#DEFAULT_CLEANUP_TIME=FALSE #1440 would delete anything above 1 day old.

# #jobs start with "DB" followed by a 2-digit number
# # TEMPLATE:
# #job DB01: tipi
#DB01_TYPE=pgsql
#DB01_HOST=runtipi-db
#DB01_NAME=tipi
#DB01_USER=tipi
#DB01_PASS=de61ff04d6906bc2641e320e854db1d858a81df43b014f7aeacdfe9ba17ce615
#CONTAINER_ENABLE_MONITORING=FALSE
#DEFAULT_CLEANUP_TIME=1440
```

### Backup

Manual backups can be executed by using:

```bash
docker exec -it db-backup-fh bash
backup-now
```

### Restore

A Restore can be initiated by using:

```bash
docker exec -it db-backup-fh bash
restore
```

## Links

<https://github.com/tiredofit/docker-db-backup>

<https://hub.docker.com/r/tiredofit/db-backup>
