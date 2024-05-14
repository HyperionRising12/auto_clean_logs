#!/bin/bash

# Define the function to clean logs and history files
clean_logs() {
    # Clean Bash history
    if [ -f ~/.bash_history ]; then
        > ~/.bash_history
        echo "Bash history cleaned."
    fi

    # Clean Zsh history
    if [ -f ~/.zsh_history ]; then
        > ~/.zsh_history
        echo "Zsh history cleaned."
    fi

    # Clean Fish history
    if [ -f ~/.local/share/fish/fish_history ]; then
        > ~/.local/share/fish/fish_history
        echo "Fish history cleaned."
    fi

    # Clean system logs
    sudo sh -c 'cat /dev/null > /var/log/syslog'
    sudo sh -c 'cat /dev/null > /var/log/auth.log'
    sudo sh -c 'cat /dev/null > /var/log/kern.log'

    # Clean package management logs
    sudo sh -c 'cat /dev/null > /var/log/dpkg.log'
    sudo sh -c 'cat /dev/null > /var/log/yum.log'

    echo "History files and system logs cleaned successfully."
}

# Loop indefinitely
while true; do
    # Call the function to clean logs
    clean_logs
    
    # Sleep for 5 minutes (300 seconds)
    sleep 300
done
