function draw_player()
    if player.hurtCooldown.value < player.hurtCooldown.max then
        pal(7, 14, 0)
        pal(6, 8, 0)
        pal(13, 2, 0)
    end
    player:draw()
    pal()
end