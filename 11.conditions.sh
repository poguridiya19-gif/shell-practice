#!/bin/bash

echo " please enter the number "
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo " given number $NUMBER is even "
else
    echo " given number $NUMBER is odd "
fi

if [ $(($NUMBER % 2)) -eq 1 ]; then
    echo " given number $NUMBER is prime number "
else 
    echo " given number $NUMBER is composite number "
fi