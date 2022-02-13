#!/bin/bash
iptables -t nat -D PREROUTING V2RAY  >/dev/null 2>&1
iptables -t nat -D OUTPUT V2RAY  >/dev/null 2>&1
/bin/iptables -t nat -F V2RAY >/dev/null 2>&1
/bin/iptables -t nat -X V2RAY >/dev/null 2>&1
/sbin/ipset destroy chnroute >/dev/null 2>&1

kill -9 "`pidof xray-watchdog`"

pid=$(ps | awk '/[x]ray --config/{print $1}')

if [ "$pid" == "" ]; then
    echo "[xray not running]"
else
    echo "[xray stop]"
    kill $pid
fi