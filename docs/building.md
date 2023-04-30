# Building


## Download PetaLinux Tools from Xilinx

* Download [Xilinx Unified Installer 2022.1: Linux Self Extracting Web Installer (BIN)](https://www.xilinx.com/support/download.html) and put into `./installer/` directory.


## Prerequisites

For SELinux, label the installation files:
```
chcon -R -v -t container_file_t ./installer
```

Load SELinux policy:
```
sudo semodule \
    -i selinux/xilinx_toolkit_podman.cil \
    /usr/share/udica/templates/base_container.cil
```


## Building Base Image

Execute the following command to build image:
```
podman build -t extra2000/xilinx-toolkit-base -f Dockerfile.base .
```


## Install Vitis and PetaLinux Volume

Extract Vitis installer only and cancel installation:
```
bash ./installer/Xilinx_Unified_2022.2_1014_8888_Lin64.bin --keep --target installer/Xilinx_Unified
```

Create Vitis installation directory:
```
mkdir -pv ./installer/tools/Xilinx
```

Allow X11 forwarding to non-network local:
```
xhost +local:
```

Spawn a container to install Vitis and PetaLinux:
```
podman run -it --rm \
    -e DISPLAY=$DISPLAY \
    --device=/dev/dri \
    --network=host \
    --userns="keep-id:uid=1000,gid=1000" \
    -v ./installer/Xilinx_Unified:/opt/Xilinx_Unified:ro \
    -v ./installer/tools/Xilinx:/tools/Xilinx:rw \
    --security-opt label=type:xilinx_toolkit_podman.process \
    extra2000/xilinx-toolkit-base \
    bash
```

Install Vitis:
```
/opt/Xilinx_Unified/xsetup
```

Re-execute the installer again and select install PetaLinux:
```
/opt/Xilinx_Unified/xsetup
```

Exit container:
```
exit
```


## Building Xilinx Unified Image

Execute:
```
podman build -t extra2000/xilinx-toolkit-unified -f Dockerfile.unified .
```


## Building ROS Image

Execute:
```
podman build -t extra2000/xilinx-toolkit-ros -f Dockerfile.ros .
```


## Building KRS Image

Execute:
```
podman build -t extra2000/xilinx-toolkit-krs -f Dockerfile.krs .
```


## Building the Final Image

Execute:
```
podman build -t extra2000/xilinx-toolkit -f Dockerfile.final .
```
