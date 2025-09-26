#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "error:: please run these script with root privelage"
    exit 1 #failure other than zero
fi

dnf install mysql server -y

if [ $? -ne 0 ]; then
    echo "error:: installing mysql is failure"
    exit 1
else
    echo "installing mysql is success"
fi
