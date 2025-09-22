#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run these script with root privelege"
    exit 1 # failure is other than zero
fi

VALIDATE(){ # functions recieve input through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "$R Error:: Installing $2 is failure $N"
        exit 1
    else
        echo -e "$R Installing $2 is Success $N"
    fi
}

dnf list installed mysql
# install if it is not found
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo -e "MySQL already exist ... $G SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Ngnix"
else
    echo -e "Ngnix already exist ... $G SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then 
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "Python3 already exist ...$G SKIPPING $N"
fi
