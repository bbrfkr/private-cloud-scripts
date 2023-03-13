#!/bin/bash

BACKUP_BASEDIR=$1
TARGET_DATABASE=$2
NOTIFICATION_URL=$3
DEBUG=$4

DATE=$(date '+%Y/%m/%d')
BACKUP_DIR=${BACKUP_BASEDIR}/${DATE}

mkdir -p ${BACKUP_DIR}
mysqldump --databases ${TARGET_DATABASE} --flush-logs --single-transaction > ${BACKUP_DIR}/${TARGET_DATABASE}.sql

if [ $? -ne 0 ] ; then
    curl -XPOST -d "{\"content\":\"failed to backup for database ${TARGET_DATABASE}!!\"}" ${NOTIFICATION_URL}
elif [ -n "${DEBUG}" ]
    curl -XPOST -d "{\"content\":\"succeeded to backup for database ${TARGET_DATABASE}.\"}" ${NOTIFICATION_URL}
fi
