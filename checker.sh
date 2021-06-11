command -v curl > /dev/null 2>&1 || { echo >&2 -e "\e[1;32m[*]\e[1;39m Instalando Curl..."; pkg install curl -y;}

trap ctrl_c INT
function ctrl_c() {
tput civis
printf "\n\n\033[1;31mExiting..."
sleep 0.5
printf "\n\n\033[1;32mGood bye :)"
exit
}

bin(){
echo "press ctrl + c to exit"
while read -p $'\e[1;32m[ bin ] \e[1;34mEnter to bin --> \e[1;0m' bin && [ -z $bin ]; do
echo -e  '\e[1;31m\nInvalid bin :( \n\n'
sleep 0.8
done
printf '\n\e[1;32m[ checking ] \e[1;34mPlease wait...\n\n\e[1;0m'
sleep 0.5
if [ $bin ];then
curl -H "Accept-Version: 3" "https://lookup.binlist.net/$bin"
fi
}

bin
ctrl_c
