#!/usr/bin/bash

wget  https://raw.githubusercontent.com/Freestyle00/DNS-Zonen-Remotemanager/main/iot4everyone.de.zone -O ./iot4everyone.de.zone

knotc zone-reload
