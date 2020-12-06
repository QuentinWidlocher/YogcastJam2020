GridPlayerMovingType = MovingType:new()

playerGridx = 8
playerGridy = 8

function GridPlayerMovingType:move(player)
    if btnp(GAMEPAD.UP) then playerGridy -= 1 end
    if btnp(GAMEPAD.DOWN) then playerGridy += 1 end
    if btnp(GAMEPAD.LEFT) then playerGridx -= 1 end
    if btnp(GAMEPAD.RIGHT) then playerGridx += 1 end
    
    player.x = playerGridx * fromOct(1)
    player.y = playerGridy * fromOct(1)
end