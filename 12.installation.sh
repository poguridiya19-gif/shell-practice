#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error:: please run these script with root privelege"
    exit 1 # failure is other than zero
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is Success"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Error:: Installing nginx is failure"
    exit 1
else
    echo "Installing nginx is Success"
fi

dnf install python3 -y
 
if [ $? -ne 0 ]; then
    echo "Error:: Installing python3 is failure"
    exit 1
else
    echo "Installing python3 is Success"
fi