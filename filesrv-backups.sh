#!/bin/bash -xe
TARGET_DIR=$1
BACKUP_DIR=$2
mkdir -p $BACKUP_DIR
rsync -avh --delete --backup --backup-dir="../backups_old/backup_$(date +%Y-%m-%d)" $TARGET_DIR $BACKUP_DIR/backup_latest
