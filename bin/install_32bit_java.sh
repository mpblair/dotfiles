#!/bin/bash

# This script exists since the Juniper VPN client
# only works with 32-bit Java.  The process for updating
# then becomes:
# 1. Download 32-bit jre
# 2. Unpack to /opt/java32/...
# 3. Update /usr/java/latest/jre/bin/java (which is a shell script) to reference
# the correct path for 32-bit jre 
#
# Future improvement: automate steps 1 and 2

# This is Step 3 - change /usr/java/latest/jre/bin/java to reference the correct path for 32-bit jre

JRE_VERSION="$(ls /opt/java32)"

sed -i "s/jre[0-9].*_.*\//$JRE_VERSION\//" /usr/java/latest/jre/bin/java 
