---@class SuperhotPlayerMovingType : MovingType
SuperhotPlayerMovingType = MovingType:new({
    __type = "SuperhotPlayerMovingType",
})

---@param player Player
function SuperhotPlayerMovingType:move(player)
    DefaultPlayerMovingType:move(player)
end