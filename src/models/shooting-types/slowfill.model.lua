SlowfillShootingType = ShootingType:new({
    cooldown = { value = 0, max = 20 },
    __type = "SlowfillShootingType",
    sprite = 84
})


function SlowfillShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.top_left_sprite = self.sprite
    bullet.dir = { x = 0, y = 0.2 }

    -- add the bullet to the pool so it'll be drawn and updated
    bullet:addToPool()
end