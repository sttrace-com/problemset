#!/bin/bash

# Start sshd in background
/usr/sbin/sshd -D &

# Reset password
[ -n "${ADMIN_PASS}" ] && echo "admin:$ADMIN_PASS" | chpasswd
[ -n "${USER_PASS}" ] && echo "ubuntu:${USER_PASS}" | chpasswd


[ -f "./home/admin/entrypoint.sh" ] && ./home/admin/entrypoint.sh

wait -n