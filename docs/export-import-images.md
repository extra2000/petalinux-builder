# Exporting and Importing Image

To export image into TAR file:
```
podman image save \
    -o xilinx-toolkit.tar \
    --format oci-archive \
    localhost/extra2000/xilinx-toolkit:latest
```

To import TAR image:
```
podman image load -i xilinx-toolkit.tar
```

Optionally import the SELinux policy too:
```
sudo semodule \
    -i selinux/xilinx_toolkit_podman.cil \
    /usr/share/udica/templates/base_container.cil
```
