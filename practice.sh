#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run these script with root privelege"
    exit 1
fi

VALIDATE(){
    #$1=exit status
    #$2=package name
    if [ $1 -ne 0 ]; then
        echo "Installing $2 is failure"
        exit 1
    else 
        echo "Installing $2 is success"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "NGINX"

dnf install python3 -y
VALIDATE $? "PYTHON3"

