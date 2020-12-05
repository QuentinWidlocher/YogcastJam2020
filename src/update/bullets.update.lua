function update_bullets()
    for i, bullet in pairs(bulletPool) do
        bullet:update()

        local function deleteBullet(i) deli(bulletPool, i) end

        if (not bullet.playerVersion and bullet:collide(player)) then
            player:hurt(bullet.dmg)
            deleteBullet(i)
        end

        if (bullet.playerVersion) then
            local bulletCollide = function (enemy) return bullet:collide(enemy) end
            local hittenEnemies = M.filter(enemies, bulletCollide)
            if (#hittenEnemies > 0) then
                hittenEnemies[1]:hurt(player.dmg)
                deleteBullet(i)
            end
        end

        if (bullet.life >= bullet.lifetime) then 
            deleteBullet(i)
        end
    end
end