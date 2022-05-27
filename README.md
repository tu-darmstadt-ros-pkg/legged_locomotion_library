# Legged Locomotion Library (L3)

Repository including all instructions and tutorials on how to use the legged locomotion library (L3).

THIS README IS STILL A WORK IN PROGRESS. EXPECT TO SEE MORE DETAILS AND TUTORIALS SOON.

This work is a next-generation release based on the previous [vigir_footstep_planner](http://wiki.ros.org/vigir_footstep_planning). Many details apply to this new L3 framework as well.

The legged locomotion library (l3) is a versatile library for search-based locomotion planning, navigation, and perception of multi-legged robots. The modular architectures use plugins that allow to easily create generic methods achieving high code reusability that can be applied to a wide range of different legged robots. For this reason, the migration of new robot platforms can be done with little effort, as demonstrated by the examples below.

**The main features are:**

* Versatile Multi-Legged Footstep Planner
	* Works with many different legged robots, requires only a few steps for initial setup
	* Planning pipeline can be reconfigured on the fly
	* Optional floating base planning
	* Easy extension and composition of the planning pipeline (e.g. cost functions and heuristics)
	* Parallelized state expansion stage significantly accelerates dense space sampling
	* Adaptive state-dependent/state-aware expansion strategies.
	* State caching enables skipping of repeated computational steps

* Modular Terrain Model Generator
	* No fixed background data structure; use any data structure you need!
	* Data processing is freely extensible and composable
	* CUDA support (WIP)

* Generic Step Controller
	* Provides basic infrastructure to interface with different motion controller
	* Forwards steps from a plan to the robot's motion execution API
	* Tracks execution of steps
	* Stitches successive step plan seamlessly

## Publications

Details are available in the following publications. Please also consider citing our paper if you use the footstep planner in your research.

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

L3 is tested under Ubuntu 20.04 and ROS Noetic. Older versions may work but it is not actively maintained.



## Footstep Planner Install

All source code of the L3 framework is publicly available. Since now, no prebuild packages are available, so the current way is only a source install in your ROS workspace.

### Auto Installer

L3 comes with an easy-to-use quick-install script. It requires an already setup ROS workspace based on wstool and catkin. Just clone this repository in your workspace. After a re-build and re-sourcing of your workspace, the following commands become available.

* `roscd`
* `rosrun legged_locomotion_library auto_install.sh`

Just build your workspace. After a couple of minutes, your L3 setup should be ready to use.

### Manual Install

In the `rosinstalls` subfolder, you will find `wstool` compatible `*.rosinstall` files that contain all the necessary data about the repositories. You can merge these files directly in your workspace using the `wstool merge` command.



## Basic Examples

### Simple Bipedal Robot Example

    roslaunch l3_footstep_planning footstep_planner_test_bipedal.launch

### Simple Quadrupedal Robot Example

    roslaunch l3_footstep_planning footstep_planner_test_quadrupedal.launch
 
### RViz Profile

    roslaunch l3_footstep_planning rviz_footstep_planning.launch

Drag a goal pose (shortcut 'g') on the grid to start planning.



## Real Robot Examples

### THORMANG3 Example

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/thormang3_flat.gif)

#### Install

* `roscd`
* `rosrun legged_locomotion_library rosinstall.sh thor_mang_example`

Just build your workspace. After a couple of minutes, your THORMANG setup should be ready to use.

#### Run

    roslaunch thor_mang_l3_footstep_planning footstep_planner_test.launch
    roslaunch thor_mang_l3_footstep_planning rviz.launch

Drag a goal pose (shortcut 'g') on the grid to start planning.

### ANYmal C Example

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/anymal_c_flat.gif)

#### Install

* `roscd`
* `rosrun legged_locomotion_library rosinstall.sh anymal_c_example`

Just build your workspace. After a couple of minutes, your ANYmal setup should be ready to use.

#### Run

    roslaunch anymal_l3_footstep_planning footstep_planner_ball_foot.launch
    roslaunch anymal_l3_footstep_planning rviz.launch

Drag a goal pose (shortcut 'g') on the grid to start planning.

**Note:** The paper also presents the full integration pipeline using the L3 Step Controller, i.e. the robot autonomously running over rough terrain using L3. However, this version requires access to the internal ANYbotics research community repositories. Upon request, the step controller integration can be migrated to the ANYmal C version. Just leave me a message!

#### Remarks

Turning in place is quite a challenge for search-based planners as this locomotion pattern involves steps that does not monotonically decrease the total path cost. To overcome this challenge, the L3 provides state-based adaptive state sampling. In this case, the `AnymalTurningStateGenerator` plugin is used by the planner to explicitly generate gait patterns that result in a turning motion in the desired direction.



## 3D Terrain Modeling

The l3 framework also consists of a generic 3D world modeling generator that supplies the footstep planner with finding suitable paths and foot contacts in challenging terrain. It uses the same modular plugin approach to enable individual processing pipelines and outputs. This makes this terrain model generator framework also suitable for perception and mapping tasks without using the footstep planner.

**Note:** All of the above examples are configured to optionally run with a 3D terrain model. Therefore, you can always run the terrain model generator in addition to the footstep planner. The footstep planner uses the provided 3D data but assumes a flat world if no data is available.

CUDA support is work in progress.

### Install

The terrain model generator pipeline is automatically installed with the standard footstep planning setup. However, a stand-alone installation is also possible:

* Change directory into the legged_locomotion_library scripts folder `roscd legged_locomotion_library/scripts`.
* Run `./rosinstall.sh terrain_modeling`.
* Run `wstool update`.
* Run `catkin build`.

### Run Real World Ramp Example

This example uses recorded data from a laboratory scenario where a ramp was placed. The data was recorded with the MultiSense SL mounted on an Atlas robot.

Get example pcd files:

    rosrun l3_terrain_model_generator download_pcd.sh

and run

    roslaunch l3_terrain_model_generator terrain_model_generator_pcd.launch 

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/terrain_model_generator_pcd.gif)

The generator is configured with a local region of interest filter. The center of this filter is the current position of the robot, which can be faked by placing a start pose (shortcut 'p'). As the recorded data is based on sparse laser scan, it may take some time until a feasible dense world model is available.

The following shows examples using THORMANG3 and ANYmal.

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/thormang3_ramp.gif)

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/anymal_c_ramp.gif)

### Run Synthetic Stairs Example

The terrain model generator provides an image to elevation map convertor that interprets grey-scaled images as terrain heights.

    roslaunch l3_terrain_model_generator terrain_model_generator_image.launch

**Note:** Computation of the full model may take a while due to dense single-shot data given as input.

The following shows examples using THORMANG3 and ANYmal.

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/thormang3_stairs.gif)

![](https://github.com/tu-darmstadt-ros-pkg/legged_locomotion_library/blob/master/doc/anymal_c_stairs.gif)



## L3 Navigation Marker

COMING SOON!

