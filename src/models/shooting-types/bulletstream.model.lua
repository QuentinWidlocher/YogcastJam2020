BulletstreamShootingType = ShootingType

function BulletstreamShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.dir = normalize(self.dir)
    for i=1,5 do
        local bulletCopy = shallowCopy(bullet)
        bulletCopy.speed = i
        add(bulletPool, bulletCopy)
    end
end
