#!/usr/bin/expect
set timeout -1

spawn /opt/installer/petalinux-v2021.2-final-installer.run --dir /home/builder/petalinux

set timeout 600
expect "Press Enter to display the license agreements"
send "\r"
set timeout 2

expect {
    "*Do you accept Xilinx End User License Agreement?*" {send "y\r"}
    timeout { send "q"; sleep 1; exp_continue}
}
expect {
    "*Do you accept Third Party End User License Agreement?*" {send "y\r"}
    timeout { send "q"; sleep 1; exp_continue}
}

set timeout -1
expect "INFO: Installing PetaLinux..."
expect "INFO: Checking PetaLinux installer integrity..."
expect "INFO: Installing PetaLinux SDK to \"/home/builder/petalinux/.\""
expect "INFO: Installing buildtools in /home/builder/petalinux/./components/yocto/buildtools"
expect "INFO: Installing buildtools-extended in /home/builder/petalinux/./components/yocto/buildtools_extended"
expect "INFO: PetaLinux SDK has been installed to /home/builder/petalinux/."
#interact
