#!/bin/bash
#creates an app reminder for students to remind them pending submissions
#ask for user input and create a directory submissions_reminder_{userinput}
read -p "Enter your name:" name
mkdir -p "submissions_reminder_${name}"

parent_dir="submissions_reminder_${name}"

#create subdirectories inside the parent directory(app, modules, assets, config)

mkdir -p "${parent_dir}/app"
mkdir -p "${parent_dir}/modules"
mkdir -p "${parent_dir}/assets"
mkdir -p "${parent_dir}/config"


# create the files in their respective directories

echo "# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
" > "${parent_dir}/config/config.env"
