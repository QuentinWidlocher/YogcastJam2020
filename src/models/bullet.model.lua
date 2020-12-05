---@class Bullet
---@field private top_left_sprite integer
---@field public enemyVersionSprite integer
---@field public playerVersionSprite integer
---@field public playerVersion boolean
---@field public dir Vector
Bullet = GameObject:new({
    top_left_sprite = 66,
    enemyVersionSprite = 66,
    playerVersionSprite = 67,
    playerVersion = true,

    speed = 2,
    dir = { x = 0, y = 0 },
    life = { value = 0, max = 10000},
    dmg = 1,

    w = fromOct(1),
    h = fromOct(1),

    __type = 'Bullet'
})

function Bullet:init() 
    self.top_left_sprite = self.playerVersion and self.playerVersionSprite or self.enemyVersionSprite
end

function Bullet:update()
    self.x = self.x + (self.dir.x * self.speed)
    self.y = self.y + (self.dir.y * self.speed)
    self.life.value = self.life.value + 1
end