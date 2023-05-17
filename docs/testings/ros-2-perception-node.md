# ROS 2 Perception Node

This is a tutorial based on [AMD Xilinx ROS 2 Perception with KR260](https://xilinx.github.io/kria-apps-docs/kr260/build/html/docs/ros2_perception_node/docs/app_deployment.html), but simplified for testing this repository.


## Spawn a Container

Allow X11 forwarding to non-network local:
```
xhost +local:
```

Execute the following command:
```
podman run -it --rm \
    -e DISPLAY=$DISPLAY \
    --device=/dev/dri \
    --network=host \
    --userns="keep-id:uid=1000,gid=1000" \
    --security-opt label=type:xilinx_toolkit_podman.process \
    localhost/extra2000/xilinx-toolkit:latest \
    bash
```


## Clone and Build Examples

Clone example repository:
```
git clone https://github.com/Xilinx/kria_ros_perception
cd kria_ros_perception
rm -rf src/image_proc src/tracetools_image_pipeline src/vitis_common src/tracing src/image_pipeline_examples
```

Source `gazebo_ros_pkgs` layer and then build:
```
source ~/gazebo_ros_pkgs/install/setup.bash
colcon build
```

Source `kria_ros_perception` layer and then launch example:
```
source ~/kria_ros_perception/install/setup.bash
ros2 launch perception_2nodes simulation.launch.py
```
