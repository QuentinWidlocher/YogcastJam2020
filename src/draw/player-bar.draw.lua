function draw_player_bar()
    --Health bar
    rectfill(1,SCREEN_SIZE - 3,(SCREEN_SIZE-2)*(player.hp.value/player.hp.max),SCREEN_SIZE - 2,8)

    print("pLAYER", 1, SCREEN_SIZE - 10, 8)
end