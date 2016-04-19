#!/bin/bash

set -e
set -x

# Delete unneeded files.
rm -f /home/vagrant/*.sh

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync

if rpm -q --whatprovides kernel | grep -Fqv $(uname -r); then
  rpm -q --whatprovides kernel | grep -Fv $(uname -r) | xargs sudo dnf -y erase
fi

sudo dnf clean all
