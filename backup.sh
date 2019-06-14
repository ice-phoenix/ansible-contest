#!/bin/bash
# Basic snapshot-style rsync backup script
# rsync -avzR --rsync-path='sudo rsync' ubuntu@monadic-lab.org:{/var/log,/var/persistent,/webapps/,/etc/} ./backup

# Config
OPT="-avzR"
SNAP="/home/dranov/snapshots"
LAST="$SNAP/last"
LINK="--link-dest=$LAST/" # keep trailing slash
SRC="ubuntu@monadic-lab.org:{/var/log/,/var/persistent/,/webapps/,/etc/}"
date=`date "+%Y-%b-%d_%T"`

# Ensure snap dir exists
mkdir -p $SNAP

# Run rsync to create snapshot
rsync "$OPT" --rsync-path='sudo rsync' "$LINK" "$SRC" "${SNAP}/$date"

# Remove symlink to previous snapshot
rm -f $LAST

# Create new symlink to latest snapshot for the next backup to hardlink
ln -s ${SNAP}/$date $LAST