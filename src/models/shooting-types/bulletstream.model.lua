---@class BulletstreamShootingType : ShootingType
BulletstreamShootingType = shallowCopy(ShootingType)
BulletstreamShootingType.cooldown = { value = 0, max = 40 }
BulletstreamShootingType.speed = 2.5
BulletstreamShootingType.sprite = 68

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
        add(bulletPool, bulletCopy)
    end
end
