#!/bin/bash -xe
TARGET_DIR=$1
BACKUP_DIR=$2
mkdir -p $BACKUP_DIR
rsync -avh --delete --backup --backup-dir="../backup-$(date +%Y%m%d-%H%M%S)" $TARGET_DIR $BACKUP_DIR/backup-latest
