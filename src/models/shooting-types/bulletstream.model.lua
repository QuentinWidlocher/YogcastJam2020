---@class BulletstreamShootingType : ShootingType
BulletstreamShootingType = ShootingType:new({
    cooldown = { value = 0, max = 40 },
    speed = 2.5,
    sprite = 68,

    __type = "BulletstreamShootingType",
})

---@param bullet Bullet
function BulletstreamShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.speed = self.speed
    bullet.top_left_sprite = self.sprite
    bullet.dir = normalize(self.dir)
    
    for i=1,4 do
        local bulletCopy = shallowCopy(bullet)
        bulletCopy.speed = i * (2.5/4)
        bulletCopy:addToPool()
    end
end
