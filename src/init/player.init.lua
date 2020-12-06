function init_player()

    ---@type Player
    player = Player:new({
        x = SCREEN_SIZE/2,
        y = SCREEN_SIZE/2,
        shootingType = SuperhotShootingType:new({
            baseShootingType = DefaultShootingType:new()
        }),
        movingType = SuperhotPlayerMovingType:new(),
    })
end