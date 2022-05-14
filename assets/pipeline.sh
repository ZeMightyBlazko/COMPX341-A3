# Written by Veela Moxham-Bettridge, ID:1537715 for COMPX341 Assignment 3 10/05/2022

#!/bin/bash

# NOTE: this script should be ran from within the assets folder (i.e. root/assets) as this code contains a relative path (used for 
# actions related to Git) and there would be major consequences if not ran from assets (i.e. the pipeline code would break).

#This function is for the adding, committing and pushing of code to GitHub (from root level)
function git_commands () {
	echo "Adding files to git..."
	git add .
	echo "Committing files to git..."
	git commit -m "$1"
	echo "Pushing files to git..."
	git push
}


#check for a commit message, if there is no message, display a usage statement and exit the script
if [ -z "$1" ] ; then
	echo "Usage: pipeline.sh <commit message>"
	exit 0
fi


#run the npm commands, if anything fails, an error message will be printed
echo "Running npm install..."
if npm install ; then
	echo "Running npm run build..."
	if npm run build ; then
		cd ../
		git_commands "$1"
		cd assets/
		echo "Running npm run start..."
		if npm run start ; then
			echo "Application has deployed successfully!" 
		else
			echo "ERROR: npm run start F A I L E D"
		fi
	else
		echo "ERROR: npm run build F A I L E D"
	fi
else
	echo "ERROR: npm install F A I L E D"
fi



