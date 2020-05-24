FROM ubuntu:18.04

RUN dpkg --add-architecture i386 && apt-get update && \
    apt-get install gcc g++ clang lib32gcc1 \
    lib32z1 lib32z1-dev libc6-dev-i386 libc6-i386 \
    gcc-multilib g++-multilib wget -y

RUN useradd csserver && \
    mkdir /home/csserver && \
    chmod 777 /home/csserver

USER csserver


RUN cd /home/csserver && \
    wget "https://downloads.sourceforge.net/project/cs16serverpreconfiguredlinux/beta2014/linuxserver%2BdprotoDualnosteam.tar.gz" && \
    tar xvzf linuxserver+dprotoDualnosteam.tar.gz && \
    rm -f linuxserver+dprotoDualnosteam.tar.gz


WORKDIR /home/csserver/27020

## Activate dual protocol
ADD config/dproto.cfg  dproto.cfg

##Add extra maps
ADD extra-maps/maps/ ./cstrike/maps/
ADD extra-maps/gfx/ ./cstrike/gfx/
ADD extra-maps/*.wad ./cstrike/

## Add custom config
RUN mv ./cstrike/server.cfg ./cstrike/server.cfg.bkp
ADD ./config/server.cfg.custom cstrike/server.cfg

## Add custom mapcycle list for map rotation
RUN mv ./cstrike/mapcycle.txt ./cstrike/mapcycle.txt.bkp
ADD ./config/mapcycle.txt.custom ./cstrike/mapcycle.txt

## Add custom plugin configuration and extra plugins

RUN mv ./cstrike/addons/amxmodx/configs/plugins.ini ./cstrike/addons/amxmodx/configs/plugins.ini.bkp
ADD ./config/plugins.ini.custom ./cstrike/addons/amxmodx/configs/plugins.ini

ADD extra-plugins/*.amxx ./cstrike/addons/amxmodx/plugins/
ADD extra-plugins/scripting/*.sma ./cstrike/addons/amxmodx/scripting/
ADD extra-plugins/scripting/include/*.inc ./cstrike/addons/amxmodx/scripting/include/

  ## Default rcon password abc123

  ## based on https://sourceforge.net/p/cs16serverpreconfiguredlinux/wiki/Home/
