#!/bin/bash

echo "net_def(swglobal)" > libvirt-netdef
cat vlan_list | sed -E "s/(^[A-Z]{3,}[0-9]?: )//g ; s/,/\n/g ; s/([0-9]+)/net_portgroup(\1)/g" >> libvirt-netdef
echo "net_def_end()" >> libvirt-netdef
m4 labconf.m4 libvirt-netdef > ../hv/net/swglobal.xml
exit
