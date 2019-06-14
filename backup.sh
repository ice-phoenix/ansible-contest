#!/usr/bin/env sh
rsync -avzR --rsync-path='sudo rsync' ubuntu@monadic-lab.org:{/var/log,/var/persistent,/webapps/} ./backup
