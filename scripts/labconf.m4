divert(`-1')
changequote()
changequote(`,`)

##### HV NETWORK #####

#   net_def(sw-name)
#
define(`net_def`,`dnl
<network>
  <name>$1</name>
  <forward mode='bridge'/>
  <bridge name='$1'/>
  <virtualport type='openvswitch'/>dnl
`)dnl
#
#  net_portgroup(number)
#
define(`net_portgroup`,`dnl
ifelse($1,100,` dnl
  <portgroup name='vlan$1' default='yes'>dnl
`,` dnl
  <portgroup name='vlan$1'>dnl
`)
    <vlan>
      <tag id='$1'/>
    </vlan>
  </portgroup>dnl
`)dnl
#
define(`net_def_end`,`</network>`)dnl


##### VM NETWORK #####

#   vm_router_int(int,ip)
#
define(`vm_router_int`,`dnl
auto $1
iface $1 inet static
    address $2 
`)dnl


divert(0)dnl
