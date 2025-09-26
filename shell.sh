#!/bin/bash

USERID=$(ID -u)

if [ $USERID -ne 0 ]; then
    echo " error:: please run with root privelage"
    exit 1 #failure is other than zero
fi

# -gt 
# -lt
# -et