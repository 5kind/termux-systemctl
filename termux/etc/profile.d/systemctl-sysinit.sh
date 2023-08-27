#!/data/data/com.termux/files/usr/bin/sh

set -e
start(){
    mkdir -p $PIDDIR
    start-stop-daemon -S -b -m -p $PIDFILE -x $DAEMON -d $PREFIX -- $DAEMON_OPTS
}
stop(){
    start-stop-daemon -K -s 1 -o -p $PIDFILE
    rm -f $PIDFILE
}
# Must be a valid filename
NAME=systemctl-sysinit
PIDDIR=$PREFIX/var/run
PIDFILE=$PIDDIR/$NAME.pid
#This is the command to be run, give the full pathname
DAEMON=$PREFIX/bin/systemctl3.py
DAEMON_OPTS="init"

case "$1" in
    "")
        start
        ;;
    start)
        echo -n "Starting daemon: "$NAME
        start
        echo "."
        ;;
    stop)
        echo -n "Stopping daemon: "$NAME
        stop
        echo "."
        ;;
    restart)
        echo -n "Restarting daemon: "$NAME
        stop
        start
        echo "."
        ;;

    *)
        echo "Usage: "$1" {start|stop|restart}"
        exit 1
esac

exit 0
