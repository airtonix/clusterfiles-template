#!/bin/bash

###
# Unindent print output
#
# Avoids having to mangle nicely indented code just so it prints nicely
dedent() ( echo "$1" | sed 's/^[[:space:]]*//')


###
# Create a slugerized timestamp
#
slugify_timestamp(){
    date "+%Y.%m.%d-%H.%M.%S"
}

append_uniquely() {
  # this is a more correct way to test for presence of strings in files
  # and then act on the outcome.
  cat "${1}" | grep -zqv "${2}" && {
    echo "==> ✍ Writing \"$2\" into \"$1\" "
    echo "${2}" >>"$1"
  } || {
    echo "==> ✅ '${2}' already exists in ${1}"
  }
}
