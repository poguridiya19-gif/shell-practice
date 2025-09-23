#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at : $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run these script with root privelege"
    exit 1 # failure is other than zero
fi


VALIDATE(){ # functions recieve input through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "$R Error:: Installing $2 is failure $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$R Installing $2 is Success $N" | tee -a $LOG_FILE
    fi
}
# $@
for package in $@
do
    #check package is already installed or not 
    dnf list installed $package &>>$LOG_FILE
    #if exit status is 0,already installed. -ne 0 need to install it 
    if [ $? -ne 0 ]; then
        dnf instal $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package already installed ... $G SKIPPING $N"
done
