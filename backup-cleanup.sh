#!/bin/bash

BACKUP_BASEDIR=$1
BACKUP_GENERATIONS=$2
DRY_RUN=$3

DELETE_FROM_DATE=$(date -d "${BACKUP_GENERATIONS} day ago" +'%Y/%m/%d')

for dir in $(find ${BACKUP_BASEDIR} -type d) ; do
    dir_date=${dir#"${BACKUP_BASEDIR}/"} 
    if [[ ! "${dir_date}" > "${DELETE_FROM_DATE}" ]] ; then
        if [ -n "${DRY_RUN}" ] ; then
            echo ${dir}
        else
            echo "exec!"
        fi
    fi
done
