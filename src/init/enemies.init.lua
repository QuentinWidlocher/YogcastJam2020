---@type BasicEnemy[]
enemies = {}

function init_enemies()
    ---@type BasicEnemy
    enemy = BasicEnemy:new({
        top_left_sprite = 64,
        w = fromOct(2),
        h = fromOct(2),
        x = SCREEN_SIZE / 2,
        y = SCREEN_SIZE / 4,
        shootingType = SuperhotShootingType:new({
            baseShootingType = BulletstreamShootingType:new(),
            cooldown = { value = 0, max = 30}
        }),
        movingType = SuperhotEnemyMovingType:new(),
        phases = {
            {shootingType = DefaultShootingType, bulletCooldown = 10, bulletSpeed = 2, hpMax = 70},
            {shootingType = DefaultShootingType, bulletCooldown = 5, bulletSpeed = 5, hpMax = 50},
            {shootingType = HomingShootingType, bulletCooldown = 10, bulletSpeed = 2, hpMax = 30},
            {shootingType = TrishotShootingType, bulletCooldown = 3, bulletSpeed = 4, hpMax = 70},
        }
    })
    enemy:init()

    add(enemies, enemy)

    foreach(enemies, function (enemy) enemy:init() end)
end