#!/bin/bash

. "${HERE}/core/os.sh"

op_command_bootstrap_help() {
    dedent """
        Setup continous deployment for a cluster from a particular branch
        in a github repo.

        🤚 requires a working master node
        🤚 requires a github personal access token with repo scope stored as a \$GITHUB_TOKEN envvar

        🧧  Usage

        clusterfiles bootstrap                         - use ./clusters/default at branch: master
        clusterfiles bootstrap --branch=name           - use ./clusters/default at branch: name
        clusterfiles bootstrap --cluster=clustername   - use ./clusters/clustername
        """
    exit 0
}


BOOTSTRAP_GIT_BRANCH="master"
op_option_branch() (
    BOOTSTRAP_GIT_BRANCH="$1"
)

BOOTSTRAP_GIT_CLUSTER_NAME="default"
op_option_cluster() (
    BOOTSTRAP_GIT_CLUSTER_NAME="$1"
)

op_command_bootstrap() {
    arg_required "$1" "1: Missing github owner"
    arg_required "$2" "2: Missing github repository"
    envvar_required "GITHUB_TOKEN"

    flux bootstrap git \
        --owner="$1" \
        --repository="$2" \
        --branch="${BOOTSTRAP_GIT_BRANCH}" \
        --path="./clusters/${BOOTSTRAP_GIT_CLUSTER_NAME}" \
        --personal
}
