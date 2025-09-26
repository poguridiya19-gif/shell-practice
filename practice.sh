#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "error:: please run the script with root privelege"
    exit 1
fi
