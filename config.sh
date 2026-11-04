# ==================================================
# Interface
# ==================================================

# Router

# Cyberia
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 192.233.32.1
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 192.233.32.129
    netmask 255.255.255.252
    up ip route add 192.233.0.0/17 via 192.233.32.130
    up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Wired
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.32.130
    netmask 255.255.255.252
    gateway 192.233.32.129

auto eth1
iface eth1 inet static
    address 192.233.20.1
    netmask 255.255.255.248
    up ip route add 192.233.0.0/19 via 192.233.20.2

auto eth2
iface eth2 inet static
    address 192.233.84.1
    netmask 255.255.255.252
    up ip route add 192.233.80.0/21 via 192.233.84.2

auto eth3
iface eth3 inet static
    address 192.233.74.1
    netmask 255.255.255.252
    up ip route add 192.233.64.0/20 via 192.233.74.2

# Psyche
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.20.2
    netmask 255.255.255.248
    gateway 192.233.20.1

auto eth1
iface eth1 inet static
    address 192.233.16.1
    netmask 255.255.252.0

# Copland
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.20.3
    netmask 255.255.255.248
    gateway 192.233.20.1

auto eth1
iface eth1 inet static
    address 192.233.10.1
    netmask 255.255.255.192

auto eth2
iface eth2 inet static
    address 192.233.8.1
    netmask 255.255.254.0

# Schumann
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.20.4
    netmask 255.255.255.248
    gateway 192.233.20.1

auto eth1
iface eth1 inet static
    address 192.233.4.1
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.233.4.9
    netmask 255.255.255.252
    up ip route add 192.233.0.0/22 via 192.233.4.10

# Accela
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.10
    netmask 255.255.255.252
    gateway 192.233.4.9

auto eth1
iface eth1 inet static
    address 192.233.0.1
    netmask 255.255.252.0

# Navi
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.84.2
    netmask 255.255.255.252
    gateway 192.233.84.1

auto eth1
iface eth1 inet static
    address 192.233.80.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.233.81.129
    netmask 255.255.255.192

auto eth3
iface eth3 inet static
    address 192.233.81.1
    netmask 255.255.255.128

# Tachibana
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.74.2
    netmask 255.255.255.252
    gateway 192.233.74.1

auto eth1
iface eth1 inet static
    address 192.233.72.1
    netmask 255.255.254.0

auto eth2
iface eth2 inet static
    address 192.233.68.129
    netmask 255.255.255.252
    up ip route add 192.233.64.0/21 via 192.233.68.130

# Deus
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.68.130
    netmask 255.255.255.252
    gateway 192.233.68.129

auto eth1
iface eth1 inet static
    address 192.233.68.1
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 192.233.66.65
    netmask 255.255.255.252
    up ip route add 192.233.64.0/22 via 192.233.66.66

# Protocol7
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.66.66
    netmask 255.255.255.252
    gateway 192.233.66.65

auto eth1
iface eth1 inet static
    address 192.233.66.1
    netmask 255.255.255.192

auto eth2
iface eth2 inet static
    address 192.233.65.9
    netmask 255.255.255.252
    up ip route add 192.233.64.0/23 via 192.233.65.10

# Knights
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.65.10
    netmask 255.255.255.252
    gateway 192.233.65.9

auto eth1
iface eth1 inet static
    address 192.233.65.1
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.233.64.161
    netmask 255.255.255.252
    up ip route add 192.233.64.0/24 via 192.233.64.162

# Phantoma
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.64.162
    netmask 255.255.255.252
    gateway 192.233.64.161

auto eth1
iface eth1 inet static
    address 192.233.64.129
    netmask 255.255.255.224

auto eth2
iface eth2 inet static
    address 192.233.64.65
    netmask 255.255.255.252
    up ip route add 192.233.64.0/25 via 192.233.64.66

# Shibuya
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.64.66
    netmask 255.255.255.252
    gateway 192.233.64.65

auto eth1
iface eth1 inet static
    address 192.233.64.1
    netmask 255.255.255.192

# =================================================

# Client

# JJ (Subnet A1)
auto eth0
iface eth0 inet static
    address 192.233.32.2
    netmask 255.255.255.128
    gateway 192.233.32.1

# MyuMyu (Subnet A1)
auto eth0
iface eth0 inet static
    address 192.233.32.3
    netmask 255.255.255.128
    gateway 192.233.32.1

# Karl (Subnet A4)
auto eth0
iface eth0 inet static
    address 192.233.16.2
    netmask 255.255.252.0
    gateway 192.233.16.1

# Lin (Subnet A4)
auto eth0
iface eth0 inet static
    address 192.233.16.3
    netmask 255.255.252.0
    gateway 192.233.16.1

# Juri (Subnet A5)
auto eth0
iface eth0 inet static
    address 192.233.10.2
    netmask 255.255.255.192
    gateway 192.233.10.1

# Masayuki (Subnet A6)
auto eth0
iface eth0 inet static
    address 192.233.8.2
    netmask 255.255.254.0
    gateway 192.233.8.1

# Akashic (Subnet A7)
auto eth0
iface eth0 inet static
    address 192.233.4.2
    netmask 255.255.255.248
    gateway 192.233.4.1

# Omnipresence (Subnet A9)
auto eth0
iface eth0 inet static
    address 192.233.0.2
    netmask 255.255.252.0
    gateway 192.233.0.1

# Denpa (Subnet A9)
auto eth0
iface eth0 inet static
    address 192.233.0.3
    netmask 255.255.252.0
    gateway 192.233.0.1

# Alice (Subnet A11)
auto eth0
iface eth0 inet static
    address 192.233.80.2
    netmask 255.255.255.0
    gateway 192.233.80.1

# Reika (Subnet A11)
auto eth0
iface eth0 inet static
    address 192.233.80.3
    netmask 255.255.255.0
    gateway 192.233.80.1

# Taro (Subnet A12)
auto eth0
iface eth0 inet static
    address 192.233.81.130
    netmask 255.255.255.192
    gateway 192.233.81.129

# Yasuo (Subnet A13)
auto eth0
iface eth0 inet static
    address 192.233.81.2
    netmask 255.255.255.128
    gateway 192.233.81.1

# Miho (Subnet A13)
auto eth0
iface eth0 inet static
    address 192.233.81.3
    netmask 255.255.255.128
    gateway 192.233.81.1

# Kuma (Subnet A13)
auto eth0
iface eth0 inet static
    address 192.233.81.4
    netmask 255.255.255.128
    gateway 192.233.81.1

# Collective (Subnet A15)
auto eth0
iface eth0 inet static
    address 192.233.72.2
    netmask 255.255.254.0
    gateway 192.233.72.1

# Ghost (Subnet A15)
auto eth0
iface eth0 inet static
    address 192.233.72.3
    netmask 255.255.254.0
    gateway 192.233.72.1

# Lilith (Subnet A17)
auto eth0
iface eth0 inet static
    address 192.233.68.2
    netmask 255.255.255.128
    gateway 192.233.68.1

# Specter (Subnet A17)
auto eth0
iface eth0 inet static
    address 192.233.68.3
    netmask 255.255.255.128
    gateway 192.233.68.1

# Chisa (Subnet A19)
auto eth0
iface eth0 inet static
    address 192.233.66.2
    netmask 255.255.255.192
    gateway 192.233.66.1

# Hodgeson (Subnet A19)
auto eth0
iface eth0 inet static
    address 192.233.66.3
    netmask 255.255.255.192
    gateway 192.233.66.1

# Eiri (Subnet A21)
auto eth0
iface eth0 inet static
    address 192.233.65.2
    netmask 255.255.255.248
    gateway 192.233.65.1

# Semi (Subnet A23)
auto eth0
iface eth0 inet static
    address 192.233.64.130
    netmask 255.255.255.224
    gateway 192.233.64.129

# Lain (Subnet A25)
auto eth0
iface eth0 inet static
    address 192.233.64.2
    netmask 255.255.255.192
    gateway 192.233.64.1

# Mika (Subnet A25)
auto eth0
iface eth0 inet static
    address 192.233.64.3
    netmask 255.255.255.192
    gateway 192.233.64.1