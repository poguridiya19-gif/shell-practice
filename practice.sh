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

dnf list installed mysql
#install if it is not found 
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL already exist...$R skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e "NGNIX already exist...$R skipping $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "PYTHON3"
else
    echo -e "python3 already exist...$R Skipping $N"
fi

