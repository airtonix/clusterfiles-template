#!/bin/sh
VERSION=$(cat ${HERE}/VERSION)

. "${HERE}/core/logging.sh"

op_option_v() (op_option_version)
op_option_version() (op_command_version)
op_command_version() (info "Version: ${VERSION}")
