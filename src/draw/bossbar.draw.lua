function draw_bossbar()
    --Health bar
    rectfill(0,0,SCREEN_SIZE,2,7)
    rectfill(1,1,SCREEN_SIZE-2,1,8)
    rectfill(1,1,(SCREEN_SIZE - 2)*(enemies[1].hp.value+1)/enemies[1].hp.max,1,11)

    print("eNEMY", SCREEN_SIZE - #"eNEMY"*4, 4, 12)

    --Phase counters
    local cell_size = 5
    for i = 1, 5 do
        rectfill((i-1)*cell_size,2,(i-1)*cell_size+cell_size-1,2+cell_size-1,7)
        if enemies[1].phase >= i then
            color(11)
        else
            color(8)
        end
        rectfill((i-1)*cell_size+1,3,(i-1)*cell_size+cell_size-2,2+cell_size-2)
    end
end