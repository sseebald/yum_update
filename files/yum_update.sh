#!/bin/bash

declare -x FACTER="/opt/puppet/bin/facter --no-external-dir"

if [[ $($FACTER osfamily) == "RedHat" ]];
then
	if [[ -n $(yum -e0 -d0 check-update) ]];
	then
		string="Yes"
	else
		string="No"
	fi
elif [[ $($FACTER osfamily) == "Debian" ]];
then
	if [[ -n $(aptitude search ~U | grep -v "Generic Linux") ]];
	then
		string="Yes"
	else
		string="No"
	fi
else
	string="OS not supported"
fi

echo "Has_Updates=${string}"
