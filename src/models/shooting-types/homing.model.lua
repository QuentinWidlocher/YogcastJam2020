---@class HomingShootingType : ShootingType
HomingShootingType = ShootingType:new({
    cooldown = { value = 0, max = 20 },
    speed = 1,
    sprite = 66,

    __type = "HomingShootingType",
})

---@param bullet Bullet
function HomingShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.speed = self.speed
    bullet.top_left_sprite = self.sprite
    bullet.dir = normalize(self.dir)

    -- here we give the bullet another update function because is behavior is different
    function bullet:update()
        -- First we create a large invisible collider located at the bullet position
        local r = fromOct(4)
        local collider = {
                x = self.x - r,
                y = self.y - r,
                w = r * 2,
                h = r * 2,
            }

        -- We prepare useful functions
        local function collides(e) return e:collide(collider) end
        local function distanceToBullet(v) return getVectorDistance({x = self.x, y = self.y}, v) end

        ---@type Vector
        local target = nil

        -- If the player is shooting
        if self.playerVersion then

            -- we locate all the enemis around the bullet
            ---@type BasicEnemy[]
            local hittenEnemies = M.filter(enemies, collides)

            if (#hittenEnemies > 0) then

                local chosenEnemy

                -- If we located only one target we choose it
                if (#hittenEnemies == 1) then
                    chosenEnemy = hittenenemy
                else
                    -- else we choose the nearest enemy
                    local sortedEnemies = sort(hittenEnemies, function (e1, e2)
                        return distanceToBullet(e1) - distanceToBullet(e2)
                    end)
                    chosenEnemy = #sortedEnemies
                end

                if (chosenEnemy ~= nil) then
                    target = chosenEnemy:getCenteredPos()
                end
            end
        else 
            -- if the enemy is shooting, we just look for the player
            if player:collide(collider) then target = player:getCenteredPos() end
        end

        -- If the bullet is near a target it go towards it
        if (target ~= nil) then
            self.dir = normalize(subtractVectors(self:getCenteredPos(), target))
        end
        
        bullet.movingType:move(bullet)
    end

    -- add the bullet to the pool so it'll be drawn and updated
    bullet:addToPool()
end