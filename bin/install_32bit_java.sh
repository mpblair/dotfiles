#!/bin/bash

# This script exists since the Juniper VPN client
# only works with 32-bit Java.  The process for updating
# then becomes:
# 1. Download 32-bit jre
# 2. Unpack to /opt/java32/...
# 3. Update /usr/java/latest/jre/bin/java (which is a shell script) to reference
# the correct path for 32-bit jre 
#

echo off

# Must be run as root
if [ "$EUID" -ne 0 ]; then
    echo "This setup tool must be run as root.  Exiting..." 1>&2
    exit 1
fi

# User must have provided file location for 32-bit jre
if [ ! -f "$1" ]; then
    echo "Usage: install_32bit_java PATH_TO_INSTALL_FILE" 1<&2
    exit 1
fi

echo "Unpacking $1 to /opt/java32"
mkdir /tmp/java32
tar xvf $1 -C /tmp/java32
mv /tmp/java32/* /opt/java32/

# This is Step 3 - change /usr/java/latest/jre/bin/java to reference the correct path for 32-bit jre

JRE_VERSION="$(ls /opt/java32)"
echo $JRE_VERSION
sed -i "s/jre[0-9].*_.*\//$JRE_VERSION\//" /usr/java/latest/jre/bin/java 

echo "32-bit JRE install complete!"
