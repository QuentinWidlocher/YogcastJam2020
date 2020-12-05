-- Draw Game

function _draw()
    cls(1)
    draw_game()
end

function draw_game()
    draw_bgParticles()
    draw_enemies()
    draw_player()
    draw_bullets()
    screen_shake()
    draw_debug(false)
end