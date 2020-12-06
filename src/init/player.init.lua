function init_player()

    ---@type Player
    player = Player:new({
        hp = 1,
        x = SCREEN_SIZE/2,
        y = SCREEN_SIZE/2,
        shootingType = DefaultShootingType:new(),
        movingType = DefaultPlayerMovingType:new(),
    })
end