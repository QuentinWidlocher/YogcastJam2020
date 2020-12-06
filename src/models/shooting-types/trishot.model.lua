---@class TrishotShootingType : ShootingType
TrishotShootingType = ShootingType:new({
    cooldown = { value = 0, max = 20 },
    speed = 1,
    sprite = 69,
})

---@param bullet Bullet
function TrishotShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.speed = self.speed
    bullet.top_left_sprite = self.sprite
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