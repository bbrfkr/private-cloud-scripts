#!/bin/bash

BACKUP_DIR=$1
BACKUP_GENERATIONS=$2
DRY_RUN=$3

DELETE_FROM_DATE=$(date -d "${BACKUP_GENERATIONS} day ago" +'%Y-%m-%d')

for directory in $(ls -1 $BACKUP_DIR) ; do
    if [[ ! "${directory}" > "${DELETE_FROM_DATE}" ]] ; then
        if [ -n "${DRY_RUN}" ] ; then
            echo $BACKUP_DIR/${directory}
        else
            rm -rf $BACKUP_DIR/${directory}
        fi
    fi
done
