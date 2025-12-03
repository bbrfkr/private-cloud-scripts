#!/bin/bash

BACKUP_DIR=$1
BACKUP_GENERATIONS=$2
DRY_RUN=$3

DELETE_FROM_DATE=$(date -d "${BACKUP_GENERATIONS} day ago" +'%Y-%m-%d')

for directory in $(find ${BACKUP_DIR} -type d) ; do
    dir_date=$(echo -n ${directory} | awk -F"${BACKUP_DIR}/" '{print $2}' | awk -F_ '{print $1}')
    if [[ ! "${dir_date}" > "${DELETE_FROM_DATE}" ]] ; then
        if [ -n "${DRY_RUN}" ] ; then
            echo ${directory}
        else
            rm -rf ${directory}
        fi
    fi
done
