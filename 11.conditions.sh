#!/bin/bash

echo " please enter the number "
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo " given number $NUMBER is prime number "
else
    echo " given number $NUMBER is composite number "
fi


