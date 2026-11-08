# Jarkom-Modul-4-2026-K-44

**Kelompok:** K-44  
 
### Anggota Kelompok
| Nama | NRP |
| --- | --- |
| Nayarfa Syamahira Dyananta | 5027251046 |
| Rido Patra Yudhistira Edwin | 5027251120 |

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

## 5. Perhitungan Pembagian IP (CIDR) & Penggabungan Subnet

### A. Tabel Pembagian IP Subnetting CIDR

Pada metode CIDR, pembagian IP dibagi berdasarkan pembagian blok wilayah (*Sayap*) utama dari topologi jaringan:

| Sayap / Wilayah | Subnet | Kebutuhan Host | Prefix CIDR | Network ID | Broadcast | Range IP Usable | Catatan |
| --- | --- | --- | --- | --- | --- | --- | --- |
| **BAWAH**<br>

<br>`192.233.0.0/20` | A15 | 266 | `/23` | `192.233.0.0` | `192.233.1.255` | `192.233.0.1 - 192.233.1.254` | LAN Tachibana |
|  | A17 | 98 | `/25` | `192.233.2.0` | `192.233.2.127` | `192.233.2.1 - 192.233.2.126` | LAN Deus |
|  | A25 | 61 | `/26` | `192.233.2.128` | `192.233.2.191` | `192.233.2.129 - 192.233.2.190` | Buddy Pair dg A19 |
|  | A19 | 32 | `/26` | `192.233.2.192` | `192.233.2.255` | `192.233.2.193 - 192.233.2.254` | Buddy Pair dg A25 |
|  | A23 | 14 | `/27` | `192.233.3.0` | `192.233.3.31` | `192.233.3.1 - 192.233.3.30` | LAN Phantoma |
|  | A21 | 2 | `/29` | `192.233.3.32` | `192.233.3.39` | `192.233.3.33 - 192.233.3.38` | Direct Link Knights |
|  | A14 | 0 | `/30` | `192.233.3.40` | `192.233.3.43` | `192.233.3.41 - 192.233.3.42` | WAN Wired-Tachibana |
|  | A16 | 0 | `/30` | `192.233.3.44` | `192.233.3.47` | `192.233.3.45 - 192.233.3.46` | WAN Tachibana-Deus |
|  | A18 | 0 | `/30` | `192.233.3.48` | `192.233.3.51` | `192.233.3.49 - 192.233.3.50` | WAN Deus-Protocol7 |
|  | A20 | 0 | `/30` | `192.233.3.52` | `192.233.3.55` | `192.233.3.53 - 192.233.3.54` | WAN Protocol7-Knights |
|  | A22 | 0 | `/30` | `192.233.3.56` | `192.233.3.59` | `192.233.3.57 - 192.233.3.58` | WAN Knights-Phantoma |
|  | A24 | 0 | `/30` | `192.233.3.60` | `192.233.3.63` | `192.233.3.61 - 192.233.3.62` | WAN Phantoma-Shibuya |
| **KANAN**<br>

<br>`192.233.16.0/21` | A11 | 253 | `/24` | `192.233.16.0` | `192.233.16.255` | `192.233.16.1 - 192.233.16.254` | Buddy Pair dg A13 |
|  | A13 | 142 | `/24` | `192.233.17.0` | `192.233.17.255` | `192.233.17.1 - 192.233.17.254` | Buddy Pair dg A11 |
|  | A12 | 57 | `/26` | `192.233.18.0` | `192.233.18.63` | `192.233.18.1 - 192.233.18.62` | LAN Taro |
|  | A10 | 0 | `/30` | `192.233.18.64` | `192.233.18.67` | `192.233.18.65 - 192.233.18.66` | WAN Wired-Navi |
| **KIRI**<br>

<br>`192.233.24.0/19` | A4 | 880 | `/22` | `192.233.24.0` | `192.233.27.255` | `192.233.24.1 - 192.233.27.254` | LAN Psyche |
|  | A9 | 513 | `/22` | `192.233.28.0` | `192.233.31.255` | `192.233.28.1 - 192.233.31.254` | LAN Accela |
|  | A6 | 300 | `/23` | `192.233.32.0` | `192.233.33.255` | `192.233.32.1 - 192.233.33.254` | LAN Copland |
|  | A5 | 31 | `/26` | `192.233.34.0` | `192.233.34.63` | `192.233.34.1 - 192.233.34.62` | Direct Link Copland |
|  | A7 | 3 | `/29` | `192.233.34.64` | `192.233.34.71` | `192.233.34.65 - 192.233.34.70` | Buddy Pair dg A3 |
|  | A3 | 0 | `/29` | `192.233.34.72` | `192.233.34.79` | `192.233.34.73 - 192.233.34.78` | Buddy Pair dg A7 (Switch2) |
|  | A8 | 0 | `/30` | `192.233.34.80` | `192.233.34.83` | `192.233.34.81 - 192.233.34.82` | WAN Schumann-Accela |
| **PUSAT**<br>

<br>`192.233.56.0/24` | A1 | 125 | `/25` | `192.233.56.0` | `192.233.56.127` | `192.233.56.1 - 192.233.56.126` | LAN Cyberia |
|  | A2 | 0 | `/30` | `192.233.56.128` | `192.233.56.131` | `192.233.56.129 - 192.233.56.130` | WAN Cyberia-Wired |

---

### B. Tahap Penggabungan Subnet (Supernetting / Aggregation Tree)

Proses CIDR Supernetting digabungkan secara bertahap (bottom-up tree) dari subnet individual hingga membentuk alamat **ROOT**:

#### Tahap I

* **B1** = A24 (`/30`, 4 IP) + A25 (`/26`, 64 IP) = 68 IP $\rightarrow$ Prefix Akhir: **`/25`**
* **B2** = A22 (`/30`, 4 IP) + A23 (`/27`, 32 IP) = 36 IP $\rightarrow$ Prefix Akhir: **`/26`**
* **B3** = A20 (`/30`, 4 IP) + A21 (`/29`, 8 IP) = 12 IP $\rightarrow$ Prefix Akhir: **`/28`**
* **B4** = A18 (`/30`, 4 IP) + A19 (`/26`, 64 IP) = 68 IP $\rightarrow$ Prefix Akhir: **`/25`**
* **B5** = A16 (`/30`, 4 IP) + A17 (`/25`, 128 IP) = 132 IP $\rightarrow$ Prefix Akhir: **`/24`**
* **B6** = A14 (`/30`, 4 IP) + A15 (`/23`, 512 IP) = 516 IP $\rightarrow$ Prefix Akhir: **`/22`**
* **B7** = A11 (`/24`, 256 IP) + A12 (`/26`, 64 IP) = 320 IP $\rightarrow$ Prefix Akhir: **`/23`**
* **B8** = A7 (`/29`, 8 IP) + A8 (`/30`, 4 IP) = 12 IP $\rightarrow$ Prefix Akhir: **`/28`**
* **B9** = A5 (`/26`, 64 IP) + A6 (`/23`, 512 IP) = 576 IP $\rightarrow$ Prefix Akhir: **`/22`**
* **B10** = A3 (`/29`, 8 IP) + A4 (`/22`, 1024 IP) = 1032 IP $\rightarrow$ Prefix Akhir: **`/21`**
* **B11** = A1 (`/25`, 128 IP) + A2 (`/30`, 4 IP) = 132 IP $\rightarrow$ Prefix Akhir: **`/24`**

#### Tahap II

* **C1** = B1 (`/25`, 128 IP) + B2 (`/26`, 64 IP) = 192 IP $\rightarrow$ Prefix Akhir: **`/24`**
* **C2** = B3 (`/28`, 16 IP) + B4 (`/25`, 128 IP) = 144 IP $\rightarrow$ Prefix Akhir: **`/24`**
* **C3** = B5 (`/24`, 256 IP) + B6 (`/22`, 1024 IP) = 1280 IP $\rightarrow$ Prefix Akhir: **`/21`**
* **C4** = B7 (`/23`, 512 IP) + A13 (`/25`, 128 IP) = 640 IP $\rightarrow$ Prefix Akhir: **`/22`**
* **C5** = B8 (`/28`, 16 IP) + A9 (`/22`, 1024 IP) = 1040 IP $\rightarrow$ Prefix Akhir: **`/21`**
* **C6** = B9 (`/22`, 1024 IP) + B10 (`/21`, 2048 IP) = 3072 IP $\rightarrow$ Prefix Akhir: **`/20`**
* **C7** = B11 (`/24`, 256 IP) + A10 (`/30`, 4 IP) = 260 IP $\rightarrow$ Prefix Akhir: **`/23`**

#### Tahap III

* **D1** = C1 (`/24`, 256 IP) + C2 (`/24`, 256 IP) = 512 IP $\rightarrow$ Prefix Akhir: **`/23`**
* **D2** = C3 (`/21`, 2048 IP) + C4 (`/22`, 1024 IP) = 3072 IP $\rightarrow$ Prefix Akhir: **`/20`**
* **D3** = C5 (`/21`, 2048 IP) + C6 (`/20`, 4096 IP) = 6144 IP $\rightarrow$ Prefix Akhir: **`/19`**

#### Tahap IV

* **E1** = D1 (`/23`, 512 IP) + D2 (`/20`, 4096 IP) = 4608 IP $\rightarrow$ Prefix Akhir: **`/19`**
* **E2** = D3 (`/19`, 6144 IP) + C7 (`/23`, 256 IP) = 6400 IP $\rightarrow$ Prefix Akhir: **`/19`**

#### Tahap V (ROOT)

* **ROOT** = E1 (`/19`, 4608 IP) + E2 (`/19`, 6400 IP) = 11008 IP $\rightarrow$ Prefix Akhir: **`/18`** (`192.233.0.0/18`)

---

## 6. Konfigurasi Perangkat GNS3 (Linux Networking)

### A. Alokasi IP Node Client GNS3 (Berdasarkan Host Offset)

| Subnet | Node Client | Jumlah Host | IPv4 Address | Subnet Mask | Default Gateway |
| --- | --- | --- | --- | --- | --- |
| A1 | JJ | 95 | `192.233.56.2` | `255.255.255.128` | `192.233.56.1` |
| A1 | MyuMyu | 30 | `192.233.56.97` | `255.255.255.128` | `192.233.56.1` |
| A4 | Karl | 700 | `192.233.24.2` | `255.255.252.0` | `192.233.24.1` |
| A4 | Lin | 180 | `192.233.26.190` | `255.255.252.0` | `192.233.24.1` |
| A5 | Juri | 31 | `192.233.34.2` | `255.255.255.192` | `192.233.34.1` |
| A6 | Masayuki | 300 | `192.233.32.2` | `255.255.254.0` | `192.233.32.1` |
| A7 | Akashic | 3 | `192.233.34.66` | `255.255.255.248` | `192.233.34.65` |
| A9 | Omnipresence | 510 | `192.233.28.2` | `255.255.252.0` | `192.233.28.1` |
| A9 | Denpa | 3 | `192.233.30.0` | `255.255.252.0` | `192.233.28.1` |
| A11 | Alice | 208 | `192.233.16.2` | `255.255.255.0` | `192.233.16.1` |
| A11 | Reika | 45 | `192.233.16.210` | `255.255.255.0` | `192.233.16.1` |
| A12 | Taro | 57 | `192.233.18.2` | `255.255.255.192` | `192.233.18.1` |
| A13 | Yasuo | 120 | `192.233.17.2` | `255.255.255.0` | `192.233.17.1` |
| A13 | Miho | 18 | `192.233.17.122` | `255.255.255.0` | `192.233.17.1` |
| A13 | Kuma | 4 | `192.233.17.140` | `255.255.255.0` | `192.233.17.1` |
| A15 | Collective | 260 | `192.233.0.2` | `255.255.254.0` | `192.233.0.1` |
| A15 | Ghost | 6 | `192.233.1.6` | `255.255.254.0` | `192.233.0.1` |
| A17 | Lilith | 77 | `192.233.2.2` | `255.255.255.128` | `192.233.2.1` |
| A17 | Specter | 21 | `192.233.2.79` | `255.255.255.128` | `192.233.2.1` |
| A19 | Chisa | 23 | `192.233.2.194` | `255.255.255.192` | `192.233.2.193` |
| A19 | Hodgeson | 9 | `192.233.2.217` | `255.255.255.192` | `192.233.2.193` |
| A21 | Eiri | 2 | `192.233.3.34` | `255.255.255.248` | `192.233.3.33` |
| A23 | Semi | 14 | `192.233.3.2` | `255.255.255.224` | `192.233.3.1` |
| A25 | Lain | 57 | `192.233.2.130` | `255.255.255.192` | `192.233.2.129` |
| A25 | Mika | 4 | `192.233.2.187` | `255.255.255.192` | `192.233.2.129` |

---

### B. Konfigurasi Script `/etc/network/interfaces` Router & Node GNS3

Konfigurasi berikut diterapkan pada file `/etc/network/interfaces` di setiap node GNS3:

```bash
# ==================================================
# Router Configuration GNS3 (Linux /etc/network/interfaces)
# ==================================================

# Router Cyberia (Gateway Utama NAT)
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

```

---

## 7. Pengujian Konektivitas CIDR (GNS3 Linux CLI)

```bash
# Testing Ping dari Client JJ (192.233.56.2 - Subnet A1 Pusat) ke seluruh cabang wilayah:
ping -c 3 192.233.24.2      # ke Karl (Subnet A4 - Sayap Kiri)
ping -c 3 192.233.32.2      # ke Masayuki (Subnet A6 - Sayap Kiri)
ping -c 3 192.233.28.2      # ke Omnipresence (Subnet A9 - Sayap Kiri)
ping -c 3 192.233.16.2      # ke Alice (Subnet A11 - Sayap Kanan)
ping -c 3 192.233.17.140    # ke Kuma (Subnet A13 - Sayap Kanan)
ping -c 3 192.233.0.2       # ke Collective (Subnet A15 - Sayap Bawah)
ping -c 3 192.233.2.2       # ke Lilith (Subnet A17 - Sayap Bawah)
ping -c 3 192.233.2.194     # ke Chisa (Subnet A19 - Sayap Bawah)
ping -c 3 192.233.3.34      # ke Eiri (Subnet A21 - Sayap Bawah)
ping -c 3 192.233.3.2       # ke Semi (Subnet A23 - Sayap Bawah)
ping -c 3 192.233.2.130     # ke Lain (Subnet A25 - Sayap Bawah)

# Testing Internet Connection via NAT Router Cyberia (eth0 DHCP):
ping -c 3 8.8.8.8

# Traceroute dari JJ ke client paling bawah (Lain):
traceroute 192.233.2.130

```