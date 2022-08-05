#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"

    #Display MOTD
    echo "
    ==========================================================================            
    $(tput setaf 6)                            __  .__                         .___             
    $(tput setaf 6)_____    ________ _______ _/  |_|__| ____   ____   ____   __| _/____   ______
    $(tput setaf 6)\__  \  / ____/  |  \__  \\   __\  |/ ___\ /    \ /  _ \ / __ |/ __ \ /  ___/   
    $(tput setaf 6) / __ \< <_|  |  |  // __ \|  | |  \  \___|   |  (  <_> ) /_/ \  ___/ \___ \  
    $(tput setaf 6)(____  /\__   |____/(____  /__| |__|\___  >___|  /\____/\____ |\___  >____  >   
    $(tput setaf 6)     \/    |__|          \/             \/     \/            \/    \/     \/    
    ==========================================================================
    "  
}

function forceStuffs {
  # Forcing Default Server Icon.
  curl -O https://media.discordapp.net/attachments/919461094433644644/1005004318329544754/server-icon.png

  # Forcing Hibernate Plugin.
  curl -o plugins/ServerNaptime.jar https://cdn.discordapp.com/attachments/1003135566503743558/1005043790240817182/ServerNaptime.jar

  # Forcing MOTD.
  echo "motd=\u00a7fThis server is hosted on \u00a79aquaticnodes.host\u00a7r\n\u00a77You can change this MOTD in server.properties" >> server.properties
}

function launchJavaServer {
  # Using Aikars flags.
  java -Xms1024M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui
}
FILE=eula.txt

# Currently this is still in development.

function optimizeJavaServer {
  # Decreasing view distance.
  echo "view-distance=6" >> server.properties

  # Slows down incremental chunk saving during the world save task
  # echo "max-auto-save-chunks-per-tick: 10" >> paper.yml
  
  # Optimize explosions.
  # echo "optimize-explosions: true" >> paper.yml
  
  # Disable overload warnings
  # echo "warn-on-overload: false" >> spigot.yml

  # Prevents players from entering an unloaded chunk (due to lag), which causes more lag.
  # echo "prevent-moving-into-unloaded-chunks: true" >> paper.yml
  
}

# Check if the node IP is matched.
IP=$(curl -s https://checkip.amazonaws.com)
if [ ! "$IP" = 52.187.23.163 ] && [ ! "$IP" = 51.13.180.4 ] && [ ! "$IP" = 195.201.61.35 ] && [ ! "$IP" = 57.128.5.146 ] && [ ! "$IP" = 20.205.38.247 ] && [ ! "$IP" = 20.198.120.116 ] && [ ! "$IP" = 52.187.23.163 ]
then
    display
    echo "$(tput setaf 1)System error. Contact a administrator (x09m19a841)"
else 

if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
sleep 5
echo "
  $(tput setaf 1)Made By ewn#9981 & fate#0993
  $(tput setaf 3)What software would you like to use?
  1) Paper 1.8.8       6)  BungeeCord 
  2) Paper 1.12.2      7)  Bedrock Latest
  3) Paper 1.16.5      8)  Pocketmine MP
  4) Paper 1.17.1      9)  Discord NodeJS 
  5) Paper 1.18.1      10) Discord Python
  "
read -r n

# I was uploading all the server jars to Discord because I was in hurry for vacation lol, will do a complete recode soon.
case $n in
  1) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.8.8 and start it for you.."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085351443394570/paper-server.jar

    display
    
    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 8."
    
    sleep 10
    
    echo -e ""
    
    optimizeJavaServer
    launchJavaServer
  ;;

  2) 
    sleep 1

    echo "$(tput setaf 3)Downloading 1.12.2 Paper..."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085463896870942/paper-server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 11."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  3) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.16.5 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085612710756412/paper-server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 16."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  4)
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.17.1 and start it for you.."

    sleep 4

    forceStuffs

    curl -O https://download2276.mediafire.com/5dptw00gq4mg/dcnk3b1x0h1aial/paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  5) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.18.2 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/921577970550841454/1005258304634753126/paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  6)
    echo "$(tput setaf 3)Ok, I will download latest Bungeecord and start it for you."

    curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

    display 

    java -Xms512M -Xmx512M -jar BungeeCord.jar
  ;;

  7)
    echo ""
    echo "This Software isn't available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  8)
    echo ""
    echo "This Software isn't available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  9)
    echo ""
    echo "This Software isn't available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  10)
    echo ""
    echo "This Software isn't available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  *) 
    echo "Invalid option, exiting..."
    exit
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -f BungeeCord.jar ]; then
  display
  java -Xms512M -Xmx512M -jar BungeeCord.jar
else
if [ ! -f hA5AW4Ni6Si6S4WvZ4WvZhA5AW4N.png ]; then
# Force the server icon.
curl -O https://media.discordapp.net/attachments/919461094433644644/1005004318329544754/server-icon.png
fi
if [ -d plugins ]; then
  mkdir -p plugins
fi
# Redownload the Hibernate jar incase someone delete it.
  curl -o plugins/ServerNaptime.jar https://cdn.discordapp.com/attachments/1003135566503743558/1005043790240817182/ServerNaptime.jar
  display   
  launchJavaServer
fi
fi
fi
