#!/bin/bash -x

### log dir
mkdir -p /var/log/squid
chown -R proxy:proxy /var/log/squid

### cache dir
mkdir -p /var/spool/squid
chown -R proxy:proxy /var/spool/squid
[[ -d /var/spool/squid/00 ]] || squid -N -z
