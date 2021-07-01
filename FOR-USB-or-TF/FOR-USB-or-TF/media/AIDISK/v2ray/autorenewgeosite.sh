#!/bin/bash

curl -k --connect-timeout 5 --retry 3 https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat > /media/AIDISK/v2ray/geosite.dat
curl -k --connect-timeout 5 --retry 3 https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat > /media/AIDISK/v2ray/geoip.dat
cd /media/AIDISK/v2ray && bash start.sh
