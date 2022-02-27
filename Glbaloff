MOSTAFA="com.tencent.ig"

DUMP() {

  pm dump $1 | grep $2 | tr ' ' '\n' | grep $1 | sed s/$2// | tr -d '\n';

};

lib=`ls -mR $(DUMP $MOSTAFA legacyNativeLibraryDir=) | grep : | tr -d : | grep /arm | grep -v dora`

am force-stop $MOSTAFA

pkill $MOSTAFA

su -c iptables --flush

iptables --flush

iptables -F

ip6tables -F

chmod -R 755 $lib/* &> /dev/null

pm install -r /data/app/$MOSTAFA*/base.apk

