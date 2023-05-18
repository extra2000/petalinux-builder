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
    --userns="keep-id:uid=1000,gid=1000" \
    --name=toolkit \
    --security-opt label=type:xilinx_toolkit_podman.process \
    -v xilinx-tools-v2022-1:/tools/Xilinx:ro \
    localhost/extra2000/xilinx-toolkit bash
```


## Vitis Testing

To launch Vitis
```
source /tools/Xilinx/Vitis/2022.1/settings64.sh
vitis
```


## PetaLinux Testing

To test Petalinux:
```
source /tools/Xilinx/PetaLinux/2022.1/tool/settings.sh
petalinux-config -h
```


## ROS2 Testing

Execute ROS2 talker demo:
```
source /opt/ros/humble/setup.bash
ros2 run demo_nodes_cpp talker
```

Start another terminal from the same container and then execute ROS2 listener demo:
```
podman exec -it toolkit bash
source /opt/ros/humble/setup.bash
ros2 run demo_nodes_py listener
```

To test GUI app:
```
source /opt/ros/humble/setup.bash
rviz2
```


## More Testings

* [ROS 2 Perception Node](testings/ros-2-perception-node.md)


## Cleaning Up

To remove X11 forwarding permission:
```
xhost -local:
```
