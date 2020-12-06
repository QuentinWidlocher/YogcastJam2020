-- Draw Game

draw_fun = {
    [GAME_STATES.MAIN_MENU] = function() draw_main_screen() end,
    [GAME_STATES.GAME] = function() draw_game() end,
}

function _draw()
    cls(1)
    draw_fun[STATE]()
end

function draw_main_screen()
    draw_bgParticles()

    print("how to avoid a", (SCREEN_SIZE/2) - (fromOct(13)/2), fromOct(1.5), 7)

    local pos = getSpriteCoord(128)
    sspr(
        fromOct(pos.x),
        fromOct(pos.y),
        fromOct(13),
        fromOct(2),
        (SCREEN_SIZE/2) - (fromOct(13)/2),
        fromOct(2)
    )

    print("⬆️⬇️⬅️➡️\t\tmove around", (SCREEN_SIZE/2) - (fromOct(13)/2), fromOct(13), 7)
    print("\x8e or \x97\t\tshoot", (SCREEN_SIZE/2) - (fromOct(13)/2), fromOct(14), 7)

    local text = "- shoot to play -"
    local speed = 50
    local height = 3
    for i=0,#text,1 do
        print(
            sub(text,i,i),
            (i*4)+fromOct(1),
            64+sin(((time()*60)+i)/speed)*height,
            8
        )
    end
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
    dtb_draw()
    draw_debug(false)
end