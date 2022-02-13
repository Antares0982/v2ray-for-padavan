#!/bin/bash
#echo "Load modprobe"
modprobe ip_set_hash_net
modprobe xt_set

cd /media/AIDISK/xray
bash stop.sh

#echo "[cleanning iptables]"
iptables -t nat -D PREROUTING V2RAY  >/dev/null 2>&1
iptables -t nat -D OUTPUT V2RAY  >/dev/null 2>&1
/bin/iptables -t nat -F V2RAY >/dev/null 2>&1
/bin/iptables -t nat -X V2RAY >/dev/null 2>&1
/sbin/ipset destroy chnroute >/dev/null 2>&1
#echo "ipset chnroute"
#ipset -exist create chnroute hash:net hashsize 64
#sed -e "s/^/add chnroute /" /media/AIDISK/xray/chnroute.txt | ipset restore
echo ""
echo ""
echo "[setting iptables]"
iptables -t nat -N V2RAY
iptables -t nat -A V2RAY -d 0.0.0.0 -j RETURN
iptables -t nat -A V2RAY -d 127.0.0.1 -j RETURN
iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN


# iptables -t nat -A V2RAY -m set --match-set chnroute dst -j RETURN

# Anything else should be redirected to Dokodemo-door's local port

# iptables -t nat -A V2RAY -p tcp --dport 22:500 -j REDIRECT --to-ports 1234
# iptables -t nat -A V2RAY -p tcp --dport 22 -j REDIRECT --to-ports 1234
iptables -t nat -A V2RAY -p tcp --dport 53 -j REDIRECT --to-ports 1234
iptables -t nat -A V2RAY -p tcp --dport 80 -j REDIRECT --to-ports 1234
iptables -t nat -A V2RAY -p tcp --dport 443 -j REDIRECT --to-ports 1234
iptables -t nat -A V2RAY -p tcp --dport 10000:65535 -j REDIRECT --to-ports 1234
# iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-ports 1234

iptables -t nat -A PREROUTING -p tcp -j V2RAY


echo "-----------------[V2Ray started]---------------------------"
echo ""
echo ""
echo "#stop xray"
echo "sh /media/AIDISK/xray/stop.sh"
echo ""
echo "#Default config.json use GFW Mode"
echo ""
echo "[media/AIDISK/xray/example-config]"
echo ""
echo "#Autoruns:"
echo "'Scripts' - 'Run After Firewall Rules Restarted'"
echo "sleep 10"
echo "sh /media/AIDISK/xray/start.sh"
echo ""
echo "USE 5353 DNS FOR GFWLIST:"
echo "Custom 'dnsmasq.conf'"
echo "conf-dir=/media/AIDISK/xray/dnsmasq-gwlist/, *.hosts"
echo ""
echo "-------------you can close this Window---------------------"
echo ""
echo ""

cd /media/AIDISK/xray

SSL_CERT_FILE=./cacert.pem ./xray --config=/media/AIDISK/xray/config.json >/dev/null 2>&1 &
echo "[V2ray start]"
#./xray-watchdog >/dev/null 2>&1 &
#echo "[xray-watchdog started]."
