# ==================================================
# Interface GNS3 (/etc/network/interfaces)
# ==================================================

# Router Cyberia
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 192.233.56.1
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 192.233.56.129
    netmask 255.255.255.252
    up ip route add 192.233.0.0/19 via 192.233.56.130
    up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Router Wired
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.56.130
    netmask 255.255.255.252
    gateway 192.233.56.129

auto eth1
iface eth1 inet static
    address 192.233.34.73
    netmask 255.255.255.248
    up ip route add 192.233.24.0/19 via 192.233.34.74

auto eth2
iface eth2 inet static
    address 192.233.18.65
    netmask 255.255.255.252
    up ip route add 192.233.16.0/21 via 192.233.18.66

auto eth3
iface eth3 inet static
    address 192.233.3.41
    netmask 255.255.255.252
    up ip route add 192.233.0.0/20 via 192.233.3.42

# Router Psyche
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.34.74
    netmask 255.255.255.248
    gateway 192.233.34.73

auto eth1
iface eth1 inet static
    address 192.233.24.1
    netmask 255.255.252.0

# Router Copland
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.34.75
    netmask 255.255.255.248
    gateway 192.233.34.73

auto eth1
iface eth1 inet static
    address 192.233.34.1
    netmask 255.255.255.192

auto eth2
iface eth2 inet static
    address 192.233.32.1
    netmask 255.255.254.0

# Router Schumann
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.34.76
    netmask 255.255.255.248
    gateway 192.233.34.73

auto eth1
iface eth1 inet static
    address 192.233.34.65
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.233.34.81
    netmask 255.255.255.252
    up ip route add 192.233.28.0/22 via 192.233.34.82

# Router Accela
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.34.82
    netmask 255.255.255.252
    gateway 192.233.34.81

auto eth1
iface eth1 inet static
    address 192.233.28.1
    netmask 255.255.252.0

# Router Navi
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.18.66
    netmask 255.255.255.252
    gateway 192.233.18.65

auto eth1
iface eth1 inet static
    address 192.233.16.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.233.18.1
    netmask 255.255.255.192

auto eth3
iface eth3 inet static
    address 192.233.17.1
    netmask 255.255.255.0

# Router Tachibana
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.42
    netmask 255.255.255.252
    gateway 192.233.3.41

auto eth1
iface eth1 inet static
    address 192.233.0.1
    netmask 255.255.254.0

auto eth2
iface eth2 inet static
    address 192.233.3.45
    netmask 255.255.255.252
    up ip route add 192.233.2.0/23 via 192.233.3.46
    up ip route add 192.233.3.0/26 via 192.233.3.46

# Router Deus
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.46
    netmask 255.255.255.252
    gateway 192.233.3.45

auto eth1
iface eth1 inet static
    address 192.233.2.1
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 192.233.3.49
    netmask 255.255.255.252
    up ip route add 192.233.2.128/25 via 192.233.3.50
    up ip route add 192.233.3.0/26 via 192.233.3.50

# Router Protocol7
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.50
    netmask 255.255.255.252
    gateway 192.233.3.49

auto eth1
iface eth1 inet static
    address 192.233.2.193
    netmask 255.255.255.192

auto eth2
iface eth2 inet static
    address 192.233.3.53
    netmask 255.255.255.252
    up ip route add 192.233.2.128/26 via 192.233.3.54
    up ip route add 192.233.3.0/27 via 192.233.3.54

# Router Knights
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.54
    netmask 255.255.255.252
    gateway 192.233.3.53

auto eth1
iface eth1 inet static
    address 192.233.3.33
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.233.3.57
    netmask 255.255.255.252
    up ip route add 192.233.2.128/26 via 192.233.3.58
    up ip route add 192.233.3.0/27 via 192.233.3.58

# Router Phantoma
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.58
    netmask 255.255.255.252
    gateway 192.233.3.57

auto eth1
iface eth1 inet static
    address 192.233.3.1
    netmask 255.255.255.224

auto eth2
iface eth2 inet static
    address 192.233.3.61
    netmask 255.255.255.252
    up ip route add 192.233.2.128/26 via 192.233.3.62

# Router Shibuya
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.62
    netmask 255.255.255.252
    gateway 192.233.3.61

auto eth1
iface eth1 inet static
    address 192.233.2.129
    netmask 255.255.255.192

# ==================================================
# Client Nodes GNS3 (/etc/network/interfaces)
# ==================================================

# JJ (Subnet A1 - 95 host)
auto eth0
iface eth0 inet static
    address 192.233.56.2
    netmask 255.255.255.128
    gateway 192.233.56.1

# MyuMyu (Subnet A1 - 30 host)
auto eth0
iface eth0 inet static
    address 192.233.56.97
    netmask 255.255.255.128
    gateway 192.233.56.1

# Karl (Subnet A4 - 700 host)
auto eth0
iface eth0 inet static
    address 192.233.24.2
    netmask 255.255.252.0
    gateway 192.233.24.1

# Lin (Subnet A4 - 180 host)
auto eth0
iface eth0 inet static
    address 192.233.26.190
    netmask 255.255.252.0
    gateway 192.233.24.1

# Juri (Subnet A5 - 31 host)
auto eth0
iface eth0 inet static
    address 192.233.34.2
    netmask 255.255.255.192
    gateway 192.233.34.1

# Masayuki (Subnet A6 - 300 host)
auto eth0
iface eth0 inet static
    address 192.233.32.2
    netmask 255.255.254.0
    gateway 192.233.32.1

# Akashic (Subnet A7 - 3 host)
auto eth0
iface eth0 inet static
    address 192.233.34.66
    netmask 255.255.255.248
    gateway 192.233.34.65

# Omnipresence (Subnet A9 - 510 host)
auto eth0
iface eth0 inet static
    address 192.233.28.2
    netmask 255.255.252.0
    gateway 192.233.28.1

# Denpa (Subnet A9 - 3 host)
auto eth0
iface eth0 inet static
    address 192.233.30.0
    netmask 255.255.252.0
    gateway 192.233.28.1

# Alice (Subnet A11 - 208 host)
auto eth0
iface eth0 inet static
    address 192.233.16.2
    netmask 255.255.255.0
    gateway 192.233.16.1

# Reika (Subnet A11 - 45 host)
auto eth0
iface eth0 inet static
    address 192.233.16.210
    netmask 255.255.255.0
    gateway 192.233.16.1

# Taro (Subnet A12 - 57 host)
auto eth0
iface eth0 inet static
    address 192.233.18.2
    netmask 255.255.255.192
    gateway 192.233.18.1

# Yasuo (Subnet A13 - 120 host)
auto eth0
iface eth0 inet static
    address 192.233.17.2
    netmask 255.255.255.0
    gateway 192.233.17.1

# Miho (Subnet A13 - 18 host)
auto eth0
iface eth0 inet static
    address 192.233.17.122
    netmask 255.255.255.0
    gateway 192.233.17.1

# Kuma (Subnet A13 - 4 host)
auto eth0
iface eth0 inet static
    address 192.233.17.140
    netmask 255.255.255.0
    gateway 192.233.17.1

# Collective (Subnet A15 - 260 host)
auto eth0
iface eth0 inet static
    address 192.233.0.2
    netmask 255.255.254.0
    gateway 192.233.0.1

# Ghost (Subnet A15 - 6 host)
auto eth0
iface eth0 inet static
    address 192.233.1.6
    netmask 255.255.254.0
    gateway 192.233.0.1

# Lilith (Subnet A17 - 77 host)
auto eth0
iface eth0 inet static
    address 192.233.2.2
    netmask 255.255.255.128
    gateway 192.233.2.1

# Specter (Subnet A17 - 21 host)
auto eth0
iface eth0 inet static
    address 192.233.2.79
    netmask 255.255.255.128
    gateway 192.233.2.1

# Chisa (Subnet A19 - 23 host)
auto eth0
iface eth0 inet static
    address 192.233.2.194
    netmask 255.255.255.192
    gateway 192.233.2.193

# Hodgeson (Subnet A19 - 9 host)
auto eth0
iface eth0 inet static
    address 192.233.2.217
    netmask 255.255.255.192
    gateway 192.233.2.193

# Eiri (Subnet A21 - 2 host)
auto eth0
iface eth0 inet static
    address 192.233.3.34
    netmask 255.255.255.248
    gateway 192.233.3.33

# Semi (Subnet A23 - 14 host)
auto eth0
iface eth0 inet static
    address 192.233.3.2
    netmask 255.255.255.224
    gateway 192.233.3.1

# Lain (Subnet A25 - 57 host)
auto eth0
iface eth0 inet static
    address 192.233.2.130
    netmask 255.255.255.192
    gateway 192.233.2.129

# Mika (Subnet A25 - 4 host)
auto eth0
iface eth0 inet static
    address 192.233.2.187
    netmask 255.255.255.192
    gateway 192.233.2.129



# ==========================================
# INTERFACE  CISCO
# ==========================================


:: === SUBNET A1 (Switch1 - Cyberia) ===
:: Node: JJ (95 host)
ipconfig 192.233.14.2 255.255.255.128 192.233.14.1

:: Node: MyuMyu (30 host)
ipconfig 192.233.14.3 255.255.255.128 192.233.14.1

:: === SUBNET A4 (Switch3 - Psyche) ===
:: Node: Karl (700 host)
ipconfig 192.233.0.2 255.255.252.0 192.233.0.1

:: Node: Lin (180 host)
ipconfig 192.233.0.3 255.255.252.0 192.233.0.1

:: === SUBNET A5 (Direct ke Copland Fa0/1) ===
:: Node: Juri (31 host)
ipconfig 192.233.15.194 255.255.255.192 192.233.15.193

:: === SUBNET A6 (Switch4 - Copland) ===
:: Node: Masayuki (300 host)
ipconfig 192.233.8.2 255.255.254.0 192.233.8.1

:: === SUBNET A7 (Direct ke Schumann Fa0/1) ===
:: Node: Akashic (3 host)
ipconfig 192.233.16.42 255.255.255.248 192.233.16.41

:: === SUBNET A9 (Switch5 - Accela) ===
:: Node: Omnipresence (510 host)
ipconfig 192.233.4.2 255.255.252.0 192.233.4.1

:: Node: Denpa (3 host)
ipconfig 192.233.4.3 255.255.252.0 192.233.4.1

:: === SUBNET A11 (Switch6 - Navi) ===
:: Node: Alice (208 host)
ipconfig 192.233.12.2 255.255.255.0 192.233.12.1

:: Node: Reika (45 host)
ipconfig 192.233.12.3 255.255.255.0 192.233.12.1

:: === SUBNET A12 (Switch7 - Navi) ===
:: Node: Taro (57 host)
ipconfig 192.233.15.66 255.255.255.192 192.233.15.65

:: === SUBNET A13 (Switch8 - Navi) ===
:: Node: Yasuo (120 host)
ipconfig 192.233.13.2 255.255.255.0 192.233.13.1

:: Node: Miho (18 host)
ipconfig 192.233.13.3 255.255.255.0 192.233.13.1

:: Node: Kuma (4 host)
ipconfig 192.233.13.4 255.255.255.0 192.233.13.1

:: === SUBNET A15 (Switch9 - Tachibana) ===
:: Node: Collective (260 host)
ipconfig 192.233.10.2 255.255.254.0 192.233.10.1

:: Node: Ghost (6 host)
ipconfig 192.233.10.3 255.255.254.0 192.233.10.1

:: === SUBNET A17 (Switch10 - Deus) ===
:: Node: Lilith (77 host)
ipconfig 192.233.14.130 255.255.255.128 192.233.14.129

:: Node: Specter (21 host)
ipconfig 192.233.14.131 255.255.255.128 192.233.14.129

:: === SUBNET A19 (Switch11 - Protocol7) ===
:: Node: Chisa (23 host)
ipconfig 192.233.15.130 255.255.255.192 192.233.15.129

:: Node: Hodgeson (9 host)
ipconfig 192.233.15.131 255.255.255.192 192.233.15.129

:: === SUBNET A21 (Direct ke Knights Fa0/1) ===
:: Node: Eiri (2 host)
ipconfig 192.233.16.50 255.255.255.248 192.233.16.49

:: === SUBNET A23 (Switch12 - Phantoma) ===
:: Node: Semi (14 host)
ipconfig 192.233.16.2 255.255.255.224 192.233.16.1

:: === SUBNET A25 (Switch13 - Shibuya) ===
:: Node: Lain (57 host)
ipconfig 192.233.15.2 255.255.255.192 192.233.15.1

:: Node: Mika (4 host)
ipconfig 192.233.15.3 255.255.255.192 192.233.15.1

#ROUTER CYBERIA

enable
configure terminal
hostname Cyberia
interface FastEthernet0/0
 ip address 192.233.14.1 255.255.255.128
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.16.57 255.255.255.252
 no shutdown
 exit
interface FastEthernet1/0
 no shutdown
 exit
ip route 192.233.0.0 255.255.224.0 192.233.16.58
end
write memory

#ROUTER WIRED

enable
configure terminal
hostname Wired
interface FastEthernet0/0
 ip address 192.233.16.58 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.16.33 255.255.255.248
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.16.65 255.255.255.252
 no shutdown
 exit
interface FastEthernet1/1
 ip address 192.233.16.69 255.255.255.252
 no shutdown
 exit
ip route 192.233.14.0 255.255.255.128 192.233.16.57
ip route 192.233.0.0 255.255.252.0 192.233.16.34
ip route 192.233.8.0 255.255.254.0 192.233.16.35
ip route 192.233.15.192 255.255.255.192 192.233.16.35
ip route 192.233.4.0 255.255.252.0 192.233.16.36
ip route 192.233.16.40 255.255.255.248 192.233.16.36
ip route 192.233.16.60 255.255.255.252 192.233.16.36
ip route 192.233.12.0 255.255.254.0 192.233.16.66
ip route 192.233.15.64 255.255.255.192 192.233.16.66
ip route 192.233.10.0 255.255.254.0 192.233.16.70
ip route 192.233.14.128 255.255.255.128 192.233.16.70
ip route 192.233.15.0 255.255.255.192 192.233.16.70
ip route 192.233.15.128 255.255.255.192 192.233.16.70
ip route 192.233.16.0 255.255.255.224 192.233.16.70
ip route 192.233.16.48 255.255.255.248 192.233.16.70
ip route 192.233.16.72 255.255.255.248 192.233.16.70
ip route 192.233.16.80 255.255.255.248 192.233.16.70
ip route 192.233.16.88 255.255.255.252 192.233.16.70
ip route 0.0.0.0 0.0.0.0 192.233.16.57
end
write memory

#ROUTER PSYCHE

enable
configure terminal
hostname Psyche
interface FastEthernet0/0
 ip address 192.233.16.34 255.255.255.248
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.0.1 255.255.252.0
 no shutdown
 exit
ip route 192.233.8.0 255.255.254.0 192.233.16.35
ip route 192.233.15.192 255.255.255.192 192.233.16.35
ip route 192.233.4.0 255.255.252.0 192.233.16.36
ip route 192.233.16.40 255.255.255.248 192.233.16.36
ip route 192.233.16.60 255.255.255.252 192.233.16.36
ip route 0.0.0.0 0.0.0.0 192.233.16.33
end
write memory

#ROUTER Copland

eenable
configure terminal
hostname Copland
interface FastEthernet0/0
 ip address 192.233.16.35 255.255.255.248
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.15.193 255.255.255.192
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.8.1 255.255.254.0
 no shutdown
 exit
ip route 192.233.0.0 255.255.252.0 192.233.16.34
ip route 192.233.4.0 255.255.252.0 192.233.16.36
ip route 192.233.16.40 255.255.255.248 192.233.16.36
ip route 192.233.16.60 255.255.255.252 192.233.16.36
ip route 0.0.0.0 0.0.0.0 192.233.16.33
end
write memory

#ROUTER Schumann

enable
configure terminal
hostname Schumann
interface FastEthernet0/0
 ip address 192.233.16.36 255.255.255.248
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.16.41 255.255.255.248
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.16.61 255.255.255.252
 no shutdown
 exit
ip route 192.233.4.0 255.255.252.0 192.233.16.62
ip route 192.233.0.0 255.255.252.0 192.233.16.34
ip route 192.233.8.0 255.255.254.0 192.233.16.35
ip route 192.233.15.192 255.255.255.192 192.233.16.35
ip route 0.0.0.0 0.0.0.0 192.233.16.33
end
write memory

# ROUTER Accela

enable
configure terminal
hostname Accela
interface FastEthernet0/0
 ip address 192.233.16.62 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.4.1 255.255.252.0
 no shutdown
 exit
ip route 0.0.0.0 0.0.0.0 192.233.16.61
end
write memory

# Router Navi

enable
configure terminal
hostname Navi
interface FastEthernet0/0
 ip address 192.233.16.66 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.12.1 255.255.255.0
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.15.65 255.255.255.192
 no shutdown
 exit
interface FastEthernet1/1
 ip address 192.233.13.1 255.255.255.0
 no shutdown
 exit
ip route 0.0.0.0 0.0.0.0 192.233.16.65
end
write memory

# Router Tachibana

enable
configure terminal
hostname Tachibana
interface FastEthernet0/0
 ip address 192.233.16.70 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.10.1 255.255.254.0
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.16.73 255.255.255.252
 no shutdown
 exit
ip route 192.233.14.128 255.255.255.128 192.233.16.74
ip route 192.233.15.0 255.255.255.192 192.233.16.74
ip route 192.233.15.128 255.255.255.192 192.233.16.74
ip route 192.233.16.0 255.255.255.224 192.233.16.74
ip route 192.233.16.48 255.255.255.248 192.233.16.74
ip route 192.233.16.76 255.255.255.252 192.233.16.74
ip route 192.233.16.80 255.255.255.248 192.233.16.74
ip route 192.233.16.88 255.255.255.252 192.233.16.74
ip route 0.0.0.0 0.0.0.0 192.233.16.69
end
write memory

# Router Deus

enable
configure terminal
hostname Deus
interface FastEthernet0/0
 ip address 192.233.16.74 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.14.129 255.255.255.128
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.16.77 255.255.255.252
 no shutdown
 exit
ip route 192.233.15.0 255.255.255.192 192.233.16.78
ip route 192.233.15.128 255.255.255.192 192.233.16.78
ip route 192.233.16.0 255.255.255.224 192.233.16.78
ip route 192.233.16.48 255.255.255.248 192.233.16.78
ip route 192.233.16.80 255.255.255.248 192.233.16.78
ip route 192.233.16.88 255.255.255.252 192.233.16.78
ip route 0.0.0.0 0.0.0.0 192.233.16.73
end
write memory

# Router Protocol17

enable
configure terminal
hostname Protocol7
interface FastEthernet0/0
 ip address 192.233.16.78 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.15.129 255.255.255.192
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.16.81 255.255.255.252
 no shutdown
 exit
ip route 192.233.15.0 255.255.255.192 192.233.16.82
ip route 192.233.16.0 255.255.255.224 192.233.16.82
ip route 192.233.16.48 255.255.255.248 192.233.16.82
ip route 192.233.16.84 255.255.255.252 192.233.16.82
ip route 192.233.16.88 255.255.255.252 192.233.16.82
ip route 0.0.0.0 0.0.0.0 192.233.16.77
end
write memory

# ROUTER Knights

enable
configure terminal
hostname Knights
interface FastEthernet0/0
 ip address 192.233.16.82 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.16.49 255.255.255.248
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.16.85 255.255.255.252
 no shutdown
 exit
ip route 192.233.15.0 255.255.255.192 192.233.16.86
ip route 192.233.16.0 255.255.255.224 192.233.16.86
ip route 192.233.16.88 255.255.255.252 192.233.16.86
ip route 0.0.0.0 0.0.0.0 192.233.16.81
end
write memory

# Router Phantoma

enable
configure terminal
hostname Phantoma
interface FastEthernet0/0
 ip address 192.233.16.86 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.16.1 255.255.255.224
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.233.16.89 255.255.255.252
 no shutdown
 exit
ip route 192.233.15.0 255.255.255.192 192.233.16.90
ip route 0.0.0.0 0.0.0.0 192.233.16.85
end
write memory

# Router Shibuya

enable
configure terminal
hostname Shibuya
interface FastEthernet0/0
 ip address 192.233.16.90 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/1
 ip address 192.233.15.1 255.255.255.192
 no shutdown
 exit
ip route 0.0.0.0 0.0.0.0 192.233.16.89
end
write memory


