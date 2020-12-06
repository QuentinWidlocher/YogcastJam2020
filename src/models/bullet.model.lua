---@class Bullet
---@field private top_left_sprite integer
---@field public enemyVersionSprite integer
---@field public playerVersionSprite integer
---@field public playerVersion boolean
---@field public dir Vector
---@field public life number
---@field public movingType MovingType
Bullet = GameObject:new({
    top_left_sprite = 66,
    enemyVersionSprite = 66,
    playerVersionSprite = 67,
    playerVersion = true,

    speed = 2,
    dir = { x = 0, y = 0 },
    dmg = 1,

    w = fromOct(1),
    h = fromOct(1),

    movingType = DefaultBulletMovingType:new(),

    __type = 'Bullet'
})

function Bullet:init() 
    self.top_left_sprite = self.playerVersion and self.playerVersionSprite or self.enemyVersionSprite
end

function Bullet:update()
    self.movingType:move(self)
end

function Bullet:addToPool()
    if (#bulletPool < 200) then
        add(bulletPool, self)
    end
end