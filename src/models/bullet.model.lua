---@class Bullet
---@field private top_left_sprite integer
---@field public enemyVersionSprite integer
---@field public playerVersionSprite integer
---@field public playerVersion boolean
---@field public dir Vector
---@field public life number
Bullet = GameObject:new({
    top_left_sprite = 66,
    enemyVersionSprite = 66,
    playerVersionSprite = 67,
    playerVersion = true,

    speed = 2,
    dir = { x = 0, y = 0 },
    life = 50,
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
    self.life = self.life - 1
end