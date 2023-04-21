# termux-systemctl
make [systemctl3.py](https://github.com/gdraheim/docker-systemctl-replacement) available in [termux](https://github.com/termux/termux-app)  

# Requirements
* Python3                       (necessary)
* sudo (in proot/chroot Linux)  (optional)

# systemctl applet:  
journalctl) journalctl  
init|*.sh)  systemctl init  
reboot)     systemctl halt  
halt)       init&&halt  
*)          systemctl  

# How to use
## necessary
* install script files in [./local/bin](local/bin) to your $PATH
## optional
* use [systemd-init.service](lib/systemd/systemctl3.py/local.service) to run systemctl init in background
* mklink `${PREFIX}/etc/profile.d/systemctl-init.sh` -> `$(which systemctl)` to run `systemctl start systemd-init` when login
* mklink `${PREFIX}/var/log/journal/${service}.service.log` -> `../sv/${service}/current` to use `journalctl -u ${service} -f`

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

# Known problems
`systemctl status` can't show current status

