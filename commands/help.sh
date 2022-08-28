#!/bin/sh

. "${HERE}/core/text.sh"

op_option_h() (op_command_help "$@")
op_option_help() (op_command_help "$@")
op_command_help() (
    echo "🏕️  Clusterfiles v${VERSION}"

    case $1 in
    "setup")
        dedent """
                Setup

                🧧  Usage

                clusterfiles setup
            """
        exit 0
        ;;
    "master")
        dedent """
                Provision master node

                🧧  Usage

                clusterfiles master hostname username sshkey
            """
        exit 0
        ;;

    "join")
        dedent """
                Provision worker node and join it to the master node

                🤚 requires a working master node

                🧧  Usage

                clusterfiles join hostname username sshkey
            """
        exit 0
        ;;

    "bootstrap")
        dedent """
                Setup continous deployment on the masternode

                🤚 requires a working master node

                🧧  Usage

                clusterfiles bootstrap
            """
        exit 0
        ;;

    *)
        dedent """
                🧧  Usage

                $ clusterfiles [command]

                🧧 Commands

                setup
                master
                join
                bootstrap
            """
        exit 0
        ;;
    esac
)
