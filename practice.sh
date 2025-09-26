#!/bin/bash

echo "please enter the number"
read number

if [ $(($number % 2)) ]; then
    echo "given $number is even"
else
    echo "given $number is odd"
fi
