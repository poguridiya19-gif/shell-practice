#!/bin/bash

userid=$(id -u)

if [$userid -ne 0]; then
    echo "error:: please run these script with root privelage"
    exit 1
fi
