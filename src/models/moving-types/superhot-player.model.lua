---@class SuperhotPlayerMovingType : MovingType
SuperhotPlayerMovingType = MovingType:new({
    __type = "SuperhotPlayerMovingType",
})

---@param player Player
function SuperhotPlayerMovingType:move(player)
    -- player.speed = player.origSpeed * SuperhotModifier.timeMod
    player.maxSpeed = player.origMaxSpeed * SuperhotModifier.timeMod
    player.shootingType.cooldownRate = player.shootingType.origCooldownRate * SuperhotModifier.timeMod

    DefaultPlayerMovingType:move(player)

    if player:isMoving() then
        SuperhotModifier.timeMod = min(SuperhotModifier.timeMod + 0.1, 1)
    else
        SuperhotModifier.timeMod = max(SuperhotModifier.timeMod - 0.1, 0.1)
    end
end