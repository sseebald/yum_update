yum_update
==========

Puppet module that creates a fact that checks for pending updates on systems using yum. 
Sets up an Mcollective task to upgrade all packages with updates.

Relied on the jpadams/runyer module to set up the Mcollective task.

Testing workflow as follows - Live management, filter nodes by those with a fact of has_updates = Yes, 
trigger advanced task yum_upgrade which will run a yum upgrade -y on the selected boxes. 

To-do:

Fix bash script to detect pending/available updates
Add in Debian support
Add in Windows support
