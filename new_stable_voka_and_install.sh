#!/data/data/com.termux/files/usr/bin/bash

read -p "Введите 2 последних октета (NN.MM): " var1
if ! [[ "$var1" =~ ^[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  echo "Ошибка: формат должен быть NN.MM" >&2
  exit 1
fi

IP="192.168.$var1:5555"
VOka="TvVoka-api21-prod-leanback-app-default-release-v22234.apk"

echo "Подключаемся к $IP..."
adb connect "$IP"
sleep 5

echo "Запускаем Play Store для авторизации…"
adb shell am start -n com.android.vending/com.google.android.finsky.activities.MainActivity
sleep 5

echo "Удаляем com.spbtv.velcom (user 0)…"
if adb shell pm uninstall --user 0 com.spbtv.velcom; then
  echo "Пакет удалён"
else
  echo "Не удалось удалить пакет, продолжаем..."
fi
sleep 5

echo "Устанавливаем $VOka…"
if adb install "$VOka"; then
  echo "Установка без понижения версии прошла успешно"
else
  echo "Попытка установки с понижением версии…"
  if adb install -d "$VOka"; then
    echo "Установлена версия с понижением (downgrade)"
  else
    echo "Ошибка установки APK" >&2
    exit 1
  fi
fi

echo "Отключаемся от $IP"
adb disconnect "$IP" >/dev/null
echo "Готово."
