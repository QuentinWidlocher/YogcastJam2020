---@class ShootingType
---@field public from Vector
---@field public dir Vector
ShootingType = {
    from = { x = 0, y = 0},
    dir = { x = 0, y = 0},
}

---@param bullet Bullet
function ShootingType:shoot(bullet) end