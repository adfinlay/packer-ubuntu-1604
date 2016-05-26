#!/bin/bash -eux

# Install the Linux headers
apt-get -y install build-essential linux-headers-$(uname -r)

# Recompile when the kernel is updated
sed -i.bak 's/answer AUTO_KMODS_ENABLED_ANSWER no/answer AUTO_KMODS_ENABLED_ANSWER yes/g' /etc/vmware-tools/locations
sed -i.bak 's/answer AUTO_KMODS_ENABLED no/answer AUTO_KMODS_ENABLED yes/g' /etc/vmware-tools/locations

# Make sure the kernel module is loaded at boot
echo "vmhgfs" > /etc/modules-load.d/vmware.conf

shutdown -r now
sleep 60
