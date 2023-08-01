#!/bin/bash


ROUTER_LIST=(       r1.glb1 r1.cdn1 r2.cdn1 r1.isp1 r2.isp1 r3.isp1 r1.isp2 r2.isp2 r3.isp2 r1.isp3 r2.isp3 r3.isp3 r1.isp4 r2.isp4 r3.isp4 r1.org1 r1.org2 )
ROUTER_INT_NUMBER=( 6       7       3       5       5       5       5       5       5       5       5       5       5       5       5       4       4       )

INT_ADDRESS=(# enp1s0         enp2s0          enp3s0          enp4s0           enp5s0           enp6s0           enp7s0
#r1.glb1.lab   VLAN 100       VLAN 101        VLAN 103        VLAN 104         VLAN 105         VLAN 201
              '10.0.2.2/24    192.0.2.2/30    192.0.2.9/30    192.0.2.13/30    192.0.2.17/30    192.0.2.129/29'
#r1.cdn1.lab   VLAN 100       VLAN 102        VLAN 103        VLAN 106         VLAN 107         VLAN 301         VLAN 302
              '10.0.2.11/24   192.0.2.6/30    192.0.2.10/30   192.0.2.21/30    192.0.2.25/30    192.0.2.53/30    192.0.2.137/29'
#r2.cdn1.lab   VLAN 100       VLAN 301        VLAN 303
              '10.0.2.12/24   192.0.2.54/30   X'
#r1.isp1.lab   VLAN 100       VLAN 104        VLAN 109        VLAN 401         VLAN 402      
              '10.0.2.31/24   192.0.2.14/30   192.0.2.33/30   X                X'
#r2.isp1.lab   VLAN 100       VLAN 106        VLAN 110        VLAN 402         VLAN 403  
              '10.0.2.32/24   192.0.2.22/30   192.0.2.37/30   X                X'
#r3.isp1.lab   VLAN 100       VLAN 108        VLAN 404        VLAN 401         VLAN 403 
              '10.0.2.33/24   192.0.2.29/30   192.0.2.145/29  X                X'
#r1.isp2.lab   VLAN 100       VLAN 105        VLAN 111        VLAN 501         VLAN 502
              '10.0.2.41/24   192.0.2.18/30   192.0.2.41/30   X                X'
#r2.isp2.lab   VLAN 100       VLAN 107        VLAN 112        VLAN 502         VLAN 503
              '10.0.2.42/24   192.0.2.26/30   192.0.2.45/30   X                X'
#r3.isp2.lab   VLAN 100       VLAN 108        VLAN 504        VLAN 501         VLAN 503 
              '10.0.2.43/24   192.0.2.30/30   192.0.2.153/29  X                X'
#r1.isp3.lab   VLAN 100       VLAN 109        VLAN 601        VLAN 603         VLAN 605
              '10.0.2.51/24   192.0.2.34/30   X               X                X'
#r2.isp3.lab   VLAN 100       VLAN 111        VLAN 602        VLAN 603         VLAN 606
              '10.0.2.52/24   192.0.2.42/30   X               X                X'
#r3.isp3.lab   VLAN 100       VLAN 113        VLAN 604        VLAN 601         VLAN 602
              '10.0.2.53/24   192.0.2.49/30   192.0.2.161/29  X                X' 
#r1.isp4.lab   VLAN 100       VLAN 110        VLAN 701        VLAN 703         VLAN 706
              '10.0.2.61/24   192.0.2.38/30   X               X                X'
#r2.isp4.lab   VLAN 100       VLAN 112        VLAN 702        VLAN 703         VLAN 705
              '10.0.2.62/24   192.0.2.46/30   X               X                X'
#r3.isp4.lab   VLAN 100       VLAN 113        VLAN 704        VLAN 701         VLAN 702 
              '10.0.2.63/24   192.0.2.50/30   192.0.2.169/29  X                X'
#r1.org1.lab   VLAN 100       VLAN 605        VLAN 706        VLAN 1101
              '10.0.2.71/24   X               X               X'        
#r1.org2.lab   VLAN 100       VLAN 705        VLAN 606        VLAN 1201          
              '10.0.2.91/24   X               X               X'        
)


for i in `seq 0 $(( ${#ROUTER_LIST[@]} - 1 ))`; do
  echo "router ${ROUTER_LIST[$i]} int number ${ROUTER_INT_NUMBER[$i]} "
  
done

for i in `seq 0 $(( ${#ROUTER_LIST[@]} - 1 ))`; do
  echo ${ROUTER_LIST[$i]}
  IP=${INT_ADDRESS[$i]}
  ADDR=($(echo $IP | tr '[:space:]' '\n'))
  for j in `seq ${ROUTER_INT_NUMBER[$i]}`; do
    g=j-1
    cat <<EOF
auto enp${j}s0
iface enp${j}s0 inet static
    address ${ADDR[$g]}
EOF
    cat >>interfaces.${ROUTER_LIST[$i]}.lab <<EOF
auto enp${j}s0
iface enp${j}s0 inet static
    address ${ADDR[$g]}
EOF
  done
  echo
done

exit
