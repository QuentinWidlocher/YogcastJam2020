---@class BasicEnemy : GameObject
---@field public speed number
---@field public dir Vector
---@field public hp integer
---@field public movingCooldown Gauge
---@field public shootingCooldown Gauge
---@field public bulletPool Bullet[]
BasicEnemy = GameObject:new({
    speed = 1,
    dir = getRandomDirection(),
    hp = 1,
    movingCooldown = { value = 0, max = 10 },
    shootingCooldown = { value = 0, max = 10 },
})

function BasicEnemy:update()
    self:shoot()
    self:move()
end

function BasicEnemy:shoot()
    self.shootingCooldown.value = self.shootingCooldown.value + 1

    if self.shootingCooldown.value >= self.shootingCooldown.max then
        local pos = self:getCenteredPos()
        local targetPos = player:getCenteredPos()

        -- add the bullet to the pool so it'll be drawn and updated
        add(bulletPool, Bullet:new({
            x = pos.x,
            y = pos.y,
            playerVersion = false,
            lifespan = self.shootingCooldown.max * 10,
            speed = 1,
            dir = normalize({
                x = targetPos.x - pos.x,
                y = targetPos.y - pos.y,
            })
        }))

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