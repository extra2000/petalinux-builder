# petalinux-builder

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/wcm88r6lh5bwnsxi/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/petalinux-builder/branch/master) |

PetaLinux 2021.2 image builder for ArtyZ7-20.


## Download PetaLinux Tools from Xilinx

Download [petalinux-v2021.2-final-installer.run](https://www.xilinx.com/member/forms/download/xef.html?filename=petalinux-v2021.2-final-installer.run) and put into `./installer/` directory.


## Building image

Label the installation file:
```
chcon -R -v -t container_file_t ./installer
chmod 755 ./installer/petalinux-v2021.2-final-installer.run
```

Build image:
```
podman build -t extra2000/petalinux-builder .
```
