# Submission Reminder Application

A simple program that helps teachers track student assignments and send reminders for missing submissions.

## Table of Contents

1. [Introduction](#introduction)
2. [What You Need](#what-you-need)
3. [Getting Started](#getting-started)
4. [What this app does](#what-this-app-does)
5. [How to set up the environment (TASK ONE)](#how-to-set-up-the-environment-task-one)
6. [How to choose the assignment and days left (TASK TWO)](#how-to-choose-the-assignment-and-days-left-task-two)
7. [How the submissions file must look](#how-the-submissions-file-must-look)
8. [Troubleshooting](#troubleshooting)

## Introduction

This program helps teachers manage their students' assignments effectively. It creates a simple system to:
- Keep track of who has submitted their work
- Send reminders to students who haven't submitted
- Monitor submission deadlines

## What You Need

To use this program, you will need:
1. Git Bash program installed on your computer

## Getting Started

Before using the program, here are some important things to know:
1. All commands should be typed exactly as shown
2. Your name should be in simple lowercase letters (example: "ines")
# Submission Reminder App

This is a small Bash tool to helps remind students who have not handed in assignments.

## What this app does

- Set up a small folder for your class data.
- Let you pick an assignment and how many days left.
- Check a simple list of students and print reminders for those who did not submit.

## How to set up the environment (TASK ONE)

1. Create the folder and sample files. In the terminal run:

```bash
bash create_environment.sh
```

2. The script will ask: "Enter your name:". Type a short name (letters only). It creates a folder named `submission_reminder_<your_name>` with sample files.

Files created inside the folder:

- `app/reminder.sh`: the program that prints reminders.
- `modules/functions.sh`: helper functions.
- `assets/submissions.txt`: sample list of students and their status.
- `config/config.env`: stores the chosen assignment and days left.
- `startup.sh`: runs the reminder program.

The setup script also makes these new scripts executable so you can run them.

## How to choose the assignment and days left (TASK TWO)

Run:

```bash
bash copilot_shell_script.sh
```

The script will ask three questions:

1) Your name: use the same short lowercase name you used when creating the folder. The script will make the name lower case when looking for your folder.
2) Assignment name: write the assignment exactly as it appears in `assets/submissions.txt` (letters and spaces only).
3) Days remaining: write a number like `2` or `10` (only digits).

What the script checks:

- It checks your folder exists: `submission_reminder_<your_name>`.
- It checks the assignment exists in the second column of `assets/submissions.txt` (case-insensitive).
- It saves your choices into `config/config.env` like this:

```text
#This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
```

After the update, the script will ask: "Do you want to run the app now? (y/n):". If you type `y`, it will run the reminders.

## How the submissions file must look

Open `assets/submissions.txt`. A text file with header and three columns per line:

```
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
```

- The script looks for the assignment in the second column. Do not add extra commas in a line.

`startup.sh` runs the reminder program and prints one line per student who has not submitted.

## Troubleshooting

- "Directory ... does not exist": make sure you used the same lowercase name when you created the folder and when you configure the app. `copilot_shell_script.sh` lowercases the name when checking.
- "Assignment not found": open `assets/submissions.txt` and check the assignment is exactly in the second column. Use the same words (case does not matter).
- Script not executable: make scripts executable with:

```bash
chmod +x create_environment.sh copilot_shell_script.sh
chmod +x submission_reminder_<your_name>/startup.sh
```