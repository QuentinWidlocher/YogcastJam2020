levelIndex = 0
levels = {
    {
        player = Player:new({
            x = SCREEN_SIZE/2,
            y = SCREEN_SIZE/2,
            shootingType = DefaultShootingType:new(),
            movingType = DefaultPlayerMovingType:new(),
        }),
        enemy = BasicEnemy:new({
            top_left_sprite = 64,
            hurtSprite = 72,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE / 2,
            y = SCREEN_SIZE / 4,
            movingType = DefaultEnemyMovingType:new(),
            phases = {
                {shootingType = DefaultShootingType:new(), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 70},
                {shootingType = DefaultShootingType:new(), bulletCooldown = 10, bulletSpeed = 2, hpMax = 60},
                {shootingType = HomingShootingType:new(), bulletCooldown = 15, bulletSpeed = 1, hpMax = 50},
                {shootingType = TrishotShootingType:new(), bulletCooldown = 15, bulletSpeed = 4, hpMax = 50},
            }
        })
    },
    {
        player = Player:new({
            x = SCREEN_SIZE/2,
            y = SCREEN_SIZE/2,
            shootingType = DefaultShootingType:new(),
            movingType = GridPlayerMovingType:new(),
        }),
        enemy = BasicEnemy:new({
            top_left_sprite = 96,
            hurtSprite = 104,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE / 2,
            y = SCREEN_SIZE / 4,
            movingType = DefaultEnemyMovingType:new(),
            phases = {
                {shootingType = DefaultShootingType:new(), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 70},
                {shootingType = DefaultShootingType:new(), bulletCooldown = 10, bulletSpeed = 2, hpMax = 60},
                {shootingType = HomingShootingType:new(), bulletCooldown = 15, bulletSpeed = 1, hpMax = 50},
                {shootingType = TrishotShootingType:new(), bulletCooldown = 15, bulletSpeed = 4, hpMax = 50},
            }
        })
    },
    {
        player = Player:new({
            x = SCREEN_SIZE/2,
            y = SCREEN_SIZE/2,
            shootingType = SuperhotShootingType:new(),
            movingType = SuperhotPlayerMovingType:new(),
        }),
        enemy = BasicEnemy:new({
            top_left_sprite = 98,
            hurtSprite = 106,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE / 2,
            y = SCREEN_SIZE / 4,
            movingType = SuperhotEnemyMovingType:new(),
            phases = {
                {shootingType = SuperhotShootingType:new({ baseShootingType = DefaultShootingType:new()}), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 70},
                {shootingType = SuperhotShootingType:new({ baseShootingType = DefaultShootingType:new()}), bulletCooldown = 10, bulletSpeed = 2, hpMax = 60},
                {shootingType = SuperhotShootingType:new({ baseShootingType = HomingShootingType:new()}), bulletCooldown = 15, bulletSpeed = 1, hpMax = 50},
                {shootingType = SuperhotShootingType:new({ baseShootingType = TrishotShootingType:new()}), bulletCooldown = 15, bulletSpeed = 4, hpMax = 50},
            }
        })
    }
}

function currentLevel() return levels[levelIndex] end

function nextLevel()
    levelIndex = levelIndex + 1
    player = currentLevel().player
    enemy = currentLevel().enemy
    enemy:init()
end