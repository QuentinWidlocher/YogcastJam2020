---@class HomingShootingType : ShootingType
---@field public from Vector
---@field public dir Vector
HomingShootingType = shallowCopy(ShootingType)

---@param bullet Bullet
function HomingShootingType:shoot(bullet)
    bullet.x = self.from.x
    bullet.y = self.from.y
    bullet.dir = normalize(self.dir)

    function bullet:update()
        local r = fromOct(4)
        local collider = {
                x = self.x - r,
                y = self.y - r,
                w = r * 2,
                h = r * 2,
            }
        local function collides(e) return e:collide(collider) end
        local function distanceToBullet(v) return getVectorDistance({x = self.x, y = self.y}, v) end

        ---@type Vector
        local target = nil

        if self.playerVersion then
            ---@type BasicEnemy[]
            local hittenEnemies = M.filter(enemies, collides)

            if (#hittenEnemies > 0) then

                local chosenEnemy

                if (#hittenEnemies == 1) then
                    chosenEnemy = hittenEnemies[1]
                else
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
            -- try to find the player around the bullet
            if player:collide(collider) then target = player:getCenteredPos() end
        end

        if (target ~= nil) then
            self.dir = normalize(subtractVectors(self:getCenteredPos(), target))
            log(vectorToString(self.dir))
        end

        self.x = self.x + (self.dir.x * self.speed)
        self.y = self.y + (self.dir.y * self.speed)
    end

    -- add the bullet to the pool so it'll be drawn and updated
    add(bulletPool, bullet)
end