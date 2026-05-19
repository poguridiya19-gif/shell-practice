#!/bin/bash
# VARIABLE="shell scripting is fun!"
# echo $VARIABLE

# HOSTNAME=diya # no need $ for names like other also no need "" , () these r not neccesity
# echo  "this script is running on $HOSTNAME"

FILE_PATH="/home/ec2-user"
if [-e "$FILE_PATH"]; then
   echo "$FILE_PATH paswords are enabled"
fi   