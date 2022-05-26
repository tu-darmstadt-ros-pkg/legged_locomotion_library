
# Legged Locomotion Library
Repository including all instructions and tutorials on how to use the legged locomotion library (L3).

THIS README IS STILL A WORK IN PROGRESS. EXPECT TO SEE MORE DETAILS AND TUTORIALS IN THE NEAR FUTURE.

This work is a next generation release based on the previous [vigir_footstep_planner](http://wiki.ros.org/vigir_footstep_planning). Many details are applying to this new L3 framework as well.



## Publications

Details are available in following publications. Please also consider citing our paper if you use the footstep planner in your research.

> Alexander Stumpf, Oskar von Stryk
> **"A Universal Footstep Planning Methodology for Continuous Walking in Challenging Terrain"**,
> in Proceedings of ICRA 2022
> [Introduction Video](https://www.youtube.com/watch?v=wUCq4B5PiHU)

Bibtex:
> @INPROCEEDINGS{2022:ICRA-Stumpf,   author = {Stumpf, Alexander and von
> Stryk, Oskar},   title = {A Universal Footstep Planning Methodology
> for Continuous Walking in Challenging Terrain},   organization =
> {IEEE} }



## Requirements

L3 is tested under Ubuntu 20.04 and ROS Noetic. Older versions may work but it is not actively maintainend.



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
* Run `./rosinstall.sh thor_mang_example`.
* Run `wstool update`.
* Run `catkin build`.

#### Run

    roslaunch thor_mang_l3_footstep_planning footstep_planner_test.launch
    roslaunch thor_mang_l3_footstep_planning rviz.launch

Drag a goal pose on the grid to start planning.

### ANYmal C Example

#### Install

* Change directory into the legged_locomotion_library scripts `cd legged_locomotion_library/scripts`.
* Run `./rosinstall.sh anymal_c_example`.
* Run `wstool update`.
* Run `catkin build`.

#### Run

    roslaunch anymal_l3_footstep_planning footstep_planner_ball_foot.launch
    roslaunch anymal_l3_footstep_planning rviz.launch

Drag a goal pose on the grid to start planning.

**Note:** The paper also presents the full integration pipeline using the L3 Step Controller, i.e. the robot autonomously running over rough terrain using L3. However, this version requires access to the internal ANYbotics research community repositories. Upon request, the step controller integration can be migrated to the ANYmal C version. Just leave me message!



## 3D Terrain Example

Coming Soon

