#!/bin/bash

log () {
    prefix='[CLUSTERFILES-INSTALL]'
    echo "$prefix $(slugify_timestamp) :: ${*}"
}

trivial () {
    [ -n "${VERBOSE}" ] && log "✍️ ${*}"
}

info () {
    log "💬 ${*}"
}

warn () {
    log "💢 ${*}"  >&2
}

error () {
     log "💥 ${*}" >&2
     exit 1
}
