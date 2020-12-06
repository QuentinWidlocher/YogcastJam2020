-- Update Game
update_fun = {
    [GAME_STATES.MAIN_MENU] = function() update_main_screen() end,
    [GAME_STATES.GAME] = function() update_game() end,
}

function _update()
    update_fun[STATE]()
end

function update_main_screen()
    update_bgParticles()

    sspr()

    if (btnp(GAMEPAD.X) or btnp(GAMEPAD.O)) then 
        change_state(GAME_STATES.GAME)
    end
end

function update_game()
    update_camera()
    update_bgParticles()
    update_player()
    update_enemies()
    update_bullets()
    dtb_update()
end