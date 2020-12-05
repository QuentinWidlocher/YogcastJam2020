-- Draw Game

function _draw()
    cls(1)
    draw_game()
end

function draw_game()
    draw_enemies()
    draw_player()
    draw_bullets()
    draw_debug(true)
end