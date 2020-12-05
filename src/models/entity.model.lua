-- Entity Class

---@class Entity
---@field public x number
---@field public y number
---@field public w number
---@field public h number
Entity = {
	x = 0,
	y = 0,
	w = 0,
	h = 0
}

---@param o Entity
---@return Entity
function Entity:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.__type = 'Entity'
	return o
end

---@param other_entity Entity
---@return boolean
function Entity:collide(other_entity) 
	return other_entity.x < self.x + self.w and self.x < other_entity.x + other_entity.w 
        and other_entity.y < self.y + self.h and self.y < other_entity.y + other_entity.h
end

---@return string
function Entity:toString()
	local string = "Printing ".. self.__type .."\n"
	for key, value in pairs(self) do
		string = string..key.." = "..value.."\n"
	end
	return string
end

---@return Vector
function Entity:getCenteredPos()
	return {
		x = self.x + (self.w / 2),
		y = self.y + (self.h / 2)
	}
end

---@return boolean
function Entity:isInsideScreen()
	return self:collide({
		x = main_camera.x + self.w,
		y = main_camera.y + self.h,
		w = SCREEN_SIZE - flr(self.w*2),
		h = SCREEN_SIZE - flr(self.h*2)
	})
end