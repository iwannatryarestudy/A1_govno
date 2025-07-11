#!/data/data/com.termux/files/usr/bin/sh
read -p "Введите 2 последних октета " var1;
adb connect 192.168.$var1:5555 & sleep 5;
echo "Включаем обратно приложения"
for var2 in $(cat disable_list_packages_4pda.for1080p_stick.txt)
do
adb shell pm enable $var2
done
if [ $? -eq 0 ]
then
echo Done
else
echo Fail
fi
adb disconnect 1>/dev/null;
