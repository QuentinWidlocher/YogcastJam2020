---@class SuperhotEnemyMovingType : MovingType
SuperhotEnemyMovingType = MovingType:new({
    __type = "SuperhotEnemyMovingType",
})

---@param enemy BasicEnemy
function SuperhotEnemyMovingType:move(enemy)
    if player:isMoving() then
        DefaultEnemyMovingType:move(enemy)
    end
end