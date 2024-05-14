#!/bin/bash

clean_logs() {
    if [ -f ~/.bash_history ]; then
        > ~/.bash_history
        echo "Bash history cleaned."
    fi

    if [ -f ~/.zsh_history ]; then
        > ~/.zsh_history
        echo "Zsh history cleaned."
    fi

    if [ -f ~/.local/share/fish/fish_history ]; then
        > ~/.local/share/fish/fish_history
        echo "Fish history cleaned."
    fi

    sudo sh -c 'cat /dev/null > /var/log/syslog'
    sudo sh -c 'cat /dev/null > /var/log/auth.log'
    sudo sh -c 'cat /dev/null > /var/log/kern.log'

    sudo sh -c 'cat /dev/null > /var/log/dpkg.log'
    sudo sh -c 'cat /dev/null > /var/log/yum.log'

    echo "History files and system logs cleaned successfully."
}

while true; do
    clean_logs
    sleep 300
done
