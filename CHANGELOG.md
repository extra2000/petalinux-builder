# Changelog

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
