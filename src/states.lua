-- State Machine
GAME_STATES = {
    MAIN_MENU = 0,
    DIALOGUE = 1,
    GAME = 2,
    GAME_OVER = 3,
}

---@type integer
STATE = GAME_STATES.MAIN_MENU

---@param new_state integer
function change_state(new_state)
    STATE = new_state
end