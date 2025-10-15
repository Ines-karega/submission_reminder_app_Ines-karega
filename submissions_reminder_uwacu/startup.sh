
if [ -f "./app/reminder.sh" ]; then
./app/reminder.sh
else
echo "Error: reminder.sh not found in the app directory."
exit 1
fi

