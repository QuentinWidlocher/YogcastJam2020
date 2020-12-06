---@class SuperhotShootingType : ShootingType
---@field public baseShootingType ShootingType
SuperhotShootingType = ShootingType:new({
    baseShootingType = DefaultShootingType:new(),
    __type = "SuperhotShootingType",
})

---@param bullet Bullet
function SuperhotShootingType:shoot(bullet)
    bullet.movingType = SuperhotBulletMovingType:new()

    self.baseShootingType.from = self.from
    self.baseShootingType.dir = self.dir
    self.baseShootingType.cooldown = self.cooldown
    self.baseShootingType.speed = self.speed

    self.baseShootingType:shoot(bullet)
end