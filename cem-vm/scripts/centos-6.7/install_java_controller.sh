sudo yum -y remove java-1.8.0-openjdk-headless.x86_64
#sudo yum -y install libgcc_s.so.1 glibc.i686
sudo yum -y install jre-8u91-linux-x64.rpm
sudo yum -y install EnergyManagement-Controller_5.1_64bit-44163_K9.x86_64.rpm

cat > ewcontroller.init << EOF
ctrllogdir=""
clouddomain="nathan.to"
cloudpassword="Ax2u334jD3P0IKPA"
javapath="/usr/bin"
EOF

sudo cp ewcontroller.init /var/lib/ewcontroller/ewcontroller.init
sudo mv cem_keypair.key /var/lib/ewcontroller
#sudo /etc/init.d/ewcontroller start
