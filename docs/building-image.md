# Building Xilinx Toolkit Image


## Prerequisites

For SELinux, label the installation files:
```
chcon -R -t container_file_t ./installer
```

Load SELinux policy:
```
sudo semodule \
    -i selinux/xilinx_toolkit_podman.cil \
    /usr/share/udica/templates/base_container.cil
```


## Building Image

Execute the following command to build image:
```
podman build -t extra2000/xilinx-toolkit .
```
