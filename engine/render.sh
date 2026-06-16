#!/bin/bash

render_init() {
    # Hide cursor and clear screen
    printf "\e[?25l\e[2J"
}

render_clear() {
    # Clear screen
    printf "\e[2J"
}

# Usage: render_draw <x> <y> <character/string>
render_draw() {
    local x=$1
    local y=$2
    local char=$3
    # ANSI escape: \e[Y;XH
    printf "\e[%d;%dH%s" "$y" "$x" "$char"
}
