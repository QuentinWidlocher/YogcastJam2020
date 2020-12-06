BrokenTentacleShootingType = ShootingType:new({
    cooldown = { value = 0, max = 20 },
    __type = "BrokenTentacleShootingType",
    sprite = 82
})


btCounter = 0
function BrokenTentacleShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.top_left_sprite = self.sprite
    bullet.dir = normalize(self.dir)

    -- add the bullet to the pool so it'll be drawn and updated
    if btCounter % 20 < 15 then bullet:addToPool() end
    btCounter += 1
end