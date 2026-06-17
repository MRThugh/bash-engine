# bash-engine

**A lightweight, pure Bash game engine for the terminal.**

Create simple terminal-based games using only Bash — no external dependencies required.

## ✨ Features

- **100% Pure Bash** — Works on any system with Bash
- ANSI escape code rendering
- Non-blocking input handling (WASD + Q)
- Simple physics (collision detection + clamping)
- Scene/State management
- Frame rate control via timer
- Modular and easy to extend
- Ready-to-use demo game (collect stars)

## 🚀 Quick Start

```bash
git clone https://github.com/MRThugh/bash-engine.git
cd bash-engine

cd demo
chmod +x game.sh
./game.sh
```

## 📁 Project Structure

```
bash-engine/
├── engine/                  # Core engine modules
│   ├── engine.sh            # Main engine and game loop
│   ├── render.sh            # Rendering system
│   ├── input.sh             # Input handling
│   ├── physics.sh           # Collision & clamping
│   ├── scene.sh             # Scene / game state
│   ├── timer.sh             # Frame timing
│   └── util.sh              # Utilities & cleanup
├── demo/
│   └── game.sh              # Complete example game
├── LICENSE
└── README.md
```

## 🎮 How to Build Your Own Game

1. Create your `game.sh` file.
2. Source the engine:

```bash
source "../engine/engine.sh"
```

3. Implement these required functions:

```bash
game_init() {
    # Initialize your variables
}

game_update() {
    # Handle input and game logic
}

game_render() {
    # Draw everything using render_draw
}
```

4. Start the engine:

```bash
engine_start
```

### Example from the Demo

```bash
game_update() {
    case "$INPUT_KEY" in
        w) ((PLAYER_Y--)) ;;
        s) ((PLAYER_Y++)) ;;
        a) ((PLAYER_X--)) ;;
        d) ((PLAYER_X++)) ;;
        q) scene_set_state "QUIT" ;;
    esac

    PLAYER_X=$(physics_clamp "$PLAYER_X" 1 40)
    PLAYER_Y=$(physics_clamp "$PLAYER_Y" 1 20)

    if physics_check_collision "$PLAYER_X" "$PLAYER_Y" "$GOAL_X" "$GOAL_Y"; then
        ((SCORE++))
        # Respawn goal
        GOAL_X=$(( (RANDOM % 38) + 2 ))
        GOAL_Y=$(( (RANDOM % 18) + 2 ))
    fi
}

game_render() {
    render_draw "$GOAL_X" "$GOAL_Y" "*"
    render_draw "$PLAYER_X" "$PLAYER_Y" "@"
    render_draw 1 1 "Score: $SCORE | WASD Move | Q Quit"
}
```

## 📋 Main API

### Render
- `render_draw <x> <y> <text>`
- `render_clear`

### Input
- `$INPUT_KEY` (contains last pressed key)

### Physics
- `physics_check_collision <x1> <y1> <x2> <y2>`
- `physics_clamp <value> <min> <max>`

### Scene
- `scene_set_state "QUIT"`

## 🎯 Future Plans

- Multi-line sprites support
- Simple Entity system
- Sound support (`paplay` / `beep`)
- Better UI / menus
- More example games (Snake, Pong, etc.)

## 👤 Author

**Ali Kamrani** ([MRThugh](https://github.com/MRThugh))

## 📜 License

This project is licensed under the **MIT License** — feel free to use, modify, and distribute.
