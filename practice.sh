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

dnf installing nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing nginx is failure"
    exit 1
else
    echo "Installing nginx is success"
fi

dnf installing python -3

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing python is failure"
    exit 1
else
    echo "Installing python is success"
fi