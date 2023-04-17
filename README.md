# termux-systemctl
make systemctl3.py available in termux 

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
