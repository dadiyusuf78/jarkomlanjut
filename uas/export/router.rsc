# jan/26/2024 03:14:50 by RouterOS 6.48.6
# software id = XF27-WJ41
#
# model = RB941-2nD
# serial number = A1C30BB18CA4
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface vlan
add interface=ether4 name=vlan50 vlan-id=50
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.50.2-192.168.50.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether4 name=dhcp1
/ip address
add address=192.168.50.1/24 interface=ether4 network=192.168.50.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.50.0/24 gateway=192.168.50.1
/ip firewall nat
add action=masquerade chain=srcnat
/system clock
set time-zone-name=Asia/Jakarta
