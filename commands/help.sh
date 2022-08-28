#!/bin/sh

. "${HERE}/core/text.sh"
. "${HERE}/commands/setup.sh"
. "${HERE}/commands/version.sh"
. "${HERE}/commands/master.sh"
. "${HERE}/commands/join.sh"
. "${HERE}/commands/bootstrap.sh"

op_option_h() (op_command_help "$@")
op_option_help() (op_command_help "$@")
op_command_help() (
    echo "🏕️  Clusterfiles v${VERSION}"

    case $1 in
    "setup")
        op_command_setup_help
        ;;
    "master")
        op_command_master_help
        ;;

    "join")
        op_command_join_help
        ;;

    "bootstrap")
        op_command_bootstrap_help
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
