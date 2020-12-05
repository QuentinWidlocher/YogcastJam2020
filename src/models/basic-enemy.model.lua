---@class BasicEnemy : GameObject
---@field public speed number
---@field public dir Vector
---@field public hp Gauge
---@field public movingCooldown Gauge
---@field public shootingType.cooldown Gauge
---@field public bulletPool Bullet[]
---@field public shootingType DefaultShootingType
BasicEnemy = GameObject:new({
    speed = 1,
    dir = getRandomDirection(),
    hp = { value = 100, max = 100 },
    movingCooldown = { value = 0, max = 10 },
    hurtCooldown = { value = 0, max = 5 },
    shootingType = shallowCopy(DefaultShootingType),
    movingType = shallowCopy(DefaultEnemyMovingType),
    phase = 5,
    __type = "BasicEnemy",
})

function BasicEnemy:update()
    self:shoot()
    self:move()

    self.hurtCooldown.value = min(self.hurtCooldown.value + 1, self.hurtCooldown.max)
end

function BasicEnemy:init()
end

function BasicEnemy:shoot()
    self.shootingType.cooldown.value = self.shootingType.cooldown.value + 1

    if self.shootingType.cooldown.value >= self.shootingType.cooldown.max then
        local pos = self:getCenteredPos()
        local targetPos = player:getCenteredPos()

        self.shootingType.from = pos
        self.shootingType.dir = subtractVectors(pos, targetPos)

        local bullet = Bullet:new({ playerVersion = false })
        bullet:init()

        self.shootingType:shoot(bullet)

        -- reset the cooldown
        self.shootingType.cooldown.value = 0
    end
end

function BasicEnemy:move() 
    self.movingType:move(self)
end

function BasicEnemy:hurt(dmg)
    shake = 0.1
    sfx(SFX.ENEMY_DMG)
    
    self.hp.value = self.hp.value  - dmg
    self.hurtCooldown.value = 0

    if self.hp.value <= 0 then
        self.phase = self.phase - 1
        self.hp.value = self.hp.max
        shake = 1.5
    end
end

---@return boolean
function BasicEnemy:isInsideAllowedZone()
	return self:collide({
		x = main_camera.x + (self.w*2),
		y = main_camera.y + self.h,
		w = SCREEN_SIZE - (self.w*4),
		h = SCREEN_SIZE/2 - self.h
	})
end