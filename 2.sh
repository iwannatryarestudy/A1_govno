#!/data/data/com.termux/files/usr/bin/sh
read -p "Введите 3 последних цифры ip " var1;
adb connect 192.168.0.$var1:5555 & sleep 5;
adb reboot recovery & sleep 5;
adb kill-server;
