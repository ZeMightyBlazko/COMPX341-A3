# Written by Veela Moxham-Bettridge, ID: 1537715 for COMPX341 Assignment 3 10/05/2022

#!/bin/bash

#Prepend my name and id to all of the .ts files
echo "Prepending my name and ID to all of the .ts files..."
find . -name '*.ts' -type f -exec sed -i '1s;^;//Name: Veela Moxham-Bettridge	ID: 1537715\n;' {} +
echo "Done!"
