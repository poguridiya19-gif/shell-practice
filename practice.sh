#!/bin/bash

user=$(id-u)

if [$user -ne 0]; then
    echo "error:: please run the script with root privilage"
fi
