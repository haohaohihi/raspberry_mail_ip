#!/bin/bash

#check network availability
while true
do
TIMEOUT=5
SITE_TO_CHECK="www.bupt.edu.cn"	  #check site in school without logging
RET_CODE=`curl -I -s --connect-timeout $TIMEOUT $SITE_TO_CHECK -w %{http_code} | tail -n1`

echo $RET_CODE

if [ "x$RET_CODE"=="x200" ];then
echo "connect success"
break
else
echo " connot connect network"
sleep 2s
fi
done

# get the IP address
ETH0_IP_ADDR=`ifconfig eth0 | sed -n "2,2p" | awk '{print $2}'`
WLAN0_IP_ADDR=`ifconfig wlan0 | sed -n "2,2p" | awk '{print $2}'`
echo $ETH0_IP_ADDR
# send mail
time=`date`
/usr/sbin/sendmail -t << EOF
From:my_raspberry
Sender:pi
To:haohaohihi_2013@bupt.edu.cn
Subject:raspberry latest ip
-------------------------------------
wireless ip is: $WLAN0_IP_ADDR
ethernet ip is: $ETH0_IP_ADDR
-------------------------------------
EOF
 

