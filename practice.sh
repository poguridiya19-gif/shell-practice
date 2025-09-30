#!/bin/bash

USERID=$(ID -u)

if ( $USERID -ne 0 ); then
    echo "error:: please run with root privilage"
    exit 1 #factor other than 0
fi