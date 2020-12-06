---@class DefaultBulletMovingType : MovingType
DefaultBulletMovingType = MovingType:new()

function DefaultBulletMovingType:move(bullet)
    bullet.x = bullet.x + (bullet.dir.x * bullet.speed)
    bullet.y = bullet.y + (bullet.dir.y * bullet.speed)
end