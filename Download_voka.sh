#!/data/data/com.termux/files/usr/bin/sh

URL="https://voka.tv/apps/TvVoka-api21-prod-leanback-app-default-release-v22234.apk"
FILENAME="${URL##*/}"

# Получаем чисто число версии
VERSION="${FILENAME#*-v}"   # «22234.apk»
VERSION="${VERSION%.apk}"   # «22234»

wget "$URL"
echo "Скачано как: $FILENAME"
echo "Версия: $VERSION"

# Замена во всех целевых файлах
sed -i \
  -e "s|^VOka=.*|VOka=\"${FILENAME}\"|" \
  -e "s|^versn2=.*|versn2=${VERSION}|" \
  1stick.sh 4K_stick.sh

find . -maxdepth 1 -mindepth 1 -type f -name "*apk.*" ! -name "TvVoka-21805.apk" ! -name "TvVoka-api21-prod-leanback-app-default-release-v22064.apk" -exec rm -f {} \;

