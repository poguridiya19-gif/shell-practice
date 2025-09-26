#!/bin/bash

userid=(id -u)

if [ $userid -ne 0 ]; then
    echo "error:: please run the script with root privilage"
fi
