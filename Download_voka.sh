#!/data/data/com.termux/files/usr/bin/sh
wget https://voka.tv/apps/Voka-prod-androidTv-app-default-release-21984.apk;
wget https://voka.tv/apps/TvVoka-21805.apk;
find . -maxdepth 1 -mindepth 1 -type f -name "*apk.*"    -exec rm -rf {} \;
