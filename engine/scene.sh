#!/bin/bash

GAME_STATE="RUNNING"
CURRENT_SCENE="MAIN"

scene_set_state() {
    GAME_STATE=$1
}

scene_set() {
    CURRENT_SCENE=$1
}
