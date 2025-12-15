#!/bin/bash

# ===============================
# Log Cleanup Script - Production Ready
# Deletes .log file older than 14 days
# ===============================

# current user id 
USERID=$(id -u)

# colours for output
R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
N="\e[0m"  #Reset

# Logging setup
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

# Source Directory Containing Log Files
SOURCE_DIR=/home/ec2-user/app-logs

# check if source directory exists
if [ ! -d $SOURCE_DIR ]; then # ! = negates the test
   echo -e "ERROR:: $SOURCE_DIR doesn't exist"
   exit 1
fi

# find files older than 14 days
FILES_TO_DELETE=$( find $SOURCE_DIR -name "*.log" -type f -mtime +14)

# delete files safely
while IFS= read -r filepath
do
  echo "deleting the file: $filepath"
  rm -rf $filepath
  echo "deleted the file: $filepath"
done <<< $FILES_TO_DELETE
