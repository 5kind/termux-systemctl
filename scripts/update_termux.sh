out_systemctl_termux_py(){
sed -e 's%/usr%/data/data/com.termux/files/usr%g' \
-e 's%"/etc%"/data/data/com.termux/files/usr/etc%g' \
-e 's%"/tmp%"/data/data/com.termux/files/usr/tmp%g' \
-e 's%"/var%"/data/data/com.termux/files/usr/var%g' \
-e 's%"/run%"/data/data/com.termux/files/usr/var/run%g' \
-e 's%"/lib%"/system/lib%g' \
${1:-"systemctl3.py"}
}

out_systemctl_termux_py $1
