---@type BasicEnemy[]
enemies = {}

function init_enemies()
    ---@type BasicEnemy
    enemy = BasicEnemy:new({
        top_left_sprite = 64,
        hurtSprite = 72,
        w = fromOct(2),
        h = fromOct(2),
        x = SCREEN_SIZE / 2,
        y = SCREEN_SIZE / 4,
        movingType = SuperhotEnemyMovingType:new(),
        phases = {
            {shootingType = DefaultShootingType:new(), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 70},
            {shootingType = DefaultShootingType:new(), bulletCooldown = 10, bulletSpeed = 2, hpMax = 60},
            {shootingType = HomingShootingType:new(), bulletCooldown = 15, bulletSpeed = 1, hpMax = 50},
            {shootingType = TrishotShootingType:new(), bulletCooldown = 15, bulletSpeed = 4, hpMax = 50},
        }
    })
    enemy:init()

    add(enemies, enemy)

    foreach(enemies, function (enemy) enemy:init() end)
end