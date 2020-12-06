---@class Player : GameObject
---@field public maxSpeed number
---@field public friction number
---@field public vx number
---@field public vy number
---@field public hp Gauge
---@field public hurtCooldown Gauge
---@field public shootingType ShootingType
Player = GameObject:new({
    top_left_sprite = 1,
    origSpeed = 2,
    speed = 2,
    w = fromOct(1),
    h = fromOct(1),

    movingx = false,
    movingy = false,

    origMaxSpeed = 3,
    maxSpeed = 3,
    friction = 1,
    vx = 0,
    vy = 0,

    gridx = 8,
    gridy = 8,
    origx = fromOct(8),
    origy = fromOct(8),

    hp = { value = 100, max = 100 }, -- can be damaged when value == max
    hurtCooldown = { value = 20, max = 20 },

    dmg = 1,
    shootingCooldown = { value = 0, max = 4 }, -- can shoot when value == max
    shootingType = DefaultShootingType:new(),
    movingType = DefaultPlayerMovingType:new(),
    flameCounter = 0,
    flameSprite = SPRITES.FLAMES.OFF,

    __type = "Player",
})

function Player:update()
    self:getInput()
    self:move()
    self:shoot()
    self:updateFlames()

    self.hurtCooldown.value = min(self.hurtCooldown.value + 1, self.hurtCooldown.max)
end

function Player:getInput()
    self.ax = 0
    self.ay = 0
    self.movingx = false
    self.movingy = false
    if btn(GAMEPAD.UP) then
        self.ay = self.ay - 1
        self.movingy = true
    end
    if btn(GAMEPAD.DOWN) then
        self.ay = self.ay + 1
        self.movingy = true
    end
    if btn(GAMEPAD.LEFT) then
        self.ax = self.ax - 1
        self.movingx = true
    end
    if btn(GAMEPAD.RIGHT) then
        self.ax = self.ax + 1
        self.movingx = true
    end
end

function Player:shoot()
    self.shootingCooldown.value = min(self.shootingCooldown.value + self.shootingType.cooldownRate, self.shootingCooldown.max)

    if (btn(GAMEPAD.X)) and self.shootingCooldown.value == self.shootingCooldown.max then

        -- add the bullet to the pool so it'll be drawn and updated
        local newBullet = Bullet:new({
            playerVersion = true,
            speed = 10,
        })
        newBullet:init()

        -- from the cannon
        self.shootingType.from = {
            x = (self.x + (self.w/2) ) - (Bullet.w/2),
            y = self.y - (Bullet.h),
        }

        -- straight up but lean with the ship
        self.shootingType.dir = {
            x = (self.vx / self.speed)/4,
            y = -1,
        }
        
        self.shootingType:shoot(newBullet)

        sfx(SFX.PLAYER_BULLET)

        self.shootingCooldown.value = 0
    end
end

function Player:move()
    self.movingType:move(self)
end

function Player:hurt(dmg)
    if (self.hurtCooldown.value == self.hurtCooldown.max) then
        shake = 0.2
        sfx(SFX.PLAYER_DMG)
        self.hp.value = self.hp.value  - dmg
        self.hurtCooldown.value = 0
    end
end

function Player:updateFlames()
    self.flameCounter = self.flameCounter + 1
    if self.flameCounter % 4 < 2 then
        self.flameSprite = SPRITES.FLAMES.OFF
    else
        self.flameSprite = SPRITES.FLAMES.ON
    end
end

function Player:drawFlames()
    --Here begin the magic alignment numbers
    --Good luck!

    if self.top_left_sprite == SPRITES.PLAYER.STILL then
        spr(self.flameSprite, self.x - 1, self.y + self.h - 1)
        spr(self.flameSprite, self.x + self.w - 2, self.y + self.h - 1)
    elseif self.top_left_sprite == SPRITES.PLAYER.LEAN_LEFT then
        spr(self.flameSprite, self.x, self.y + self.h - 1)
        spr(self.flameSprite, self.x + self.w - 3, self.y + self.h - 2)
    else
        spr(self.flameSprite, self.x, self.y + self.h - 2)
        spr(self.flameSprite, self.x + self.w - 3, self.y + self.h - 1)
    end
end

function Player:getHitBox() 
	return {
        x = self.x + 2,
        y = self.y + 2,
        h = self.h - 5,
        w = self.w - 5,
    }
end

function Player:isMoving()
    return self.movingx or self.movingy
end