#!/bin/bash

set -e

script_dir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source ${script_dir}/helper.sh

if [ -z "${ROS_DISTRO}" ]; then
    echo_error "No ROS workspace is sourced!"
    exit 1
fi

# add repositories
${script_dir}/rosinstall.sh

# Updating catkin workspace
echo_info ">>> Updating catkin workspace..."
wstool update -j$(nproc)
echo

# Updating rosdeps
echo_info ">>> Updating rosdeps for all packages in workspace..."
rosdep update
rosdep install --ignore-src -y -r --from-paths .
echo

