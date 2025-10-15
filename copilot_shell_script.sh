#!/bin/bash

read -p "Enter your name:" your_name
your_name=$(echo "$your_name" | tr '[:upper:]' '[:lower:]')

#checking if the name is empty
if [[ -z $your_name ]]; then
echo "Name can't be empty"
exit 1
fi
# check if name is valid 
if [[ ! $your_name =~ ^[a-zA-Z]+$ ]]; then
echo "Invalid name."
exit 1
fi

dir="submission_reminder_$your_name"
submissions_file="$dir/assets/submissions.txt"
config_file="$dir/config/config.env"

#check if directory exists
if [[ ! -d $dir ]]; then
  echo "Directory $dir does not exist"
  exit 1
fi
read -p "Enter your assignment name:" assignment_name
read -p "Enter the number of days remaining to submit:" days
# check if assignment name is empty
if [[ -z $assignment_name ]]; then
echo "Assignment name can't be empty"
exit 1
fi
# check if days is empty
if [[ -z $days ]]; then
echo "Days can't be empty"
exit 1
fi
#cleaning the days variable for trimming spaces
days=$(echo "$days" | xargs)
# check if assignment name contain letters,numbers,spaces and special characters
if [[ ! $assignment_name =~ ^[a-zA-Z0-9\ ]+$ ]]; then
echo "Invalid.Assignment name must contain letters, numbers, and spaces only."
exit 1
fi
# check if days is a positive integer
if [[ ! $days =~ ^[0-9]+$ ]] ; then
   echo "Error: Days must be a positive number between 0-9"
    exit 1  
fi 
# check if assignment already exists in the submissions file
matched_assignment=$(grep -i ", *$assignment_name," "$submissions_file" | awk -F',' '{print $2}' | head -n1 | xargs)
if [[ -z $matched_assignment ]]; then
  echo "Assignment '$assignment_name' does not exist in the submissions file."
  exit 1
fi

# matched_assignment=$(grep -i ", *$assignment_name," "$submissions_file" | awk -F',' '{})

#updating config file 
cat <<EOF > $config_file
#This is the config file
ASSIGNMENT="$assignment_name"
DAYS_REMAINING=$days
EOF

echo "Configuration updated successfully in $config_file"

read -p "Do you want to run the app now? (y/n): " run 
#if condition to prompt user if they want to run the app
if [[ $run =~ ^[Yy]$ ]]; then
echo "Running the app..."
cd "$dir"
./startup.sh
else
echo "You can run the app later by executing the ./startup.sh script in the $dir directory."
fi