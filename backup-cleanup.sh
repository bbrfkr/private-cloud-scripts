#!/bin/bash

BACKUP_DIR=$1
BACKUP_GENERATIONS=$2
DRY_RUN=$3

DELETE_FROM_DATE=$(date -d "${BACKUP_GENERATIONS} day ago" +'%Y-%m-%d')

for file in $(find ${BACKUP_DIR} -type f) ; do
    file_date=$(echo -n ${file} | awk -F '[_]' '{print $1}')
    if [[ ! "${file_date}" > "${DELETE_FROM_DATE}" ]] ; then
        if [ -n "${DRY_RUN}" ] ; then
            echo ${file}
        else
            echo "exec!"
        fi
    fi
done
