---@class DefaultShootingType : ShootingType
---@field public from Vector
---@field public dir Vector
DefaultShootingType = shallowCopy(ShootingType)

---@param bullet Bullet
function DefaultShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.dir = normalize(self.dir)

    -- add the bullet to the pool so it'll be drawn and updated
    add(bulletPool, bullet)
end