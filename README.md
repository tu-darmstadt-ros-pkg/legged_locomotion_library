
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

Just build your workspace. After a couple of minutes, your L3 setup should be ready to use.

## Run Examples

### Bipedal Robot Example

    roslaunch l3_footstep_planning footstep_planner_test_bipedal.launch

### Bipedal Robot Example

    roslaunch l3_footstep_planning footstep_planner_test_quadrupedal.launch

 
### RViz Profile

    roslaunch l3_footstep_planning rviz_footstep_planning.launch 


