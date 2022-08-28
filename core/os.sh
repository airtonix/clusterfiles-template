#!/bin/bash
HERE=$(
    cd "${BASH_SOURCE[0]%/*}" || exit
    pwd
)

. "$HERE/logging.sh"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

needs_command() {
    command_exists "$1" || {
        error "No $1"
        exit 1
    }
}

get_processor() {
    [[ $(sysctl -e -n machdep.cpu.brand_string) =~ "Apple" ]] && {
        echo 'M1'
    } || uname -m
}

get_platform() {
    uname -s
}

get_shell_profile() {
    case "${SHELL}" in
    /bin/bash)
        echo "${HOME}/.bashrc"
        ;;
    /bin/zsh)
        echo "${HOME}/.zshrc"
        ;;
    esac
}

get_shell_name() {
    basename "${SHELL}"
}
