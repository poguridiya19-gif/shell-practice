#!/bin/bash

#EVERYTHING In shell is considered as string
NUMBER1=100
NUMBER2=200
NAME=Devops

SUM=$(($NUMBER1+NUMBER2+$NAME)) 

echo "SUM is: ${SUM}"

# Size = 4, Max index = 3
LEADERS=("Modi" "Putin" "Trudo" "Trump")

echo "All leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]}"
echo "First Leader: ${LEADERS[10]}"

