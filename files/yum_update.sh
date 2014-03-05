#!/bin/bash

if yum -e0 -d0 check-update >/dev/null 2>&1;
then
	string="Yes"
else
	string="No"
fi

echo "Has_Updates=${string}"
