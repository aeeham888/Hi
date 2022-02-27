MOSTAFA="com.tencent.ig"

DUMP() {

  pm dump $1 | grep $2 | tr ' ' '\n' | grep $1 | sed s/$2// | tr -d '\n';

};

lib=`ls -mR $(DUMP $MOSTAFA legacyNativeLibraryDir=) | grep : | tr -d : | grep /arm | grep -v dora`

pm disable $MOSTAFA/com.tencent.midas.oversea.newnetwork.service.APNetDetectService

rm -rf $lib/{libzip.so,libst-engine.so,liblbs.so,libigshare.so,libhelpshiftlistener.so,libgcloudarch.so,libgamemaster.so,libBugly.so} &> /dev/null

su -c am start -n $MOSTAFA/com.epicgames.ue4.SplashActivity;

sleep 10

chmod 000 $lib/libUE4.so

chmod 000 $lib/libgcloud.so

data=/data/data/$MOSTAFA

sleep 30

iptables -A INPUT  -p all -m string --hex-string '|6368656174|' --algo bm -j DROP

iptables -A OUTPUT  -p all -m string --hex-string '|6368656174|' --algo bm -j DROP

iptables -A INPUT -p tcp --dport 17500 -s mgl.lobby.igamecj.com -j ACCEPT

iptables -A INPUT -p tcp --dport 17500 -j DROP

iptables -A INPUT -p tcp --dport 17000 -j DROP

iptables -A OUTPUT -p tcp --dport 17000 -j DROP

iptables -A INPUT -p icmp -j DROP

iptables -A OUTPUT -p icmp -j DROP
