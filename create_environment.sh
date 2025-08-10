#!/bin/bash

read -p "Enter your name : " name

mkdir -p submission_reminder_$name

cd submission_reminder_$name

mkdir -p app modules assets config

cat > app/reminder.sh << 'EOF'

#!/bin/bash

source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

cat > modules/functions.sh << 'EOF'

#!/bin/bash

function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOF

cat > assets/submissions.txt << 'EOF'

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Jude, Git, not submitted
Jane, Shell Permissions, not submitted
Kimberly, Shell Navigation, submitted
Hanif, Git, submitted
Priscilla, Shell Basics, submitted
EOF

cat > config/config.env << 'EOF'

ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

cat > startup.sh << 'EOF'

#!/bin/bash

echo "Submission Reminder"
echo -e "--------------------------------------------"
chmod +x app/reminder.sh
./app/reminder.sh
EOF

chmod +x startup.sh app/reminder.sh modules/functions.sh

echo "To test the application :"
echo "1. cd submission_reminder_$name "
echo "2. ./startup.sh"
