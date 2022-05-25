

# legged_locomotion_library
Repository including all instructions and tutorials on how to use the legged locomotion library (L3)

THIS README IS STILL A WORK IN PROGRESS. EXPECT TO SEE MORE DETAILS IN THE NEAR FUTURE.

## Install

All source code of the L3 framework is publicly available. Since now, no prebuild packages are available, so the current way is only a source install in your ROS workspace.

### Auto installer

L3 comes with an easy-to-use quick-install script. It requires an already setup ROS workspace based on wstool and catkin.

* Open a terminal and go to the src directory of your workspace, e.g. `cd ~/noetic/src`.
* Clone this repository `git clone https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library.git`.
* Change directory into the cloned repository scripts `cd legged_locomotion_library/scripts`.
* Run `auto_installer.sh`.
* Run `wstool update`.
* Run `catkin build`.

Just build your workspace. After a couple of minutes, your L3 setup should be ready to use.

## Basic Examples

### Bipedal Robot Example

    roslaunch l3_footstep_planning footstep_planner_test_bipedal.launch

### Bipedal Robot Example

    roslaunch l3_footstep_planning footstep_planner_test_quadrupedal.launch
 
### RViz Profile

    roslaunch l3_footstep_planning rviz_footstep_planning.launch

Drag a goal pose on the grid to start planning.

## Real Robot Examples

### THORMANG3 Example

#### Install

* Change directory into the legged_locomotion_library scripts `cd legged_locomotion_library/scripts`.
* Run `./rosinstall.sh thor_mang_example`
* Run `wstool update`.
* Run `catkin build`.

#### Run

    roslaunch thor_mang_footstep_planner footstep_planner_test.launch
    roslaunch thor_mang_footstep_planner rviz.launch

Drag a goal pose on the grid to start planning.

