#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run these script with root privelege"
    exit 1
fi

VALIDATE(){
    #$1=exit status
    #$2=package name
    if [ $1 -ne 0 ]; then
        echo -e "$G Installing $2 is failure $N"
        exit 1
    else 
        echo -e "$G Installing $2 is success $N"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "NGINX"

dnf install python3 -y
VALIDATE $? "PYTHON3"

