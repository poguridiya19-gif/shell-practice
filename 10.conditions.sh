#!/bin/bash

NUMBER=$1

If [ $NUMBER -lt 10 ]; then
    echo " given number $NUMBER is less than 10 "
Else
    echo " given number $NUMBER is greater than or equal to 10 "
fi

# -gt
# -eq
# -ne