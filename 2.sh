#!/data/data/com.termux/files/usr/bin/sh
read -p "Введите 2 последних октета " var1;
adb connect 192.168.$var1:5555 & sleep 5;
adb reboot recovery & sleep 5;
adb disconnect 1>/dev/null;
