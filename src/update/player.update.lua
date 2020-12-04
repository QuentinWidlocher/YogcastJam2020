function update_player()
    player_input()
    player_move()
end

function player_input()
    player.vx = 0
    player.vy = 0
    if btn(GAMEPAD.UP) then player.vy -= 1 end
    if btn(GAMEPAD.DOWN) then player.vy += 1 end
    if btn(GAMEPAD.LEFT) then player.vx -= 1 end
    if btn(GAMEPAD.RIGHT) then player.vx += 1 end
end

function player_move()
    player.x += player.vx * player.speed
    player.y += player.vy * player.speed

    player.x = clamp(player.x, 0, SCREEN_SIZE)
    player.y = clamp(player.y, 0, SCREEN_SIZE)
end