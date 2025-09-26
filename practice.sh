#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "ERROR:: please run these script with root privelage"
    exit 1 #failure other than zero
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: installing mysql is failure"
    exit 1
else
    echo "installing mysql is success"
fi

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run these script with root privelege"
    exit 1 # failure is other than zero
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is Success"
fi