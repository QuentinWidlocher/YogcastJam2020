---@class GameObject : Entity
---@field public top_left_sprite integer
GameObject = Entity:new({
    top_left_sprite = 0,
    __type = 'GameObject'
})

function GameObject:draw()    
    -- if the sprite is only 1*1, we use spr()
    if self.h == fromOct(1) and self.w == fromOct(1) then
        spr(self.top_left_sprite, self.x, self.y)
    else
        local pos = getSpriteCoord(self.top_left_sprite)
        sspr(
            fromOct(pos.x),
            fromOct(pos.y),
            self.w,
            self.h,
            self.x,
            self.y
        )
    end
end