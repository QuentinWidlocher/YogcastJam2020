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

    if (bulletTimeout > 0) then
        --draw text
        local text = "pHASE "..(#enemy.phases - enemy.phase + 1).."/"..#enemy.phases
        local speed = 40
        local height = 5

        -- god help me i'm so tired
        for i=0,#text,1 do
            print(
                sub(text,i,i),
                (SCREEN_SIZE/2)+(i*4)-(#text*2),
                64+sin(((time()*60)+i)/speed)*height,
                7
            )
        end
    end

    draw_bossbar()
    draw_player_bar()
    draw_debug(true)
end