#!/bin/bash

USERID=$(id -u)

if [$USERID  -ne  0]; then
    echo "error:: please run these script with root privelage"
    exit 1 # factor is other than 0 
fi

dnf install mysql -y

if [$? -ne 0]; then
    echo "error:: installing mysql is failure"
    exit 1
else
    echo "installing mysql is success"
fi
