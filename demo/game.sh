#!/bin/bash

# Find the engine directory relative to this script
GAME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$GAME_DIR/../engine/engine.sh"

# Game Variables
PLAYER_X=10
PLAYER_Y=10
GOAL_X=20
GOAL_Y=15
SCORE=0

# 1. Initialize Game
game_init() {
    SCORE=0
}

# 2. Update Game State
game_update() {
    # Handle Input
    case "$INPUT_KEY" in
        w) ((PLAYER_Y--)) ;;
        s) ((PLAYER_Y++)) ;;
        a) ((PLAYER_X--)) ;;
        d) ((PLAYER_X++)) ;;
        q) scene_set_state "QUIT" ;;
    esac

    # Keep player within screen bounds (e.g., 1 to 40 for X, 1 to 20 for Y)
    PLAYER_X=$(physics_clamp "$PLAYER_X" 1 40)
    PLAYER_Y=$(physics_clamp "$PLAYER_Y" 1 20)

    # Check collision with goal
    if physics_check_collision "$PLAYER_X" "$PLAYER_Y" "$GOAL_X" "$GOAL_Y"; then
        ((SCORE++))
        # Move goal to a new random position (pseudo-random between bounds)
        GOAL_X=$(( (RANDOM % 38) + 2 ))
        GOAL_Y=$(( (RANDOM % 18) + 2 ))
    fi
}

# 3. Render Game
game_render() {
    # Draw boundaries (simple top and bottom limits for visual context)
    render_draw 1 21 "----------------------------------------"
    
    # Draw Goal
    render_draw "$GOAL_X" "$GOAL_Y" "*"
    
    # Draw Player
    render_draw "$PLAYER_X" "$PLAYER_Y" "@"
    
    # Draw UI
    render_draw 1 1 "Score: $SCORE | Use W, A, S, D to move | Press Q to quit"
}

# Start the engine
engine_start
