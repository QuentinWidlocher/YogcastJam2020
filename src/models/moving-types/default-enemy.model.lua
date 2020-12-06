---@class DefaultEnemyMovingType : MovingType
DefaultEnemyMovingType = MovingType:new()

function DefaultEnemyMovingType:move(enemy)

    enemy.movingCooldown.value = enemy.movingCooldown.value + 1

    local function changeDirection()
        enemy.dir = getRandomDirection()
        enemy.movingCooldown.value = 0
    end

    -- change direction after cooldown
    if enemy.movingCooldown.value >= enemy.movingCooldown.max then
        changeDirection()
    end

    -- Reverse direction if going oustide the screen
    if not enemy:isInsideAllowedZone() then
        enemy.dir = M.map(enemy.dir, invert)
    end
    
    ---@type Vector
    local nextPos = { 
        x = enemy.x + (enemy.dir.x * enemy.speed),
        y = enemy.y + (enemy.dir.y * enemy.speed) 
    }

    -- move
    enemy.x = nextPos.x
    enemy.y = nextPos.y

end