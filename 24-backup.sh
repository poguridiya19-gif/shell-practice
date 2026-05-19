#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# script arugements
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if not provided considered as 14 days

# logging setup
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
#LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
LOG_FILE="$LOGS_FOLDER/backup.log" # modified to run the script as

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

# root privilige check
if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

# usage function
USAGE(){
    echo -e "$R usage:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional,default 14 days]$N"
    exit 1
}

#### check SOURCE_DIR and DEST_DIR passed or not #### 
if [ $# -lt 2 ]; then
   USAGE
fi

#### check SOURCE_DIR exist or not ####
if [ ! -d $SOURCE_DIR ]; then
   echo -e "$R source $SOURCE_DIR doesn't exist $N"
   exit 1
fi

### check DEST_DIR exist or not ####
if [ ! -d $DEST_DIR]; then
   echo -e "$R destination $DEST_DIR doesn't exist $N"
   exit 1
fi

### find the files ###
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

if [ ! -z "${FILES}" ]; then
### start archeving ###
   echo "Files found:$FILES"
   TIMESTAMP=$(date +%F-%H-%M) 
   ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
   echo "zip file name: $ZIP_FILE_NAME"
   find $SOURCE_DIR -name "*.log" -type f -mtime +14 | zip -@ -j "$ZIP_FILE_NAME"
   
   ### Check Archieval Success or not ###
   if [ -f $ZIP_FILE_NAME ]
   then
        echo -e "Archeival ... $G SUCCESS $N"
        while IFS= read -r filepath
        do 
           echo "deleting the file: $filepath"
           rm -rf $filepath
           echo "deleted the file: $filepath"
        done <<< $
    else
        echo "Archeival ... $R FAILURE $N"
        exit 1
    fi
   


