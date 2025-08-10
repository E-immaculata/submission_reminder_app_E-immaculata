# Submission Reminder System

A simple bash-based system to remind you about unsubmitted assignments and track submission statuses. The system checks which students have not yet submitted their assignments based on a predefined list of submissions.

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Setup Instructions](#setup-instructions)
* [File Structure](#file-structure)
* [How to Use](#how-to-use)
* [Author](#author)

---

## Overview

This bash script helps you manage and remind about students' assignment submissions. It uses a submissions.txt file containing student names, the assignment name, and the submission status (whether submitted or not). It checks which students have not submitted the assignment and outputs a reminder.

## Features

* *Automated Assignment Tracking:* The script checks the status of assignments and provides a reminder for students who have not submitted.
* *Customizable Configurations:* Easily set the assignment to track and the number of days remaining until the deadline via the config.env file.
* *Environment Setup:* The setup process automatically creates necessary directories, files, and makes all scripts executable.

## Setup Instructions

1. *Clone the repository or download the script:*


git clone https://github.com/submission_reminder_app_E-immaculata.git


2. *Create the environment:*
   Navigate to the project directory and run the environment setup script:


sh create_environment.sh


   This will:

   * Prompt you for your name and create a main directory (submission_reminder_<your_name>).
   * Create subdirectories: app, modules, assets, and config.
   * Create necessary script files: reminder.sh, functions.sh, submissions.txt, and config.env.
   * Make all .sh files executable.

3. *Run the application:*
   Once the environment is set up, you can run the reminder system by executing the following commands:


cd submission_reminder_<your_name>
./startup.sh


   The script will display:


Submission Reminder Application
--------------------------------------------
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Checking submissions in ./assets/submissions.txt
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!


## File Structure

The following is the structure of the project:


submission_reminder_<name>/
├── app/
│   └── reminder.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
├── modules/
│   └── functions.sh
└── startup.sh


### Description of Files:

* app/reminder.sh: Main script to load configurations, check submission statuses, and remind about unsubmitted assignments.
* modules/functions.sh: Contains helper functions, including check_submissions that processes the submissions list.
* assets/submissions.txt: Contains the list of students and their assignment statuses (used as a mock data file).
* config/config.env: Holds configuration values like the assignment name and remaining days.
* startup.sh: Entry point to start the reminder process by running the main script.

## How to Use

1. *Change the Assignment:* Edit the config/config.env file to specify the assignment you want to track and the remaining days for submission:


ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2


2. *Add/Modify Student Submissions:* You can edit the assets/submissions.txt file to add or modify students and their assignment statuses. Make sure the format is:


student, assignment, submission status


3. *Run the Reminder Script:* Execute startup.sh to get a reminder about unsubmitted assignments. It will output the list of students who have not submitted the assignment.

## Author


Effiong Immaculata Emmanuel
