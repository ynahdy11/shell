#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

if [ -d newproject ]; then
  echo "Recreating the newproject directory"
  rm -rf newproject
fi
mkdir newproject
cd newproject

mkdir analysis output
touch README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip -q rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data
mkdir data
# 2. Move the ./rawdata directory to ./data/raw (eg. move it into ./data and rename it to raw)
mv 'C:\Users\Ynahd\Documents\DSI\shell\newproject\rawdata' 'C:\Users\Ynahd\Documents\DSI\shell\data'
mv data/rawdata data/raw
# 3. List the contents of the ./data/raw directory
ls ./data/raw
# 4. Create the directory ./data/processed, 
#    then create the following sub-directories within it: server_logs, user_logs, and event_logs
mkdir -p ./processed/server_logs ./processed/user_logs ./processed/event_logs
# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
cp ./raw/*server*.log ./processed/server_logs
# 6. Repeat the above step for user logs and event logs
cp ./raw/*user*.log ./processed/user_logs
cp ./raw/*event*.log ./processed/event_logs
# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
rm ./raw/*ipaddr* ./processed/user_logs/*ipaddr*
# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
touch ./data/inventory.txt
echo ./processed/server_logs/*server_log* ./processed/user_logs/*user_log* ./processed/event_logs/*event_log* > inventory.txt 


###########################################

echo "Project setup is complete!"
