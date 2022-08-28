#!/bin/sh
# Stop unpredictible behavior
set -o errexit # Exit on most errors
set -o nounset # Disallow expansion of unset variables


log () {
    prefix='[CLUSTERFILES-INSTALL]'
    timestamp=$(date +%y/%m/%d_%H:%M:%S)
    echo "$prefix $timestamp :: ${*}"
}

info () {
    [ -n "${VERBOSE}" ] && log "${*}"
}


log "Start"

CLUSTERFILES=~/.clusterfiles

if [ -d $CLUSTERFILES ]; then
  cd $CLUSTERFILES;
  git pull
else
  git clone https://github.com/airtonix/clusterfiles.git $CLUSTERFILES
  cd $CLUSTERFILES
fi

chmod +x ./clusterfiles

echo "export PATH=\$PATH:$CLUSTERFILES" >> ~/.zshrc

log "Done"
