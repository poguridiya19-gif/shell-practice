#!/bin/bash

echo "please enter the number"
read number

if [$(($number % 2)) -eq 0]; then
    echo "reminder is 0 then it is even"
else
    echo "reminder is -nt o then it is odd"
