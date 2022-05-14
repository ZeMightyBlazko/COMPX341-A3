#!/bin/bash

#This function is for the adding, committing and pushing of code to GitHub (from root level)
function git_commands () {
	echo "Adding files to git..."
	git add .
	echo "Committing files to git..."
	git commit -m "COMPX341-22A-A3 Committing from CI/CD Pipeline"
	echo "Pushing files to git..."
	git push
}


#run the npm commands, if anything fails, an error message will be printed
echo "Running npm install..."
if npm install ; then
	echo "Running npm run build..."
	if npm run build ; then
		cd ../
		git_commands
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
