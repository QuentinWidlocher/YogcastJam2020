---@class BasicEnemy : GameObject
---@field public speed number
---@field public dir Vector
---@field public hp integer
BasicEnemy = GameObject:new({
    speed = 3,
    dir = getRandomDirection(),
    hp = 1,
    movingCooldown = { value = 10, max = 10}
})

function BasicEnemy:update()
    self.movingCooldown.value = self.movingCooldown.value - 1

    local function changeDirection()
        self.dir = getRandomDirection()
        self.movingCooldown.value = self.movingCooldown.max
    end

    -- change direction after cooldown
    if self.movingCooldown.value <= 0 then
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