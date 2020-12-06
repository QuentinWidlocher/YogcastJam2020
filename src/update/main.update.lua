-- Update Game
update_fun = {
    [GAME_STATES.MAIN_MENU] = function() update_main_screen() end,
    [GAME_STATES.DIALOGUE] = function() update_dialogue() end,
    [GAME_STATES.GAME] = function() update_game() end,
    [GAME_STATES.GAME_OVER] = function() update_gameover() end,
    [GAME_STATES.ENDING] = function() update_ending() end,
}

function _update()
    update_fun[STATE]()
end

function update_main_screen()
    update_bgParticles()

    sspr()

    if (btnp(GAMEPAD.X)) then 
        nextLevel()
        startTime = time()
        change_state(GAME_STATES.DIALOGUE)
    end
end


function update_dialogue()
    update_camera()
    update_bgParticles()
    dtb_update()
end

function update_game()
    update_camera()
    update_bgParticles()
    update_player()
    update_enemies()
    update_bullets()
end

function update_gameover()
    if (btnp(GAMEPAD.O)) then 
        change_state(GAME_STATES.MAIN_MENU)
    end
end

function update_ending()
    dtb_update()
end