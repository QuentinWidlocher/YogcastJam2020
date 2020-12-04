-- Camera Class

---@class Camera : Entity
---@field public speed number
---@field public margin number
Camera = Entity:new({
    speed = 1,
    margin = 0,
})

---@param object Entity
---@return boolean
function Camera:touch_top_margin(object)
    return object.y > self.y + (SCREEN_SIZE/2) + self.margin
end

---@param object Entity
---@return boolean
function Camera:touch_bottom_margin(object)
    return object.y < self.y + (SCREEN_SIZE/2) - self.margin
end

---@param dir Vector
function Camera:move(dir)
    self.x = self.x + dir.x
	self.y = self.y + dir.y
	camera(self.x,self.y)
end

main_camera = Camera:new()