#!/bin/bash

# Restore terminal settings on exit
util_cleanup() {
    # Show cursor, reset text formatting, clear screen
    printf "\e[?25h\e[0m\e[2J\e[1;1H"
    # Restore normal terminal behavior
    stty sane
    exit 0
}

# Setup traps for graceful exit
util_init() {
    trap util_cleanup SIGINT SIGTERM EXIT
}
