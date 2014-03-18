#!/bin/bash

if [[ -n $(yum -e0 -d0 check-update) ]];
then
	string="Yes"
else
	string="No"
fi

echo "Has_Updates=${string}"
