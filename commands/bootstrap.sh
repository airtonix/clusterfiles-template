#!/bin/bash

. "${HERE}/core/os.sh"

BOOTSTRAP_GIT_BRANCH="master"
op_option_branch() (
    BOOTSTRAP_GIT_BRANCH="$1"
)

BOOTSTRAP_GIT_CLUSTER_PATH="default"
op_option_path() (
    BOOTSTRAP_GIT_CLUSTER_PATH="$1"
)

op_command_bootstrap() {
    arg_required "$1" "1: Missing git url"

    flux bootstrap git \
    --url="$1" \
    --branch="${BOOTSTRAP_GIT_BRANCH}" \
    --path="./clusters/${BOOTSTRAP_GIT_CLUSTER_PATH}"
}
