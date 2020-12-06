-- Update Game

function _update()
    update_camera()
    update_bgParticles()
    update_player()
    update_enemies()
    update_bullets()
    dtb_update()

    --TODO REMOVE ME
    --if (btnp(GAMEPAD.O)) then nextLevel() end
end