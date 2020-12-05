---@class DefaultShootingType : ShootingType
DefaultShootingType = shallowCopy(ShootingType)
DefaultShootingType.cooldown = { value = 0, max = 20 }
DefaultShootingType.speed = 2

---@param bullet Bullet
function DefaultShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.speed = self.speed
    bullet.dir = normalize(self.dir)

    -- add the bullet to the pool so it'll be drawn and updated
    add(bulletPool, bullet)
end