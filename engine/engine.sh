#!/bin/bash

# Get the directory of the engine scripts
ENGINE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source all engine subsystems
source "$ENGINE_DIR/util.sh"
source "$ENGINE_DIR/render.sh"
source "$ENGINE_DIR/input.sh"
source "$ENGINE_DIR/physics.sh"
source "$ENGINE_DIR/scene.sh"
source "$ENGINE_DIR/timer.sh"

engine_start() {
    # Initialize engine subsystems
    util_init
    render_init
    input_init
    
    # Initialize the game (implemented by the user)
    game_init

    # Main Game Loop
    while [[ "$GAME_STATE" == "RUNNING" ]]; do
        # 1. Read input
        input_read
        
        # 2. Update game state
        game_update
        
        # 3. Update physics (if user defined a physics step, optional)
        if type game_physics &>/dev/null; then
            game_physics
        fi
        
        # 4. Render frame
        render_clear
        game_render
        
        # 5. Sleep to maintain frame timing
        timer_sleep
    done

    # Cleanup when the loop exits
    util_cleanup
}
