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
    hp = { value = 20, max = 20 },
    movingCooldown = { value = 0, max = 10 },
    shootingCooldown = { value = 0, max = 10 },
    hurtCooldown = { value = 0, max = 5 },
    shootingType = HomingShootingType,
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
    self.movingCooldown.value = self.movingCooldown.value + 1

    local function changeDirection()
        self.dir = getRandomDirection()
        self.movingCooldown.value = 0
    end

    -- change direction after cooldown
    if self.movingCooldown.value >= self.shootingCooldown.max then
        changeDirection()
    end

    -- Reverse direction if going oustide the screen
    if not self:isInsideScreen() then
        self.dir = M.map(self.dir, invert)
    end
    
    ---@type Vector
    local nextPos = { 
        x = self.x + (self.dir.x * self.speed),
        y = self.y + (self.dir.y * self.speed) 
    }

    -- move
    self.x = nextPos.x
    self.y = nextPos.y
end

function BasicEnemy:hurt(dmg)
    shake = 0.05
    sfx(SFX.ENEMY_DMG)
    self.hp.value = self.hp.value  - dmg
    self.hurtCooldown.value = 0
end