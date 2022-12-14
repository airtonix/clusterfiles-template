#!/bin/bash

. "${HERE}/core/os.sh"

op_command_master_help() {
    dedent """
            Provision master node

            🧧  Usage

            clusterfiles master hostname username sshkey
        """
    exit 0
}

op_command_master() {
    arg_required "$1" "1: Missing ssh user"
    arg_required "$2" "2: Missing ssh host"
    arg_required "$3" "3: Missing ssh key"

    k3sup install --host "$1" --user "$2" --ssh-key "$3"
}
