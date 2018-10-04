#!/bin/bash
. /var/www/html/openWB/openwb.conf


answer=$(curl --connect-timeout 5 -s $bezugjsonurl)
evuwatt=$(echo $answer | jq -r $bezugjsonwatt | sed 's/\..*$//')
echo $evuwatt
echo $evuwatt > /var/www/html/openWB/ramdisk/bezugwatt
evuikwh=$(echo $answer | jq -r $bezugjsonkwh)
echo $evuikwh > /var/www/html/openWB/ramdisk/bezugkwh
evuekwh=$(echo $answer | jq -r $einspeisungjsonkwh)
echo $evuekwh > /var/www/html/openWB/ramdisk/einspeisungkwh

