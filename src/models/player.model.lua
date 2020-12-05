---@class Player : GameObject
---@field public maxSpeed number
---@field public friction number
---@field public vx number
---@field public vy number
---@field public hp Gauge
---@field public hurtCooldown Gauge
Player = GameObject:new({
    top_left_sprite = 1,
    speed = 2,
    w = fromOct(1),
    h = fromOct(1),

    movingx = false,
    movingy = false,

    maxSpeed = 4,
    friction = 2,
    vx = 0,
    vy = 0,

    hp = { value = 100, max = 100 }, -- can be damaged when value == max
    hurtCooldown = { value = 20, max = 20 },

    shootingCooldown = { value = 0, max = 8 } -- can shoot when value == max
})

function Player:update()
    self:getInput()
    self:move()
    self:shoot()

    self.hurtCooldown.value = min(self.hurtCooldown.value + 1, self.hurtCooldown.max)
end

function Player:getInput()
    self.ax = 0
    self.ay = 0
    self.movingx = false
    self.movingy = false
    if btn(GAMEPAD.UP) then
        self.ay -= 1
        self.movingy = true
    end
    if btn(GAMEPAD.DOWN) then
        self.ay += 1
        self.movingy = true
    end
    if btn(GAMEPAD.LEFT) then
        self.ax -= 1
        self.movingx = true
    end
    if btn(GAMEPAD.RIGHT) then
        self.ax += 1
        self.movingx = true
    end
end

function Player:shoot()
    self.shootingCooldown.value = min(self.shootingCooldown.value + 1, self.shootingCooldown.max)

    if (btn(GAMEPAD.X)) and self.shootingCooldown.value == self.shootingCooldown.max then

        -- add the bullet to the pool so it'll be drawn and updated
        local newBullet = Bullet:new({
            x = (self.x + (self.w/2) ) - (Bullet.w/2),
            y = self.y - (Bullet.h),
            playerVersion = true,
            -- lifespan = self.shootingCooldown.max * 10,
            speed = 2,
            dir = {
                x = (self.vx / self.speed)/4,
                y = -1,
            }
        })
        newBullet:init()
        add(bulletPool, newBullet)

        self.shootingCooldown.value = 0
    end
end

function Player:move()
    --Acceleration
    self.vx += self.ax * self.speed
    self.vy += self.ay * self.speed

    --Velocity
    self.vx = clamp(self.vx, -self.maxSpeed, self.maxSpeed)
    self.vy = clamp(self.vy, -self.maxSpeed, self.maxSpeed)

    --Slow down if not pressing anything
    if not self.movingx and self.vx != 0 then
        self.vx -= sgn(self.vx) * self.friction
        --Setting the velocity to 0 if it's as close as it can get to zero, to ensure the value doesn't fluctuate
        if abs(self.vx) <= self.friction / 2 then self.vx = 0 end
    end
    if not self.movingy and self.vy != 0 then
        self.vy -= sgn(self.vy) * self.friction
        --Setting the velocity to 0 if it's as close as it can get to zero, to ensure the value doesn't fluctuate
        if abs(self.vy) <= self.friction / 2 then self.vy = 0 end
    end

    --Applying velocity
    self.x += self.vx
    self.y += self.vy

    --Ensuring the player doesn't go off screen
    self.x = clamp(player.x, 0, SCREEN_SIZE - self.w)
    self.y = clamp(player.y, 0, SCREEN_SIZE - self.h)
end

function Player:hurt(dmg)
    if (self.hurtCooldown.value == self.hurtCooldown.max) then
        shake = 0.2
        sfx(0)
        self.hp.value = self.hp.value  - dmg
        self.hurtCooldown.value = 0
    end
end