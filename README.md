# OpenWrt-R4S-glibc
This repo is used to cross compile OpenWrt for NanoPi-R4S. 
The official default is to use musl-libc.
However, the difference is that the standard C library we use is glibc, instead of musl-libc. 

# How to use

You can use the [release version](https://github.com/SunBK201/OpenWrt-R4S-glibc/releases) directly, 

or compile it yourself: 

```bash
bash compile.sh
```

In `make menuconfig`, I suggest you check the options below:

```
Target System
	--> Rockchip

Subtarget
	--> RK33xx boards (64 bit)

Target Profile
	--> FriendlyARM NanoPi R4S

Target Images
	--> (1008) Root filesystem partition size (in MiB)

Global build settings 
--> Compile with full language support
		--> Preferred standard C++ library 
				--> libstdc++

Adcanced configuration options(for devlopers)
		--> Toolchain Options
			 --> C Libary implementation
					 --> Use glibc

Base system 
		--> Customize busybox options 
				--> Coreutils
						--> date (all options)
						--> printenv
				--> Linux System Utilities 
						--> fdisk
				--> Networking Utilities 
						--> arp
						--> arping
						--> netcat
						--> wget
				--> dnsmasq-full (cancel the above 'dnsmasq' option)

Development 
		--> gcc
				--> Libraries  
						--> Include static libc on target
						--> Include static libptread on target
						--> Include static libstdc++ on target
		--> gdb
		--> gdbserver
		--> make

Kernel modules
		--> Wireless Drivers
				--> kmod-mt76x2u

Languages
		--> Go
				--> golang
		--> Node.js
				--> node
				--> node-npm
		--> Python
				--> python3
				--> python3-pip
				--> python3-requests

LuCI
		--> 1. Collections
				--> luci
		--> 2. Modules
				--> Translations
						--> Chinese Simplified (zh_Hans)
		--> luci-compat
		--> 3. Applications
				--> luci-app-ddns
				--> luci-app-frpc
				--> luci-app-frps
				--> luci-app-openclash
				--> luci-app-statistics
				--> luci-app-ttyd
				--> luci-app-upnp
				--> luci-app-wol
		--> 4. Themes
				--> luci-theme-argon

Network
		--> File Transfer
				--> curl
		--> NMAP Suite
				--> nmap-full
		--> SSH
				--> openssh-client
				--> openssh-client-utils
				--> openssh-server
				--> openssh-sftp-client
				--> openssh-sftp-server
		--> Version Control Systems
				--> git
				--> git-http
		--> WirelessAPD
				--> hostapd
		--> iperf3
		--> ipset
		--> tcpdump

Utilities
		--> Editors
				--> vim-full
		--> Shells
				--> bash
		--> Terminal
				--> screen
		--> Zoneinfo
				--> zoneinfo-all
		--> collectd
				--> collectd-mod-cpufreq
		--> coremark
		--> file
		--> grep
		--> ldd
		--> openssl-util
		--> tar
		--> tree
		--> whereis
		--> which
```

# Notice
`opkg install` is not available for us, since we are using glibc.



