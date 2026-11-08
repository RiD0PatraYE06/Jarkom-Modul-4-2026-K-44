# Jarkom-Modul-4-2026-K-44

**Kelompok:** K-44  
 

### Anggota Kelompok
| Nama | NRP |
| :--- | :--- |
| Nayarfa Syamahira Dyananta | 5027251046 |
| Rido Patra | 502524xxxx |

---

## 1. Identifikasi Kebutuhan IP Tiap Rute
Berdasarkan jumlah host pada gambar topologi ditambah jumlah interface router pada masing-masing segmen jaringan, diperoleh rincian kebutuhan IP dan netmask sebagai berikut:

| Nama Subnet | Rute | Jumlah Host | Router | IP Dibutuhkan | Kapasitas ($2^h$) | Prefix |
| :---: | :--- | :---: | :---: | :---: | :---: | :---: |
| A1 | Cyberia > Switch1 > JJ, MyuMyu | 95 + 30 = 125 | 1 | 126 | 128 | `/25` |
| A2 | Cyberia > Wired | 0 | 2 | 2 | 4 | `/30` |
| A3 | Wired > Switch2 > Psyche, Copland, Schumann | 0 | 4 | 4 | 8 | `/29` |
| A4 | Psyche > Switch3 > Karl, Lin | 700 + 180 = 880 | 1 | 881 | 1024 | `/22` |
| A5 | Copland > Juri | 31 | 1 | 32 | 64 | `/26` |
| A6 | Copland > Switch4 > Masayuki | 300 | 1 | 301 | 512 | `/23` |
| A7 | Schumann > Akashic | 3 | 1 | 4 | 8 | `/29` |
| A8 | Schumann > Accela | 0 | 2 | 2 | 4 | `/30` |
| A9 | Accela > Switch5 > Omnipresence, Denpa | 510 + 3 = 513 | 1 | 514 | 1024 | `/22` |
| A10 | Wired > Navi | 0 | 2 | 2 | 4 | `/30` |
| A11 | Navi > Switch6 > Alice, Reika | 208 + 45 = 253 | 1 | 254 | 256 | `/24` |
| A12 | Navi > Switch7 > Taro | 57 | 1 | 58 | 64 | `/26` |
| A13 | Navi > Switch8 > Yasuo, Miho, Kuma | 120 + 18 + 4 = 142 | 1 | 143 | 256 | `/24` |
| A14 | Wired > Tachibana | 0 | 2 | 2 | 4 | `/30` |
| A15 | Tachibana > Switch9 > Collective, Ghost | 260 + 6 = 266 | 1 | 267 | 512 | `/23` |
| A16 | Tachibana > Deus | 0 | 2 | 2 | 4 | `/30` |
| A17 | Deus > Switch10 > Lilith, Specter | 77 + 21 = 98 | 1 | 99 | 128 | `/25` |
| A18 | Deus > Protocol7 | 0 | 2 | 2 | 4 | `/30` |
| A19 | Protocol7 > Switch11 > Chisa, Hodgeson | 23 + 9 = 32 | 1 | 33 | 64 | `/26` |
| A20 | Protocol7 > Knights | 0 | 2 | 2 | 4 | `/30` |
| A21 | Knights > Eiri | 2 | 1 | 3 | 8 | `/29` |
| A22 | Knights > Phantoma | 0 | 2 | 2 | 4 | `/30` |
| A23 | Phantoma > Switch12 > Semi | 14 | 1 | 15 | 32 | `/27` |
| A24 | Phantoma > Shibuya | 0 | 2 | 2 | 4 | `/30` |
| A25 | Shibuya > Switch13 > Lain, Mika | 57 + 4 = 61 | 1 | 62 | 64 | `/26` |
| **Total** | | | | **2814** | **4188** | **`/19`** |

Karena total kapasitas blok yang dibutuhkan adalah 4188 alamat IP, maka prefix induk yang digunakan untuk menaungi seluruh jaringan adalah **`192.233.0.0/19`** (kapasitas 8192 IP, netmask `255.255.224.0`).

---

## 2. Perhitungan Pembagian IP (VLSM)
Pembagian IP dilakukan dengan mengurutkan subnet dari kapasitas kebutuhan terbesar (`/22`) hingga terkecil (`/30`) agar tidak terjadi tumpang tindih (*overlap*) alamat IP:

| Subnet | Network ID | Netmask | Broadcast | Range IP |
| :---: | :---: | :---: | :---: | :---: |
| A4 | `192.233.0.0` | `255.255.252.0` | `192.233.3.255` | `192.233.0.1 - 192.233.3.254` |
| A9 | `192.233.4.0` | `255.255.252.0` | `192.233.7.255` | `192.233.4.1 - 192.233.7.254` |
| A6 | `192.233.8.0` | `255.255.254.0` | `192.233.9.255` | `192.233.8.1 - 192.233.9.254` |
| A15 | `192.233.10.0` | `255.255.254.0` | `192.233.11.255` | `192.233.10.1 - 192.233.11.254` |
| A11 | `192.233.12.0` | `255.255.255.0` | `192.233.12.255` | `192.233.12.1 - 192.233.12.254` |
| A13 | `192.233.13.0` | `255.255.255.0` | `192.233.13.255` | `192.233.13.1 - 192.233.13.254` |
| A1 | `192.233.14.0` | `255.255.255.128` | `192.233.14.127` | `192.233.14.1 - 192.233.14.126` |
| A17 | `192.233.14.128` | `255.255.255.128` | `192.233.14.255` | `192.233.14.129 - 192.233.14.254` |
| A25 | `192.233.15.0` | `255.255.255.192` | `192.233.15.63` | `192.233.15.1 - 192.233.15.62` |
| A12 | `192.233.15.64` | `255.255.255.192` | `192.233.15.127` | `192.233.15.65 - 192.233.15.126` |
| A19 | `192.233.15.128` | `255.255.255.192` | `192.233.15.191` | `192.233.15.129 - 192.233.15.190` |
| A5 | `192.233.15.192` | `255.255.255.192` | `192.233.15.255` | `192.233.15.193 - 192.233.15.254` |
| A23 | `192.233.16.0` | `255.255.255.224` | `192.233.16.31` | `192.233.16.1 - 192.233.16.30` |
| A3 | `192.233.16.32` | `255.255.255.248` | `192.233.16.39` | `192.233.16.33 - 192.233.16.38` |
| A7 | `192.233.16.40` | `255.255.255.248` | `192.233.16.47` | `192.233.16.41 - 192.233.16.46` |
| A21 | `192.233.16.48` | `255.255.255.248` | `192.233.16.55` | `192.233.16.49 - 192.233.16.54` |
| A2 | `192.233.16.56` | `255.255.255.252` | `192.233.16.59` | `192.233.16.57 - 192.233.16.58` |
| A8 | `192.233.16.60` | `255.255.255.252` | `192.233.16.63` | `192.233.16.61 - 192.233.16.62` |
| A10 | `192.233.16.64` | `255.255.255.252` | `192.233.16.67` | `192.233.16.65 - 192.233.16.66` |
| A14 | `192.233.16.68` | `255.255.255.252` | `192.233.16.71` | `192.233.16.69 - 192.233.16.70` |
| A16 | `192.233.16.72` | `255.255.255.252` | `192.233.16.75` | `192.233.16.73 - 192.233.16.74` |
| A18 | `192.233.16.76` | `255.255.255.252` | `192.233.16.79` | `192.233.16.77 - 192.233.16.78` |
| A20 | `192.233.16.80` | `255.255.255.252` | `192.233.16.83` | `192.233.16.81 - 192.233.16.82` |
| A22 | `192.233.16.84` | `255.255.255.252` | `192.233.16.87` | `192.233.16.85 - 192.233.16.86` |
| A24 | `192.233.16.88` | `255.255.255.252` | `192.233.16.91` | `192.233.16.89 - 192.233.16.90` |

---


## 3. Konfigurasi Perangkat CISCO

### A. Alokasi IP End-Device (PC, Laptop, Server)

| Subnet | Nama Node | Terhubung Ke | IPv4 Address | Subnet Mask | Default Gateway |
| :---: | :--- | :--- | :--- | :--- | :--- |
| A1 | JJ (95 host) | Switch1 | `192.233.14.2` | `255.255.255.128` | `192.233.14.1` |
| A1 | MyuMyu (30 host) | Switch1 | `192.233.14.3` | `255.255.255.128` | `192.233.14.1` |
| A4 | Karl (700 host) | Switch3 | `192.233.0.2` | `255.255.252.0` | `192.233.0.1` |
| A4 | Lin (180 host) | Switch3 | `192.233.0.3` | `255.255.252.0` | `192.233.0.1` |
| A5 | Juri (31 host) | Copland (`Fa0/1`) | `192.233.15.194` | `255.255.255.192` | `192.233.15.193` |
| A6 | Masayuki (300 host) | Switch4 | `192.233.8.2` | `255.255.254.0` | `192.233.8.1` |
| A7 | Akashic (3 host) | Schumann (`Fa0/1`) | `192.233.16.42` | `255.255.255.248` | `192.233.16.41` |
| A9 | Omnipresence (510 host) | Switch5 | `192.233.4.2` | `255.255.252.0` | `192.233.4.1` |
| A9 | Denpa (3 host) | Switch5 | `192.233.4.3` | `255.255.252.0` | `192.233.4.1` |
| A11 | Alice (208 host) | Switch6 | `192.233.12.2` | `255.255.255.0` | `192.233.12.1` |
| A11 | Reika (45 host) | Switch6 | `192.233.12.3` | `255.255.255.0` | `192.233.12.1` |
| A12 | Taro (57 host) | Switch7 | `192.233.15.66` | `255.255.255.192` | `192.233.15.65` |
| A13 | Yasuo (120 host) | Switch8 | `192.233.13.2` | `255.255.255.0` | `192.233.13.1` |
| A13 | Miho (18 host) | Switch8 | `192.233.13.3` | `255.255.255.0` | `192.233.13.1` |
| A13 | Kuma (4 host) | Switch8 | `192.233.13.4` | `255.255.255.0` | `192.233.13.1` |
| A15 | Collective (260 host) | Switch9 | `192.233.10.2` | `255.255.254.0` | `192.233.10.1` |
| A15 | Ghost (6 host) | Switch9 | `192.233.10.3` | `255.255.254.0` | `192.233.10.1` |
| A17 | Lilith (77 host) | Switch10 | `192.233.14.130` | `255.255.255.128` | `192.233.14.129` |
| A17 | Specter (21 host) | Switch10 | `192.233.14.131` | `255.255.255.128` | `192.233.14.129` |
| A19 | Chisa (23 host) | Switch11 | `192.233.15.130` | `255.255.255.192` | `192.233.15.129` |
| A19 | Hodgeson (9 host) | Switch11 | `192.233.15.131` | `255.255.255.192` | `192.233.15.129` |
| A21 | Eiri (2 host) | Knights (`Fa0/1`) | `192.233.16.50` | `255.255.255.248` | `192.233.16.49` |
| A23 | Semi (14 host) | Switch12 | `192.233.16.2` | `255.255.255.224` | `192.233.16.1` |
| A25 | Lain (57 host) | Switch13 | `192.233.15.2` | `255.255.255.192` | `192.233.15.1` |
| A25 | Mika (4 host) | Switch13 | `192.233.15.3` | `255.255.255.192` | `192.233.15.1` |

---

### B. Konfigurasi CLI Router Cisco 


#### 1. Router Cyberia
```ios
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
```

#### 2. Router Wired
```ios
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
```

#### 3. Router Psyche
```ios
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
```

#### 4. Router Copland
```ios
enable
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
```

#### 5. Router Schumann
```ios
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
```

#### 6. Router Accela
```ios
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
```

#### 7. Router Navi
```ios
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
```

#### 8. Router Tachibana
```ios
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
```

#### 9. Router Deus
```ios
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
```

#### 10. Router Protocol7
```ios
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
```

#### 11. Router Knights
```ios
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
```

#### 12. Router Phantoma
```ios
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
```

#### 13. Router Shibuya
```ios
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
```

---

## 4. Pengujian Konektivitas

```bat
:: Pengujian ping dari PC JJ (192.233.14.2 - Subnet A1) ke masing-masing cabang:
ping 192.233.0.2      :: ke Karl (Subnet A4 - Psyche)
ping 192.233.8.2      :: ke Masayuki (Subnet A6 - Copland)
ping 192.233.4.2      :: ke Omnipresence (Subnet A9 - Accela)
ping 192.233.12.2     :: ke Alice (Subnet A11 - Navi)
ping 192.233.13.4     :: ke Kuma (Subnet A13 - Navi)
ping 192.233.10.2     :: ke Collective (Subnet A15 - Tachibana)
ping 192.233.14.130   :: ke Lilith (Subnet A17 - Deus)
ping 192.233.15.130   :: ke Chisa (Subnet A19 - Protocol7)
ping 192.233.16.50    :: ke Eiri (Subnet A21 - Knights)
ping 192.233.16.2     :: ke Semi (Subnet A23 - Phantoma)
ping 192.233.15.2     :: ke Lain (Subnet A25 - Shibuya)

:: Pengujian jalur routing (traceroute) dari ujung atas (JJ) ke ujung bawah (Lain):
tracert 192.233.15.2
```

---
