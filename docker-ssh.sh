#!/bin/bash
set -eux
echo ${SSH_AUTH_SOCK}
port=$1
shift
ssh-add
trap 'kill $(jobs -p) 2>/dev/null||true' EXIT
socat TCP-LISTEN:${port},reuseaddr UNIX:${SSH_AUTH_SOCK}  &
sleep 0.1
$@
