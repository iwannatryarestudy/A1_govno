#!/data/data/com.termux/files/usr/bin/sh
read -p "Введите 2 последних октета " var1;
adb connect 192.168.$var1:5555 & sleep 5;
adb shell pm uninstall -k --user 0 com.spbtv.velcom && echo "del";
adb install -d TvVoka-21805.apk && echo "Done";
adb disconnect 1>/dev/null;
