#!/bin/bash
NC='\e[0m'
clear
[[ ! -f /usr/bin/git ]] && apt install git -y &> /dev/null
# COLOR VALIDATION
clear
RED='\033[0;31m'
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\033[1;95m"
YELL='\033[1;33m'
BGX="\033[42m"
END='\e[0m'
TOKEN="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"
REPO="https://github.com/AndyyudaVPN/permission.git"
EMAIL="bhiantodngenuh@gmail.com"
USER="AndyyudaVPN"


add-ip() {
TIMES="1"
CHATID="5736569839"
KEY="6308495632:AAHGfefT3Am0e3LuidHf77EJJpYI5ig1F9I"
URL="https://api.telegram.org/bot$KEY/sendMessage"


    today=`date -d "0 days" +"%Y-%m-%d"`
    git clone ${REPO} /root/ipvps/ &> /dev/null
    clear
    echo -e ""
    echo -e ""
    read -p "  Input IP Address : " ip
    CLIENT_EXISTS=$(grep -w $ip /root/ipvps/ip | wc -l)
    if [[ ${CLIENT_EXISTS} == '1' ]]; then
    echo "IP Already Exist !"
    exit 0
    fi
    echo -e ""
    read -p "  Input Username IP (Example : reyz) : " name
    echo -e ""
    clear
    echo -e ""
    echo -e ""
    echo "  How Much Days Do You Want ?"
    echo "  [1] 30 Days"
    echo "  [2] 60 Days"
    echo "  [3] 90 Days"
    echo "  [4] Lifetime"
    echo "  [5] Custom Expiration Date"
    echo -e ""
    read -p "  Input Menu Number : " exp
    
    if [[ ${exp} == '1' ]]; then
    exp2=`date -d "30 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    elif [[ ${exp} == '2' ]]; then
    exp2=`date -d "60 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    elif [[ ${exp} == '3' ]]; then
    exp2=`date -d "90 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    elif [[ ${exp} == '4' ]]; then
    exp2="Lifetime"
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    elif [[ ${exp} == '5' ]]; then
    read -p "Input Expired Days : " exp11
    exp2=`date -d "$exp11 days" +"%Y-%m-%d"`
    echo "### ${name} ${exp2} ${ip}" >> /root/ipvps/ip
    fi
    cd /root/ipvps
    git config --global user.email "${EMAIL}" &> /dev/null
    git config --global user.name "${USER}" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/AndyyudaVPN/permission
    git push -f https://${TOKEN}@github.com/AndyyudaVPN/permission.git &> /dev/null
    rm -rf /root/ipvps
    clear
    sleep 1
    echo "  Registering IP Address..."
    sleep 1
    echo "  Processing..."
    sleep 1
    echo "  Done!"
    sleep 1
    clear
TEXT="
<code>───────────────────────────</code>
<code>    SUCCES  REGISTERED IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ip</code>
<code>Registered On  : $today</code>
<code>Expired On     : $exp2</code>
<code>───────────────────────────</code>
"
  echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "               \e[1;97mSuccesfully Add IP Address${NC}"
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    echo -e ""
    echo -e "  ${YELL}Username${NC}      : $name"
    echo -e "  ${YELL}IP Address${NC}    : $ip"
    echo -e "  ${YELL}Registered On${NC} : $today"
    echo -e "  ${YELL}Expired On${NC}    : $exp2"
    echo ""
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    read -n 1 -s -r -p "  Press any key to back on menu"
    addip
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

del-ip() {
TIMES="1"
CHATID="5736569839"
KEY="6308495632:AAHGfefT3Am0e3LuidHf77EJJpYI5ig1F9I"
URL="https://api.telegram.org/bot$KEY/sendMessage"

    rm -rf /root/ipvps
    git clone ${REPO} /root/ipvps/ &> /dev/null
    clear
    echo ""
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "          \e[1;97mList IP Address Have Been Registered${NC}"
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    grep -E "^###"    "/root/ipvps/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    grep -E "^#&"    "/root/ipvps/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    echo ""
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    read -p "   Input IP Address To Delete : " ipdel
    name=$(cat /root/ipvps/ip | grep $ipdel | awk '{print $2}')
    exp=$(cat /root/ipvps/ip | grep $ipdel | awk '{print $3}')
    if [[ ${exp} == 'Lifetime' ]]; then
    sed -i "/^#&   $name   $exp $ipdel/,/^},{/d" /root/ipvps/ip
    else
    sed -i "/^### $name $exp $ipdel/,/^},{/d" /root/ipvps/ip
    fi
    cd /root/ipvps
    git config --global user.email "${EMAIL}" &> /dev/null
    git config --global user.name "${USER}" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/AndyyudaVPN/permission
    git push -f https://${TOKEN}@github.com/AndyyudaVPN/permission.git &> /dev/null
    rm -rf /root/ipvps
    clear
    sleep 1
    echo "  Delete IP Address..."
    sleep 1
    echo "  Processing..."
    sleep 1
    echo "  Done!"
    sleep 1
    clear
TEXT1="
<code>───────────────────────────</code>
<code>    SUCCES DELETE  IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ipdel</code>
<code>Expired On     : $exp</code>
<code>───────────────────────────</code>
"
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "          \e[1;97mSuccesfully Deleted The IP Address${NC}"
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "  ${YELL}Username${NC}   : $name"
    echo -e "  ${YELL}IP Address${NC} : $ipdel"
    echo -e "  ${YELL}Expired On${NC} : $exp"
    echo ""
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    read -n 1 -s -r -p "  Press any key to back on menu"
    addip
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT1&parse_mode=html" $URL >/dev/null
}

renew-ip() {
TIMES="1"
CHATID="5736569839"
KEY="6308495632:AAHGfefT3Am0e3LuidHf77EJJpYI5ig1F9I"
URL="https://api.telegram.org/bot$KEY/sendMessage"

    rm -rf /root/ipvps
    git clone ${REPO} /root/ipvps/ &> /dev/null
    clear
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "          \e[1;97mList IP Address Have Been Registered${NC}"
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    grep -E "^###" "/root/ipvps/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    echo ""
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -p "  Input IP Address To Renew : " ipdel
    read -p "  Input Days  : " days
    name=$(cat /root/ipvps/ip | grep $ipdel | awk '{print $2}')
    exp=$(cat /root/ipvps/ip | grep $ipdel | awk '{print $3}')
    now=$(date +%Y-%m-%d)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(( (d1 - d2) / 86400 ))
    exp3=$(($exp2 + $days))
    exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
    sed -i "s/### $name $exp $ipdel/### $name $exp4 $ipdel/g" /root/ipvps/ip
    cd /root/ipvps
    git config --global user.email "${EMAIL}" &> /dev/null
    git config --global user.name "${USER}" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/AndyyudaVPN/permission
    git push -f https://${TOKEN}@github.com/AndyyudaVPN/permission.git &> /dev/null
    rm -rf /root/ipvps
    clear
    sleep 1
    echo "  Renew IP Address..."
    sleep 1
    echo "  Processing..."
    sleep 1
    echo "  Done!"
    sleep 1
    clear
TEXT2="
<code>───────────────────────────</code>
<code>    SUCCES RENEW  IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ipdel</code>
<code>Expired On     : $exp4</code>
<code>───────────────────────────</code>
"
    echo ""
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "          \e[1;97mSuccesfully Renew The IP Address${NC}"
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

   echo ""
    echo -e "  ${YELL}Username${NC}   : $name"
    echo -e "  ${YELL}IP Address${NC} : $ipdel"
    echo -e "  ${YELL}Expired On${NC} : $exp4"
    echo ""    
    echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"


    read -n 1 -s -r -p "Press any key to back on menu"
    addip
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT2&parse_mode=html" $URL >/dev/null
}

clear

echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "               \e[1;97m[ REGISTER IP MENU ]${NC}"
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "  ${grenbo}[1]$NC  ${YELL}Add IP VPS"$NC     
echo -e "  ${grenbo}[2]$NC  ${YELL}Delete IP VPS"$NC
echo -e "  ${grenbo}[3]$NC  ${YELL}Renew IP VPS"$NC
echo -e ""
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -p "  Please Input Menu Number : " menu
case $menu in
1 | 01)
clear
add-ip
;;
2 | 02)
clear
del-ip
;;
3 | 03)
clear
renew-ip
;;
*)
echo "Please Input An Correct Menu !"
sleep 1
addip
;;
esac
