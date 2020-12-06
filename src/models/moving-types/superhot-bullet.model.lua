---@class SuperhotBulletMovingType : MovingType
SuperhotBulletMovingType = MovingType:new({
    baseMovingType = DefaultBulletMovingType:new(),
    __type = "SuperhotBulletMovingType",
})

function SuperhotBulletMovingType:move(bullet)
    bullet.speed = bullet.origSpeed * SuperhotModifier.timeMod
    self.baseMovingType:move(bullet)
end