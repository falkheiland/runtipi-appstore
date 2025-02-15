#!/bin/bash

# #https://github.com/tiredofit/docker-db-backup
# #default container options
# export MODE=AUTO
# export USER_DBBACKUP=10000
# export GROUP_DBBACKUP=10000
# export LOG_PATH=/logs
# export TEMP_PATH=/tmp/backups/
# export MANUAL_RUN_FOREVER=TRUE
# export DEBUG_MODE=FALSE
# export BACKUP_JOB_CONCURRENCY=1

# #job defaults
# export DEFAULT_BACKUP_LOCATION=FILESYSTEM
# export DEFAULT_CHECKSUM=MD5
# export DEFAULT_LOG_LEVEL=notice
# export DEFAULT_RESOURCE_OPTIMIZED=FALSE
# export DEFAULT_SKIP_AVAILABILITY_CHECK=FALSE

# #default Compression Options
# export DEFAULT_COMPRESSION=ZSTD
# export DEFAULT_COMPRESSION_LEVEL=3
# export DEFAULT_GZ_RSYNCABLE=FALSE
# export DEFAULT_ENABLE_PARALLEL_COMPRESSION=TRUE
# export DEFAULT_PARALLEL_COMPRESSION_THREADS=autodetected

# #default Scheduling Options
# export DEFAULT_BACKUP_INTERVAL=1440
# export DEFAULT_BACKUP_BEGIN=+0    #"2330" or "2023-12-21 23:30:00" or "30 23 * * *"
# export DEFAULT_CLEANUP_TIME=FALSE #1440 would delete anything above 1 day old.

# #jobs start with "DB" followed by a 2-digit number
# # TEMPLATE:
# #job DB01: tipi
# export DB01_TYPE=pgsql
# export DB01_HOST=runtipi-db
# export DB01_NAME=tipi
# export DB01_USER=tipi
# export DB01_PASS=de61ff04d6906bc2641e320e854db1d858a81df43b014f7aeacdfe9ba17ce615
# export CONTAINER_ENABLE_MONITORING=FALSE
# export DEFAULT_CLEANUP_TIME=1440
