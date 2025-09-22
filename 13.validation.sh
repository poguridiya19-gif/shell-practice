#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run these script with root privelege"
    exit 1 # failure is other than zero
fi

VALIDATE(){ # functions recieve input through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo "Error:: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is Success"
    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Ngnix"

dnf install python3 -y
VALIDATE $? "python3"

