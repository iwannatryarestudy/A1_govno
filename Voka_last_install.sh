#!/data/data/com.termux/files/usr/bin/sh
read -p "Введите 2 последних октета " var1;
adb connect 192.168.$var1:5555 & sleep 5;
VOka="Voka-prod-androidTv-app-default-release-21984.apk"
#echo $voka1;
adb install $VOka && echo "install";

