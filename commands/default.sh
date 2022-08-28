#!/bin/bash

. "${HERE}/core/logging.sh"

op_() ( op_command_help )
op_call_() (error "Invalid call '${*}'")
