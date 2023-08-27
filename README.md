# Termux-Systemctl  (shell)
run [systemctl3.py](https://github.com/gdraheim/docker-systemctl-replacement) in [termux](https://github.com/termux/termux-app)  

# Requirements
* Python3                       (necessary)
* sudo (in proot/chroot Linux)  (optional)

# [Chroot Files](/bin/)
* [start](/bin/start)
Send start commands to the Host etc
* [init](/bin/init)
mount -a && systemctl3.py init
* [journalctl](/bin/journalctl)
journalctl3.py Python File
* [systemctl](/bin/systemctl)
sudo systemctl3.py $@
* [systemctl3.py](/bin/systemctl3.py)
[docker-systemctl-replacement](https://github.com/gdraheim/docker-systemctl-replacement)

# [Termux Files](/termux/)
See file under [termux](/termux/) for details.