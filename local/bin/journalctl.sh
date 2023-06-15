#!/bin/sh

SYSTEMCTL_PY="systemctl3.py"
SYSTEMCTL="$(dirname $(readlink -f ${0}))/${SYSTEMCTL_PY}"

usage() {
    cat <<EOF
usage: ${0##*/} [-h] -u unit [-f] [-n num] [--no-pager] [--system] [--user] [--root path] [-x]
EOF
    [[ "$1" == "verbose" ]] && 
    cat <<EOF

options:
  -h, --help            show this help message and exit
  -u unit, --unit unit  Systemd unit to display
  -f, --follow          Follows the log
  -n num, --lines num   Num of lines to display
  --no-pager            Do not pipe through a pager
  --system              Show system units
  --user                Show user units
  --root path           Use subdirectory path
  -x                    Switch on verbose mode
EOF
}

systemctl_log() {
    local UNIT
    local FOLLOW=false
    local LINES
    local NO_PAGER=false
    local SYSTEM=false
    local USER=false
    local ROOT
    local VERBOSE=false

    while [ $# -gt 0 ]; do
        case $1 in
            -h|--help)
                usage verbose
                return ;;
            -u|--unit) UNIT="$2"; shift ;;
            -f|--follow) FOLLOW=true ;;
            -n|--lines) LINES="$2"; shift ;;
            --no-pager) NO_PAGER=true ;;
            --system) SYSTEM=true ;;
            --user) USER=true ;;
            --root) ROOT="$2"; shift ;;
            -x) VERBOSE=true ;;
            *) echo "Unknown argument: $1" >&2; usage ; return 1 ;;
        esac
        shift
    done

    if [ -z "$UNIT" ]; then
        usage
        echo "${0##*/}: error: the following arguments are required: -u/--unit" >&2
        return 1
    fi

    CMD="$SYSTEMCTL log $UNIT"
    if [ "$FOLLOW" = "true" ]; then CMD="$CMD -f"; fi
    if [ -n "$LINES" ]; then CMD="$CMD -n $LINES"; fi
    if [ "$NO_PAGER" = "true" ]; then CMD="$CMD --no-pager"; fi
    if [ "$SYSTEM" = "true" ]; then CMD="$CMD --system"; fi
    if [ "$USER" = "true" ]; then CMD="$CMD --user"; fi
    if [ -n "$ROOT" ]; then CMD="$CMD --root $ROOT"; fi
    if [ "$VERBOSE" = "true" ]; then CMD="$CMD -vvv"; fi

    exec $CMD
}

journalctl(){
  command=systemctl_log
  [ ! -x /usr/bin/python3 ] && command="termux-chroot ${0}"
  $command ${@}
}

journalctl ${@}
