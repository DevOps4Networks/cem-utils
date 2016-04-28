# CEM Dev VM

This set of Packer based VM build scripts is intended to create a "controller" VM for the 
[Cisco Energy Manager](http://www.cisco.com/c/en/us/products/switches/energy-management-technology/index.html) 
(CEM) system.

The architecture of that system is such that the controller communicates, using Rabbit MQ, with a server that is used
to manage controllers via a web UI. The server aspect itself is not in scope here.

This build configuration installs and configures Centos 6.7 x86_64 minimal using Packer and various shell 
provisioners, and then generates two Vagrant box files, for:

  - VirtualBox
  - VMware

The key variable parts of the build are in [install_java_controller.sh](scripts/centos-6.7/install_java_controller.sh)
which installs these files, and the software packaged within them:

 - [Oracle JRE 8](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)
 - [CEM Controller CentOS RPM](https://software.cisco.com/download/release.html?mdfid=285963719&flowid=46142&softwareid=285994366&release=5.1.0&relind=AVAILABLE&rellifecycle=&reltype=latest) 
 - A "cem_keypair.key" file, which you will need to obtain from the server and place in the build directory
 
 The JRE and CEM controller install files need to be placed in locations defined by these variable in the 
 [centos-6.7-x86_64.json](./centos-6.7-x86_64.json) file (values shown are example only):
 
 - `"cem_rpm": "EnergyManagement-Controller_5.1_64bit-44163_K9.x86_64.rpm"`
 - `"jre_rpm": "jre-8u91-linux-i586.rpm"`

## Requirements

The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/) (if you want to build the VirtualBox box)
  - [VMware Fusion](http://www.vmware.com/products/fusion/) (or Workstation - if you want to build the VMware box)

## Usage

The [build.sh](./build.sh) script illustrates usage.

If you want to only build a box for one of the supported virtualization platforms 
(e.g. only build the VMware box), add `--only=vmware-iso` to the `packer build` command:

    $ packer build --only=vmware-iso centos-6.7-x86_64.json

## Acknowledgements

This project is based on: https://github.com/geerlingguy/packer-ubuntu-1404 and https://github.com/kaorimatz/packer-templates

## License

MIT license.

## Author Information

Created in 2016 by [Nathan Sowatskey](https://github.com/DevOps4Networks)


#Acknowledgements

