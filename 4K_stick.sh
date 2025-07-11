#!/data/data/com.termux/files/usr/bin/sh
read -p "Введите 2 последних октета " var1;
adb connect 192.168.$var1:5555 & sleep 5;
adb shell settings put global animator_duration_scale 0.0 && adb shell settings put global window_animation_scale 0.0 && adb shell settings put global transition_animation_scale 0.0 && echo "animation off";
voka2="com.spbtv.velcom";
voka1="$(adb shell dumpsys package com.spbtv.velcom |grep "Unable to find package"|awk 'NR == 1{print$5}')";
VOka="TvVoka-api21-prod-leanback-app-default-release-v22234.apk"
#echo $voka1;
if [ "$voka1" = "$voka2" ]
then
adb install $VOka && echo "install";
else
echo "VOKA installed"
#echo $voka2
fi
#adb shell cmd appops set com.spbtv.velcom RUN_IN_BACKGROUND ignore;
versn2=22234
versn1="$(adb shell dumpsys package com.spbtv.velcom | grep versionCode |awk -F "=" '{print $2}'|awk  '{print $1}')";
#echo    $versn1;
if [ "$versn1" -lt "$versn2" ]
then
#adb shell pm uninstall -k --user 0 com.spbtv.velcom && echo "del";
adb install -r $VOka && echo "reinstall";
else
echo "skip voka $versn2 or latest installed"
fi
#adb shell pm list packages -f |awk -F "==" '{print $2}'|awk -F_ '$1{print $1}'|awk -F "=" '{print $2}' > new_stick_packet.txt;
#adb shell pm list packages -f |awk -F "=" '{print $2}'|awk -F_ '$1{print $1}' >> new_stick_packet.txt;
#sort -u new_stick_final_packet.txt > Temp && cat Temp > new_stick_final_packet.txt;
#sort -u new_stick_packet.txt > Temp && cat Temp > new_stick_packet.txt;
#comm -13  new_stick_final_packet.txt new_stick_packet.txt    > new_stick_packet_remove.txt;

for var2 in $(cat disable_list_packages_4pda.for4K_stick.txt)
do
adb shell pm disable-user --user 0 $var2;
done
if [ $? -eq 0 ]
then
echo Done
else
echo Fail
fi
adb disconnect 1>/dev/null;

