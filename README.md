# termux-systemctl
make systemctl3.py available in termux
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
journalctl)
init|*.sh)
reboot)
halt)
*)systemctl
* service applet:
Usage: service {start|stop|restart|status}
