# db-backup-FH

Backup multiple database types on a scheduled basis with many customizable options.

## Usage

To be able to backup and restore databases, the db containers to be backed up have to on the same network as the db-backup-fh service (default in tipi v3.8.5).

To configure backup jobs, you have to configure them in `app-data/db-backup-fh/data/scripts-pre/backup_config.sh`. there is a commented section useable as a template in the script.
Consult the backup configuration [here](https://github.com/tiredofit/docker-db-backup?tab=readme-ov-file#job-backup-options).

Manual backups can be executed by using:

```bash
docker exec -it db-backup-fh bash
backup-now
```

A Restore can be initiated by using:

```bash
docker exec -it db-backup-fh bash
restore
```

## Links

<https://github.com/tiredofit/docker-db-backup>

<https://hub.docker.com/r/tiredofit/db-backup>
