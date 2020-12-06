function draw_bossbar()
    --Health bar
    rectfill(1,1,(SCREEN_SIZE - 2)*(enemies[1].hp.value/enemies[1].hp.max),2,12)

    print("eNEMY", SCREEN_SIZE - #"eNEMY"*4, 4, 12)

    --Phase counters
    local cell_size = 5
    for i = 1, 5 do
        if enemies[1].phase >= i then
            color(12)
        else
            color(1)
        end
        rectfill((i-1)*cell_size+1,4,(i-1)*cell_size+cell_size-2,3+cell_size-2)
    end
end