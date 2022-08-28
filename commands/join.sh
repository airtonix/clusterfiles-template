#!/bin/bash

. "${HERE}/core/os.sh"

op_command_join() {
    arg_required "$1" "1: Missing ssh user"
    arg_required "$2" "2: Missing ssh host"
    arg_required "$3" "3: Missing ssh key"

    k3sup join --host "$1" --user "$2" --ssh-key "$3"
}
