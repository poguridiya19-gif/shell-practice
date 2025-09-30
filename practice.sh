#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run these script with root privelege"
    exit 1 # factor is other than 0 
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is success"
fi
