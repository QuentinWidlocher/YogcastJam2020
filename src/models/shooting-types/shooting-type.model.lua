---@class ShootingType
---@field public from Vector
---@field public dir Vector
---@field public cooldown Gauge
---@field public speed number
---@field public sprite number
ShootingType = {
    from = { x = 0, y = 0},
    dir = { x = 0, y = 0},
    cooldown = { value = 0, max = 10 },
    speed = 1,
    sprite = 79,

    __type = "ShootingType",
}

---@param o ShootingType
---@return ShootingType
function ShootingType:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

---@param bullet Bullet
function ShootingType:shoot(bullet) end