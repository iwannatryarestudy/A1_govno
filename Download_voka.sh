#!/data/data/com.termux/files/usr/bin/sh
wget https://voka.tv/apps/TvVoka-api21-prod-leanback-app-default-release-v22064.apk;
find . -maxdepth 1 -mindepth 1 -type f -name "*apk.*" ! -name "TvVoka-21805.apk" -exec rm -f {} \;

