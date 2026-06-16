#!/bin/bash

# Target FPS (e.g., 30 FPS ~ 0.033 seconds per frame)
FRAME_DELAY=0.033

timer_sleep() {
    # Bash sleep supports floats
    sleep $FRAME_DELAY
}
