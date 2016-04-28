rm -rf ~/.vagrant.d/boxes/cem-vm-virtualbox/; \
rm -rf ~/.vagrant.d/boxes/cem-vm-vmware/; \
rm -rf builds/*.box; \
packer build -force centos-6.7-x86_64.json;\
vagrant box add --force --name "cem-vm-virtualbox" builds/virtualbox-centos-6.7-x86_64.box;\
vagrant box add --force --name "cem-vm-vmware" builds/vmware-centos-6.7-x86_64.box; \
rm -rf builds/*.box
