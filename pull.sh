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

CLUSTERFILES="$HOME/.clusterfiles"

if [ -d $CLUSTERFILES ]; then
  cd $CLUSTERFILES;
  git pull
else
  git clone git@github.com:airtonix/clusterfiles.git $CLUSTERFILES
  cd $CLUSTERFILES
fi

#
# ensure the bin is executable
chmod +x ./clusterfiles

echo "export PATH=\$PATH:$CLUSTERFILES" >> ~/.zshrc

log "Done"
