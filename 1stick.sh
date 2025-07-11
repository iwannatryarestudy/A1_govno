#!/data/data/com.termux/files/usr/bin/sh
read -p "Введите 2 последних октета " var1;
adb connect 192.168.$var1:5555 & sleep 5;
adb shell settings put global animator_duration_scale 0.0 && adb shell settings put global window_animation_scale 0.0 && adb shell settings put global transition_animation_scale 0.0 && echo "animation off";
voka2="com.spbtv.velcom";
VOka="TvVoka-api21-prod-leanback-app-default-release-v22064.apk"
versn2=22064
versn1=$(adb shell dumpsys package com.spbtv.velcom | grep versionCode | awk -F "=" '{print $2}' | awk '{print $1}')

if [ -z "$versn1" ] || [ "$versn1" -lt "$versn2" ]; then
    echo "Installing or updating VOKA..."
    adb install -r "$VOka" && echo "reinstall"
else
    echo "Skip: VOKA $versn2 or later is already installed"
fi

for var2 in $(cat disable_list_packages_4pda.for1080p_stick.txt)
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
