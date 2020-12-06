---@class SuperhotEnemyMovingType : MovingType
SuperhotEnemyMovingType = MovingType:new({
    __type = "SuperhotEnemyMovingType",
})

---@param enemy BasicEnemy
function SuperhotEnemyMovingType:move(enemy)
    enemy.speed = enemy.origSpeed * SuperhotModifier.timeMod
    enemy.shootingType.cooldownRate = enemy.shootingType.origCooldownRate * SuperhotModifier.timeMod
    
    DefaultEnemyMovingType:move(enemy)
end