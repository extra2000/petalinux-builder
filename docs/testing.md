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
    --security-opt label=type:yocto_toolkit_podman.process \
    -v xilinx-tools-v2022-1:/tools/Xilinx:ro \
    localhost/extra2000/yocto-toolkit bash
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


## Cleaning Up

To remove X11 forwarding permission:
```
xhost -local:
```
