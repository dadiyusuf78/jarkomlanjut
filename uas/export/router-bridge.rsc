# jan/26/2024 03:10:23 by RouterOS 6.48.7
# software id = 44UU-TR2K
#
# model = RouterBOARD 941-2nD
# serial number = 8B0E08B7BB28
/interface bridge
add ingress-filtering=yes name=bridge1 vlan-filtering=yes
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface vlan
add interface=bridge1 name=vlan50 vlan-id=50
/interface ethernet switch
set 0 mirror-target=ether1
/interface ethernet switch port
set 0 default-vlan-id=1 vlan-header=always-strip vlan-mode=secure
set 1 default-vlan-id=11 vlan-header=always-strip vlan-mode=secure
set 2 default-vlan-id=12 vlan-header=always-strip vlan-mode=secure
set 5 default-vlan-id=50 vlan-header=always-strip vlan-mode=secure
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=bridge1 interface=ether1
add bridge=bridge1 frame-types=admit-only-untagged-and-priority-tagged \
    ingress-filtering=yes interface=ether2 pvid=11
add bridge=bridge1 frame-types=admit-only-untagged-and-priority-tagged \
    ingress-filtering=yes interface=ether3 pvid=12
/interface bridge vlan
add bridge=bridge1 tagged=ether1 untagged=ether2 vlan-ids=11
add bridge=bridge1 tagged=ether1 untagged=ether3 vlan-ids=12
add bridge=bridge1 tagged=ether1,bridge1 vlan-ids=50
/interface ethernet switch vlan
add ports=ether1 switch=switch1 vlan-id=1
add ports=ether2 switch=switch1 vlan-id=11
add ports=ether3 switch=switch1 vlan-id=12
/system clock
set time-zone-name=Asia/Jakarta
