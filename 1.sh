#!/bin/bash
echo "Welcome to your Task Manager"
PS3='Please enter your choice: '
options=("Add Task" "View Tasks" "Remove Task" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Add Task")
            echo "Enter your task:"
            read task
            echo "$task" >> tasks.txt
            ;;
        "View Tasks")
            cat tasks.txt
            ;;
        "Remove Task")
            echo "Enter the task number to remove:"
            select task in $(cat tasks.txt); do
                sed -i "/$task/d" tasks.txt
                break
            done
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option";;
    esac
done
