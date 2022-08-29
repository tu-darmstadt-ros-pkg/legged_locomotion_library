#!/bin/bash

set -e

script_dir="$(dirname $(readlink -f $0))"

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

