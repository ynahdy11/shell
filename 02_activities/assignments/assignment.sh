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
 mv "C:\Users\Ynahd\documents\dsi\repos\shell\02_activities\assignments\rawdata" "C:\Users\Ynahd\documents\dsi\repos\shell\data"
 cd data
 mv mv rawdata raw
# 3. List the contents of the ./data/raw directory
 cd data
 cd raw
 ls raw
 event_log_26.log  ipaddr_8.txt       server_log_26.log  user_ipaddr_17.log  user_log_35.log
 event_log_27.log  ipaddr_9.txt       server_log_27.log  user_ipaddr_18.log  user_log_36.log
 event_log_28.log  misc_data.txt      server_log_28.log  user_ipaddr_19.log  user_log_37.log
 event_log_29.log  other_file_1.dat   server_log_29.log  user_ipaddr_2.log   user_log_38.log
 event_log_3.log   other_file_10.dat  server_log_3.log   user_ipaddr_20.log  user_log_39.log
 event_log_30.log  other_file_11.dat  server_log_30.log  user_ipaddr_3.log   user_log_4.log
 event_log_31.log  other_file_12.dat  server_log_31.log  user_ipaddr_4.log   user_log_40.log
 event_log_32.log  other_file_13.dat  server_log_32.log  user_ipaddr_5.log   user_log_41.log
 event_log_33.log  other_file_14.dat  server_log_33.log  user_ipaddr_6.log   user_log_42.log
 event_log_34.log  other_file_15.dat  server_log_34.log  user_ipaddr_7.log   user_log_43.log
 event_log_35.log  other_file_16.dat  server_log_35.log  user_ipaddr_8.log   user_log_44.log
 event_log_36.log  other_file_17.dat  server_log_36.log  user_ipaddr_9.log   user_log_45.log
 event_log_37.log  other_file_18.dat  server_log_37.log  user_log_1.log      user_log_46.log
 event_log_38.log  other_file_19.dat  server_log_38.log  user_log_10.log     user_log_47.log
 event_log_39.log  other_file_2.dat   server_log_39.log  user_log_11.log     user_log_48.log
 event_log_4.log   other_file_3.dat   server_log_4.log   user_log_12.log     user_log_49.log
 event_log_40.log  other_file_4.dat   server_log_40.log  user_log_13.log     user_log_5.log
 event_log_41.log  other_file_5.dat   server_log_41.log  user_log_14.log     user_log_50.log
 event_log_42.log  other_file_6.dat   server_log_42.log  user_log_15.log     user_log_6.log
 event_log_43.log  other_file_7.dat   server_log_43.log  user_log_16.log     user_log_7.log
 event_log_44.log  other_file_8.dat   server_log_44.log  user_log_17.log     user_log_8.log
 event_log_45.log  other_file_9.dat   server_log_45.log  user_log_18.log     user_log_9.log
# 4. Create the directory ./data/processed, 
#    then create the following sub-directories within it: server_logs, user_logs, and event_logs
 cd ..
 mkdir processed
 cd processed
 mkdir "server logs" "user logs" "event logs"
# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
 cd ..
 cd raw
 cp *server* "C:\Users\Ynahd\documents\dsi\repos\shell\data\processed\server logs"
# 6. Repeat the above step for user logs and event logs
 cp *user* "C:\Users\Ynahd\documents\dsi\repos\shell\data\processed\user logs"
 cp *event* "C:\Users\Ynahd\documents\dsi\repos\shell\data\processed\event logs"
# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
 rm *ipaddr*
 cd "C:\Users\Ynahd\documents\dsi\repos\shell\data\processed\user logs"

# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
 cd ../../
 mkdir inventory.txt
 cp -r "C:\Users\Ynahd\documents\dsi\repos\shell\data\processed" "C:\Users\Ynahd\documents\dsi\repos\shell\da
 ta\inventory.txt"
###########################################

echo "Project setup is complete!"
