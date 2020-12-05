---@class BasicEnemy : GameObject
---@field public speed number
---@field public dir Vector
---@field public hp Gauge
---@field public movingCooldown Gauge
---@field public shootingCooldown Gauge
---@field public bulletPool Bullet[]
---@field public shootingType DefaultShootingType
BasicEnemy = GameObject:new({
    speed = 1,
    dir = getRandomDirection(),
    hp = { value = 100, max = 100 },
    movingCooldown = { value = 0, max = 10 },
    shootingCooldown = { value = 0, max = 10 },
    hurtCooldown = { value = 0, max = 5 },
    shootingType = DefaultShootingType,
    movingType = DefaultEnemyMovingType,
    phase = 5,
    __type = "BasicEnemy",
})

function BasicEnemy:update()
    self:shoot()
    self:move()

    self.hurtCooldown.value = min(self.hurtCooldown.value + 1, self.hurtCooldown.max)
end

function BasicEnemy:init()
end

function BasicEnemy:shoot()
    self.shootingCooldown.value = self.shootingCooldown.value + 1

    if self.shootingCooldown.value >= self.shootingCooldown.max then
        local pos = self:getCenteredPos()
        local targetPos = player:getCenteredPos()

        self.shootingType.from = pos
        self.shootingType.dir = subtractVectors(pos, targetPos)

        local bullet = Bullet:new(
            {
                speed = 1,
                playerVersion = false,
            }
        )
        bullet:init()

        self.shootingType:shoot(bullet)

        -- reset the cooldown
        self.shootingCooldown.value = 0
    end
end

function BasicEnemy:move() 
    self.movingType:move(self)
end

function BasicEnemy:hurt(dmg)
    shake = 0.1
    sfx(SFX.ENEMY_DMG)
    
    self.hp.value = self.hp.value  - dmg
    self.hurtCooldown.value = 0

    if self.hp.value <= 0 then
        self.phase = self.phase - 1
        self.hp.value = self.hp.max
    end
end