#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run these script with root privelege"
    exit 1 # failure is other than zero
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: installing mysql is failure"
    exit 1
else
    echo "installing mysql is Success"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "error installing nginx is failure"
    exit 1
else
    echo "Installing nginx is Success"
fi

dnf install mongodb-mongosh -y
 
if [ $? -ne 0 ]; then
    echo "error:: installing mongodb-mongosh is failure"
    exit 1
else
    echo "installing mongodb-mongosh is Success"
fi
