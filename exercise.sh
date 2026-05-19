#!/bin/bash
# VARIABLE="shell scripting is fun!"
# echo $VARIABLE

# HOSTNAME=diya # no need $ for names like other also no need "" , () these r not neccesity
# echo  "this script is running on $HOSTNAME"

FILE_PATH="/home/ec2-user"
if [ -e "$FILE_PATH" ]; then
   echo "$FILE_PATH paswords are enabled"
fi   

if [  "$FILE_PATH" ]; then
   echo "you have permissions to edit $FILE_PATH"
else 
   echo "you do not have permissions to execute $FILE_PATH"
fi