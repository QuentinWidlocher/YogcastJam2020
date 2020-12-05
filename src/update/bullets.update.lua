function update_bullets()
    local bulletsToDelete = {}

    for i, bullet in pairs(bulletPool) do
        bullet:update()

        if (not bullet.playerVersion and bullet:collide(player)) then
            player:hurt(bullet.dmg)
            add(bulletsToDelete, i)
        end

        if (bullet.playerVersion) then
            local bulletCollide = function (enemy) return bullet:collide(enemy) end
            local hittenEnemies = M.filter(enemies, bulletCollide)
            if (#hittenEnemies > 0) then
                hittenEnemies[1]:hurt(player.dmg)
                add(bulletsToDelete, i)
            end
        end

        if (bullet.life <= 0) then 
            add(bulletsToDelete, i)
        end
    end

    local function deleteBullet(i) deli(bulletPool, i) end
    foreach(bulletsToDelete, deleteBullet)
end