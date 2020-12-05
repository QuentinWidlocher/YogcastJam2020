---@class TrishotShootingType : ShootingType
---@field public from Vector
---@field public dir Vector
TrishotShootingType = shallowCopy(ShootingType)

---@param bullet Bullet
function TrishotShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.dir = normalize(self.dir)

    local rad = 3.14/3.5

    local rBullet = shallowCopy(bullet)
    rBullet.dir = rotateVector(bullet.dir, rad)

    local lBullet = shallowCopy(bullet)
    lBullet.dir = rotateVector(bullet.dir, -rad)

    -- add the bullet to the pool so it'll be drawn and updated
    add(bulletPool, bullet)
    add(bulletPool, rBullet)
    add(bulletPool, lBullet)
end