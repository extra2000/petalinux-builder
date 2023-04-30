# Testing


## Prerequisites

Allow X11 forwarding to non-network local:
```
xhost +local:
```

Spawn a container:
```
podman run -it --rm \
    -e DISPLAY=$DISPLAY \
    --device=/dev/dri \
    --network=host \
    --name=ros2 \
    --hostname=ros2-01 \
    --user=builder \
    localhost/extra2000/xilinx-toolkit bash
```


## Vitis Testing

To launch Vitis
```
source /tools/Xilinx/Vitis/2022.2/settings64.sh
vitis
```


## PetaLinux Testing

To test Petalinux:
```
source /tools/Xilinx/PetaLinux/2022.2/tool/settings.sh
petalinux-config -h
```


## ROS2 Testing

Execute ROS2 talker demo:
```
source ~/ros2_humble/install/local_setup.bash
ros2 run demo_nodes_cpp talker
```

Start another terminal from the same container and then execute ROS2 listener demo:
```
podman exec -it ros2 bash
source ~/ros2_humble/install/local_setup.bash
ros2 run demo_nodes_py listener
```

To test GUI app:
```
source ~/ros2_humble/install/local_setup.bash
rviz2
```


## KRS Testing

Spawn a container:
```
podman run -it --rm \
    -e DISPLAY=$DISPLAY \
    --device=/dev/dri \
    --network=host \
    --name=ros2 \
    --hostname=ros2-01 \
    --workdir=/home/builder/krs_ws \
    localhost/extra2000/xilinx-toolkit bash
```

Source Vitis, ROS2, and KRS environments (the export path is to fix CMake path, to ensure we are using the latest CMake from Ubuntu and not from Vitis):
```
source /tools/Xilinx/Vitis/2022.2/settings64.sh
source ~/ros2_humble/install/setup.bash
export PATH='/usr/bin':$PATH
source /home/builder/krs_ws/install/setup.bash
```

To list acceleration:
```
colcon acceleration list
```

To select KR260 acceleration:
```
colcon acceleration select kr260
```

To verify that KR260 acceleration is selected:
```
colcon acceleration list
```

Build some examples for KR260:
```
colcon build --install-base=install-kr260 --merge-install --mixin kr260 --packages-select ament_acceleration ament_vitis vadd_publisher
```

**TODO: `vadd_publisher` build failed.**

<!-- Create SD image:
```
colcon acceleration linux vanilla --install-dir install-kr260
``` -->


## Cleaning Up

To remove X11 forwarding permission:
```
xhost -local:
```
