#!/usr/bin/bash

wget  https://raw.githubusercontent.com/Freestyle00/DNS-Zonen-Remotemanager/main/iot4everyone.de.zone -O ./iot4everyone.de.zone

if [ "$1" != "--first-run" ]; then
knotc zone-reload
fi;
