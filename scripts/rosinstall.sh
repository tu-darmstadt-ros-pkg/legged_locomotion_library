#!/bin/bash

set -e

script_dir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source ${script_dir}/helper.sh

version="full"
if [ ! -z "$1" ]; then
    version="$1"
fi

file="${script_dir}/../rosinstalls/${version}.rosinstall"

# Merging rosinstall
echo_info ">>> Merging rosinstall..."
if [ -f ${file} ]; then
    wstool merge -y ${file}
else
    echo_error "No rosinstall named \"${version}\" available."
fi

