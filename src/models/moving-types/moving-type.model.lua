---@class MovingType
MovingType = {
    __type = "MovingType",
}

---@param o MovingType
---@return MovingType
function MovingType:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function MovingType:move() end