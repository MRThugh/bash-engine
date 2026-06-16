#!/bin/bash

INPUT_KEY=""

input_init() {
    # Disable echo and canonical mode for immediate key reading
    stty -echo -icanon
}

input_read() {
    # Non-blocking read (timeout 0.001 seconds)
    INPUT_KEY=""
    read -rsn1 -t 0.001 INPUT_KEY
}
