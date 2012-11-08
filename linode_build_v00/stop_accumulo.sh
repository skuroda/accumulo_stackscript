#!/bin/bash
if [[ $EUID -ne 0 ]]; then
echo "You must be root to run this script. Aborting...";
   echo "I dont really know if you need this, but I've only run it as root.";
   exit 1;
fi
su accumulo -c "cd /usr/local/accumulo; ./bin/stop-all.sh"
su zookeeper -c "cd /usr/local/zookeeper; ./bin/zkServer.sh stop"
su hadoop -c "cd /usr/local/hadoop; ./bin/stop-mapred.sh"
su hadoop -c "cd /usr/local/hadoop; ./bin/stop-dfs.sh"
