# Legged Locomotion Library
Repository including all instructions and tutorials on how to use the legged locomotion library (L3).

THIS README IS STILL A WORK IN PROGRESS. EXPECT TO SEE MORE DETAILS AND TUTORIALS IN THE NEAR FUTURE.

This work is a next generation release based on the previous [vigir_footstep_planner](http://wiki.ros.org/vigir_footstep_planning). Many details are applying to this new L3 framework as well.

The legged locomotion library (l3) is a versatile library for search-based locomotion planning, navigation, and perception of multi-legged robots. The modular architectures uses plugins that allow to easily create generic methods achieving high code reusability that can be applied to a wide range of different legged robots. For this reason, the migration of new robot platforms can be done with little effort, as demonstrated by the examples below.



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



## Footstep Planner Install

All source code of the L3 framework is publicly available. Since now, no prebuild packages are available, so the current way is only a source install in your ROS workspace.

### Auto Installer

L3 comes with an easy-to-use quick-install script. It requires an already setup ROS workspace based on wstool and catkin.

* Open a terminal and go to the src directory of your workspace, e.g. `cd ~/noetic/src`.
* Clone this repository `git clone https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library.git`.
* Change directory into the cloned repository scripts folder `cd legged_locomotion_library/scripts`.
* Run `auto_installer.sh`.
* Run `wstool update`.
* Run `catkin build`.

Just build your workspace. After a couple of minutes, your L3 setup should be ready to use.

### Manual Install

In the `rosinstalls` subfolder you will find `wstool` compatible `rosinstall` files that contain all the necessary data about the repositories. You can merge these files directly in your workspace using the `wstool merge` command.

## Basic Examples

### Bipedal Robot Example

    roslaunch l3_footstep_planning footstep_planner_test_bipedal.launch

### Bipedal Robot Example

    roslaunch l3_footstep_planning footstep_planner_test_quadrupedal.launch
 
### RViz Profile

    roslaunch l3_footstep_planning rviz_footstep_planning.launch

Drag a goal pose (shortcut 'g') on the grid to start planning.



## Real Robot Examples

### THORMANG3 Example

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/thor_flat.gif)

#### Install

* Change directory into the legged_locomotion_library scripts folder `roscd legged_locomotion_library/scripts`.
* Run `./rosinstall.sh thor_mang_example`.
* Run `wstool update`.
* Run `catkin build`.

#### Run

    roslaunch thor_mang_l3_footstep_planning footstep_planner_test.launch
    roslaunch thor_mang_l3_footstep_planning rviz.launch

Drag a goal pose on the grid to start planning.

### ANYmal C Example

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/anymal_c_flat.gif)

#### Install

* Change directory into the legged_locomotion_library scripts folder `roscd legged_locomotion_library/scripts`.
* Run `./rosinstall.sh anymal_c_example`.
* Run `wstool update`.
* Run `catkin build`.

#### Run

    roslaunch anymal_l3_footstep_planning footstep_planner_ball_foot.launch
    roslaunch anymal_l3_footstep_planning rviz.launch

Drag a goal pose (shortcut 'g') on the grid to start planning.

**Note:** The paper also presents the full integration pipeline using the L3 Step Controller, i.e. the robot autonomously running over rough terrain using L3. However, this version requires access to the internal ANYbotics research community repositories. Upon request, the step controller integration can be migrated to the ANYmal C version. Just leave me message!



## 3D Terrain Modeling

The l3 framework also consists of a generic 3D world modeling generator that supplies the footstep planner in finding suitable paths and foot contacts in challenging terrain. It uses the same modular plugin approach to enable individual processing pipelines and outputs. This makes this terrain model generator framework also suitable for perception and mapping tasks without using the footstep planner.

**Note:** All of the above examples are configured to optionally run with a 3D terrain model. Therefore, you can always run the terrain model generator in addition to the footstep planner. The footstep planner uses the provided 3D data but assumes a flat world if no data is available.

### Install

The terrain model generator pipeline is automatically installed with the standard footstep planning setup. However, a stand-alone installation is also possible:

* Change directory into the legged_locomotion_library scripts folder `roscd legged_locomotion_library/scripts`.
* Run `./rosinstall.sh terrain_modeling`.
* Run `wstool update`.
* Run `catkin build`.

### Get Example PCD Files

* Change directory into the legged_locomotion_library scripts folder `roscd l3_terrain_model_generator/scripts`.
* Run `./download_pcd.sh`.

### Run Real World Ramp Example

Run:

    roslaunch l3_terrain_model_generator terrain_model_generator_pcd.launch 

You can use any footstep planning setup. The following shows an example of ANYmal.

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/anymal_c_ramp.gif)

### Run Synthetic Stairs Example

Run:

    roslaunch l3_terrain_model_generator terrain_model_generator_image.launch

**Note:** Computation of the full model may take a while due to dense single shot data given as input.
You can use any footstep planning setup. The following shows an example of ANYmal.

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/anymal_c_stairs.gif)


