# termux-systemctl
make [systemctl3.py]（https://github.com/gdraheim/docker-systemctl-replacement） available in [termux]（https://github.com/termux/termux-app） 

# Requirements
## necessary
* Python3
## 
* sudo（in proot/chroot Linux）
* start-stop-daemon（dpkg）

* file  
.  
├── bin  
│   ├── halt -> systemctl  
│   ├── init -> systemctl  
│   ├── journalctl -> systemctl  
│   ├── journalctl3.py  
│   ├── reboot -> systemctl  
│   ├── systemctl  
│   └── systemctl3.py  
├── etc  
│   ├── profile.d  
│   │   └── systemctl.sh -> ../../bin/systemctl  
│   └── systemd  
└── lib  
    └── systemd  
        └── service  

* systemctl applet:  
journalctl) journalctl  
init|*.sh) service start  
reboot) service restart  
halt) service stop  
*)systemctl  

* service applet:  
Usage: service {start|stop|restart|status}  

# todo
* make service better
* ~write a all_in_one systemd script~
