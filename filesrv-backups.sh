. /root/venv/bin/activate
. /root/admin.openrc
cd /share/smb

# segment size 256MiB
swift upload --segment-size 268435456 filesrv-backups .
