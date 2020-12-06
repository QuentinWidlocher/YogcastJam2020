GridPlayerMovingType = shallowCopy(MovingType)

gridLerpTimer = 0

function GridPlayerMovingType:move(player)
    if btnp(GAMEPAD.UP) then
        player.gridy -= 1
        gridLerpTimer = 0
        player.origx = player.x
        player.origy = player.y
    end
    if btnp(GAMEPAD.DOWN) then
        player.gridy += 1
        gridLerpTimer = 0
        player.origx = player.x
        player.origy = player.y
    end
    if btnp(GAMEPAD.LEFT) then
        player.gridx -= 1
        gridLerpTimer = 0
        player.origx = player.x
        player.origy = player.y
    end
    if btnp(GAMEPAD.RIGHT) then
        player.gridx += 1
        gridLerpTimer = 0
        player.origx = player.x
        player.origy = player.y
    end
    
    player.gridx = clamp(player.gridx, 0, (SCREEN_SIZE - player.w) / 8)
    player.gridy = clamp(player.gridy, 0, (SCREEN_SIZE - player.h) / 8)

    player.x = lerp(player.origx, player.gridx * fromOct(1), gridLerpTimer, 0.4)
    player.y = lerp(player.origy, player.gridy * fromOct(1), gridLerpTimer, 0.4)
    gridLerpTimer += 1
end