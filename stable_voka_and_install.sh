#!/data/data/com.termux/files/usr/bin/sh
read -p "Введите 2 последних октета " var1;
adb connect 192.168.$var1:5555 & sleep 5;
VOka="Voka-prod-androidTv-app-default-release-21984.apk"
adb shell pm uninstall  --user 0 com.spbtv.velcom && echo "del" & sleep 5;
adb install  $VOka && echo "no downgrade" || adb install -d $VOka && echo "install downgrade 21984_version";
adb disconnect 1>/dev/null;
