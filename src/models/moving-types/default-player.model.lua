---@class DefaultPlayerMovingType : MovingType
DefaultPlayerMovingType = MovingType:new({
    __type = "DefaultPlayerMovingType",
})

function DefaultPlayerMovingType:move(player)

    --Acceleration
    player.vx = player.vx + player.ax * player.speed
    player.vy = player.vy + player.ay * player.speed

    --Velocity
    player.vx = clamp(player.vx, -player.maxSpeed, player.maxSpeed)
    player.vy = clamp(player.vy, -player.maxSpeed, player.maxSpeed)

    local function calculatePlayerVelocity(moving, velocity)
        if not moving and velocity ~= 0 then
            velocity = velocity - sgn(velocity) * player.friction

            --Setting the velocity to 0 if it's as close as it can get to zero, to ensure the value doesn't fluctuate
            if abs(velocity) <= player.friction / 2 then velocity = 0 end
        end
        return velocity
    end

    --Slow down if not pressing anything
    player.vx = calculatePlayerVelocity(player.movingx, player.vx)
    player.vy = calculatePlayerVelocity(player.movingy, player.vy)

    if player.vx < 0 then player.top_left_sprite = SPRITES.PLAYER.LEAN_LEFT
    elseif player.vx > 0 then player.top_left_sprite = SPRITES.PLAYER.LEAN_RIGHT
    else player.top_left_sprite = SPRITES.PLAYER.STILL end

    --Applying velocity
    player.x = player.x + player.vx
    player.y = player.y + player.vy

    --Ensuring the player doesn't go off screen
    player.x = clamp(player.x, 0, SCREEN_SIZE - player.w)
    player.y = clamp(player.y, 0, SCREEN_SIZE - player.h)
end