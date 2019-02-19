#!/bin/sh
set -exu
SSH_AUTH_SOCK=/tmp/auth.sock
export SSH_AUTH_SOCK
echo $@
USER=$1
HOST=$2
PORT=$3
socat UNIX-LISTEN:${SSH_AUTH_SOCK} TCP-CONNECT:${HOST}:${PORT} &
ssh -o BatchMode=yes -o StrictHostKeyChecking=no ${USER}@${HOST} id;\
