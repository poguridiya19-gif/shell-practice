#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executed at : $(date)"

if [ $USERID -ne 0 ]; then
    echo "error:: please run these script with root privelege"
    exit 1
fi

VALIDATE(){ #functions recieve input through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "$R error:: installing $2 is failure $N"
        exit 1
    else
        echo -e "$R installing $2 is success $N"
    fi
}

dnf list installed mysql &>>$LOG_FILE
# install if it is not found
if [ $? -ne 0 ]; then &>>$LOG_FILE
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo -e "MySQL already exist ... $G SKIPPING $N"
fi

