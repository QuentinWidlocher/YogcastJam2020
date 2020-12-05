-- Draw Game

function _draw()
    cls(1)
    draw_game()
end

function draw_game()
    screen_shake()
    draw_bgParticles()
    draw_enemies()
    draw_player()
    draw_bullets()
    draw_bossbar()
    draw_debug(true)
end