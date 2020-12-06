---@class DefaultShootingType : ShootingType
DefaultShootingType = ShootingType:new({
    cooldown = { value = 0, max = 20 },
    speed = 2,

    __type = "DefaultShootingType",
})

---@param bullet Bullet
function DefaultShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.speed = self.speed
    bullet.dir = normalize(self.dir)

    -- add the bullet to the pool so it'll be drawn and updated
    bullet:addToPool()
end