-- State Machine
GAME_STATES = {
    default = 0,
}

---@type integer
STATE = GAME_STATES.default

---@param new_state integer
function change_state(new_state)
    STATE = new_state
end