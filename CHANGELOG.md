# Changelog

## [5.0.0](https://github.com/extra2000/yocto-toolkit/compare/v4.1.0...v5.0.0) (2023-08-12)


### ⚠ BREAKING CHANGES

* **Dockerfile:** ROS2 packages have moved to [extra2000/ros2-gazebo11-classic](https://github.com/extra2000/ros2-gazebo11-classic) and KRS dependencies have been removed.

### Code Refactoring

* **Dockerfile:** remove ROS2 and KRS dep ([f22e40b](https://github.com/extra2000/yocto-toolkit/commit/f22e40b87b62aedaea73f0aa543e0add1739515b))

## [4.1.0](https://github.com/extra2000/yocto-toolkit/compare/v4.0.0...v4.1.0) (2023-08-07)


### Features

* **Dockerfile:** add all dependencies for AMD Kria ROS2 Perception example ([8bb22a8](https://github.com/extra2000/yocto-toolkit/commit/8bb22a892556980cc88294ede411583a786c0ecf))


### Documentations

* **testing:** add `ROS_DOMAIN_ID` with ID 10 instead of default ID 0 ([52ad7a2](https://github.com/extra2000/yocto-toolkit/commit/52ad7a2bcfd7c98c520b7c8c9c3b2691bafcc940))
* **testing:** update instructions for AMD Kria ROS2 Perception Node ([016838f](https://github.com/extra2000/yocto-toolkit/commit/016838fd2a6ca994f38fc159d4b5719fcafac393))


### Fixes

* **selinux:** allow `dri_device_t:chr_file { getattr ioctl map read write }`, `lltng_port_t:tcp_socket name_bind`, `tmpfs_t:file map`, `unreserved_port_t:tcp_socket name_connect` ([0c2f376](https://github.com/extra2000/yocto-toolkit/commit/0c2f376fc32b2b1368d06073628d0832eb1a1d29))

## [4.0.0](https://github.com/extra2000/yocto-toolkit/compare/v3.2.0...v4.0.0) (2023-07-19)


### ⚠ BREAKING CHANGES

* this project has been renamed from `xilinx-toolkit` to `yocto-toolkit`

### Documentations

* add Xilinx `v2023.3` installations ([2f51c0b](https://github.com/extra2000/yocto-toolkit/commit/2f51c0b9569a37b91c4bf00fa57e01e769033b78))
* **xilinx-installations:** add instructions missing instructions for creating volume ([3af26df](https://github.com/extra2000/yocto-toolkit/commit/3af26dfd51235c7b4887a3a6b9906e76aa6af8c8))


### Code Refactoring

* rename this project from `xilinx-toolkit` to `yocto-toolkit` ([9179753](https://github.com/extra2000/yocto-toolkit/commit/9179753c3fde726283d16913597a6fd6bbfcc090))

## [3.2.0](https://github.com/extra2000/xilinx-toolkit/compare/v3.1.0...v3.2.0) (2023-05-18)


### Features

* **dockerfile:** upgrade to Ubuntu 22.04 and no source installations ([45e67e2](https://github.com/extra2000/xilinx-toolkit/commit/45e67e26049166866702d36ad0c16cc47bec3352))


### Documentations

* add Xilinx `v2022.2` installations ([a0efcf5](https://github.com/extra2000/xilinx-toolkit/commit/a0efcf5cb24bcd762bfedac3256ebf2f283874b2))
* **docs/testings/ros-2-perception-node.md:** add `rqt` example ([80c6c5d](https://github.com/extra2000/xilinx-toolkit/commit/80c6c5d1b02a1cd60ee95e2a0b794e9595dc412f))

## [3.1.0](https://github.com/extra2000/xilinx-toolkit/compare/v3.0.0...v3.1.0) (2023-05-17)


### Features

* **dockerfile:** add Gazebo installations ([d7a23cb](https://github.com/extra2000/xilinx-toolkit/commit/d7a23cb3fc7c11acc906d943d3932c34aef18098))


### Code Refactoring

* **dockerfile:** externalize ROS2 Humble Repos ([d7a70e6](https://github.com/extra2000/xilinx-toolkit/commit/d7a70e6f5d4ae207a2d8e56f96ee63dd22703b7a))


### Documentations

* **testing:** add ROS 2 Perception Node example ([d067354](https://github.com/extra2000/xilinx-toolkit/commit/d067354503b4001e3fa94b9452b19939b35c7a40))

## [3.0.0](https://github.com/extra2000/xilinx-toolkit/compare/v2.0.0...v3.0.0) (2023-05-17)


### ⚠ BREAKING CHANGES

* Dockerfile has been restructured and Xilinx tools will be installed as volume.

### Documentations

* re-structure docs with latest instructions ([f87cbbb](https://github.com/extra2000/xilinx-toolkit/commit/f87cbbbea5ada1d6bc73288379cc347f177c2a60))


### Code Refactoring

* restructure Dockerfile and install Xilinx tools as volume ([221c58e](https://github.com/extra2000/xilinx-toolkit/commit/221c58efeb8350939e8c0133c6ffc15e3db11aa1))

## [2.0.0](https://github.com/extra2000/xilinx-toolkit/compare/v1.2.0...v2.0.0) (2023-05-13)


### ⚠ BREAKING CHANGES

* installation instructions have major changes

### Features

* add Vitis, ROS2, and KRS ([d8ae88b](https://github.com/extra2000/xilinx-toolkit/commit/d8ae88b70ea5b5e73d2c3ff8a4d093ceb6f14550))


### Documentations

* **README:** remove AppVeyor badge ([3883e8f](https://github.com/extra2000/xilinx-toolkit/commit/3883e8ff8985074bbae7e75e10656d6584919ff2))


### Continuous Integrations

* add Github Action ([ac32692](https://github.com/extra2000/xilinx-toolkit/commit/ac326926ec5c31b517b23fb3d6273665f66c98c9))
* remove AppVeyor ([85790a2](https://github.com/extra2000/xilinx-toolkit/commit/85790a213e1512d70caace8f487b07b32af43c4a))


### Fixes

* **selinux:** add `allow petalinux_builder.process container_file_t:file unlink` ([9946731](https://github.com/extra2000/xilinx-toolkit/commit/9946731b9901d298bff078013e5970f8846392ea))
* **selinux:** add `module_request` and `name_bind` ([ae530cb](https://github.com/extra2000/xilinx-toolkit/commit/ae530cb30799adf3943c8421f97979f976687735))

## [1.2.0](https://github.com/extra2000/petalinux-builder/compare/v1.1.2...v1.2.0) (2022-06-13)


### Features

* update Petalinux to 2022.1 ([6c63e33](https://github.com/extra2000/petalinux-builder/commit/6c63e330868cda78459dfd92b4a7ced1634ce5ec))

### [1.1.2](https://github.com/extra2000/petalinux-builder/compare/v1.1.1...v1.1.2) (2022-04-03)


### Fixes

* **selinux:** add more required permissions ([6fc73f8](https://github.com/extra2000/petalinux-builder/commit/6fc73f83ea2336391db504fbd503ecc6944d4e7d))

### [1.1.1](https://github.com/extra2000/petalinux-builder/compare/v1.1.0...v1.1.1) (2021-12-04)


### Fixes

* **selinux:** add `node_t:udp_socket node_bind` and `unreserved_port_t:udp_socket name_bind` ([9a5d52f](https://github.com/extra2000/petalinux-builder/commit/9a5d52f910f978dc35c0eb25d2b27e9f28908b91))

## [1.1.0](https://github.com/extra2000/petalinux-builder/compare/v1.0.1...v1.1.0) (2021-12-04)


### Features

* **selinux:** add SELinux policy ([40a5d64](https://github.com/extra2000/petalinux-builder/commit/40a5d647c7820dd120613cda54091e5f1b692768))


### Documentations

* **README:** add instruction to load SELinux policy ([fa79a58](https://github.com/extra2000/petalinux-builder/commit/fa79a581c5a462bad69f5fad241d2d8d62febd56))

### [1.0.1](https://github.com/extra2000/petalinux-builder/compare/v1.0.0...v1.0.1) (2021-11-29)


### Fixes

* **dockerfile:** add missing package `cpio`, `xxd`, and `tmux` ([e802598](https://github.com/extra2000/petalinux-builder/commit/e802598d988e3285f5c896871fa847b1acf2a8b3))
* **dockerfile:** fix locale ([6967015](https://github.com/extra2000/petalinux-builder/commit/69670151bd5c9cea176353b437d2298c96a48529))

## 1.0.0 (2021-11-17)


### Features

* initial implementations ([768b003](https://github.com/extra2000/petalinux-builder/commit/768b00393acd6525cbd6d68bf20d331f04200f74))


### Documentations

* **README:** update `README.md` ([4253052](https://github.com/extra2000/petalinux-builder/commit/4253052e6cc0a756972bbd4cb1bbe6cbb51ee235))


### Continuous Integrations

* add AppVeyor with `semantic-release` ([8e020d8](https://github.com/extra2000/petalinux-builder/commit/8e020d80718450511a2c2b898a7111d8455ee15a))
