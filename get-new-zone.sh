#!/usr/bin/bash
logger "starting download"
wget --no-cache https://raw.githubusercontent.com/Freestyle00/DNS-Zonen-Remotemanager/main/iot4everyone.de.zone -O ./iot4everyone.de.zone
logger "finished download"

if [ "$1" != "--first-run" ]; then
logger "worked";
knotc zone-reload;
logger "reloaded";
fi;
