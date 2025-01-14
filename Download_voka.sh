#!/data/data/com.termux/files/usr/bin/sh
wget https://voka.tv/apps/TvVoka-api21-prod-leanback-app-default-release-v22064.apk;
wget https://voka.tv/apps/TvVoka-21805.apk;
find . -maxdepth 1 -mindepth 1 -type f -name "*apk.*"    -exec rm -rf {} \;
