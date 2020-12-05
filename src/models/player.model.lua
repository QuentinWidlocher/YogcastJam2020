---@class Player : GameObject
Player = GameObject:new({
    top_left_sprite = 1,
    speed = 2,
    w = fromOct(1),
    h = fromOct(1),
    max_speed = 4,
    friction = 2,
    vx = 0,
    vy = 0
})

function Player:update()
    self:getInput()
    self:move()
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

function Player:move()
    --Acceleration
    self.vx += self.ax * self.speed
    self.vy += self.ay * self.speed

    --Velocity
    self.vx = clamp(self.vx, -self.max_speed, self.max_speed)
    self.vy = clamp(self.vy, -self.max_speed, self.max_speed)

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