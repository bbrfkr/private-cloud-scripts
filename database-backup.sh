#!/bin/bash

BACKUP_DIR=$1
TARGET_DATABASE=$2
NOTIFICATION_URL=$3
DEBUG=$4
DATE=$(date '+%Y-%m-%d')

mysqldump --databases ${TARGET_DATABASE} --flush-logs --single-transaction > ${BACKUP_DIR}/${DATE}_${TARGET_DATABASE}.sql

if [ $? -ne 0 ] ; then
    curl -XPOST -H'Content-Type:application/json' -d "{\"content\":\"failed to backup for database ${TARGET_DATABASE}!!\"}" ${NOTIFICATION_URL}
elif [ -n "${DEBUG}" ] ; then
    curl -XPOST -H'Content-Type:application/json' -d "{\"content\":\"succeeded to backup for database ${TARGET_DATABASE}.\"}" ${NOTIFICATION_URL}
fi
