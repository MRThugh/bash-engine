#!/bin/bash

# Simple point/grid collision
# Usage: physics_check_collision <x1> <y1> <x2> <y2>
# Returns 0 (true) if coordinates match, 1 (false) otherwise
physics_check_collision() {
    if [[ "$1" -eq "$3" && "$2" -eq "$4" ]]; then
        return 0
    fi
    return 1
}

# Bounds checking
# Usage: physics_clamp <value> <min> <max>
physics_clamp() {
    local val=$1
    local min=$2
    local max=$3
    if [[ "$val" -lt "$min" ]]; then
        echo "$min"
    elif [[ "$val" -gt "$max" ]]; then
        echo "$max"
    else
        echo "$val"
    fi
}
