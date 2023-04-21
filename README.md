# termux-systemctl
make [systemctl3.py](https://github.com/gdraheim/docker-systemctl-replacement) available in [termux](https://github.com/termux/termux-app)  

# Requirements
## necessary
* Python3
## optional
* sudo（in proot/chroot Linux）

# file  
.  
├── bin -> local/bin  
├── etc  
│   ├── profile.d  
│   │   └── systemctl-init.sh -> ../../local/bin/systemctl  
│   └── systemd  
│       └── system  
├── lib  
│   └── systemd  
│       ├── system  
│       │   └── systemd-init.service -> ../systemctl3.py/local.service  
│       └── systemctl3.py  
│           ├── local.service  
│           ├── nginx.service  
│           ├── sshd.service  
│           ├── usr-bin.service  
│           └── your_sv.service  
├── local  
│   └── bin  
│       ├── journalctl -> systemctl  
│       ├── journalctl3.py  
│       ├── systemctl  
│       └── systemctl3.py  
└── var  
    └── log  
        ├── journal  
        │   └── sshd.service.log -> ../sv/sshd/current  
        └── sv  
            └── sshd  
                └── current  

# content
* systemctl applet:  
journalctl) journalctl  
init|*.sh)  systemctl init  
reboot)     systemctl halt  
halt)       init&&halt  
*)          systemctl  

# How to use
## necessary
* install script files in [./local/bin](local/bin) to your $PATH
* enjoy
## optional
* mklink ${PREFIX}/etc/profile.d/systemctl-init.sh -> \$(which systemctl) to run systemctl init when login
* mklink ${PREFIX}/var/log/journal/${service}.service.log -> ../sv/${service}/current to see current ${service} log file

# Known problems
`systemctl status` can't show current status

