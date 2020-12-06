---@class SuperhotBulletMovingType : MovingType
SuperhotBulletMovingType = MovingType:new({
    baseMovingType = DefaultBulletMovingType:new(),
    __type = "SuperhotBulletMovingType",
})

function SuperhotBulletMovingType:move(bullet)
    if player:isMoving() then
        self.baseMovingType:move(bullet)
    end
end