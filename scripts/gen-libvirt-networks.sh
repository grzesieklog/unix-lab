#!/bin/bash

echo "net_def(swglobal)" | m4 labconf.m4 - >> ../hv/net/swglobal.xml
cat vlan_list | sed -E "s/(^[A-Z]{3,}[0-9]?: )//g ; s/,/\n/g ; s/([0-9]+)/net_portgroup(\1)/g" | m4 labconf.m4 - >> ../hv/net/swglobal.xml
echo "net_def_end()" | m4 labconf.m4 - >> ../hv/net/swglobal.xml
exit
