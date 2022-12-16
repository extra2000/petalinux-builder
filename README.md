# petalinux-builder

| License | Versioning |
| ------- | ---------- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) |

PetaLinux 2022.1 image builder for ArtyZ7-20.


## Download PetaLinux Tools from Xilinx

Download [petalinux-v2022.1-04191534-installer.run](https://www.xilinx.com/member/forms/download/xef.html?filename=petalinux-v2022.1-04191534-installer.run) and put into `./installer/` directory.


## Building image

Label the installation file:
```
chcon -R -v -t container_file_t ./installer
chmod 755 ./installer/petalinux-v2022.1-04191534-installer.run
```

Build image:
```
podman build -t extra2000/petalinux-builder .
```

Load SELinux policy:
```
sudo semodule -i selinux/petalinux_builder.cil /usr/share/udica/templates/base_container.cil
```
