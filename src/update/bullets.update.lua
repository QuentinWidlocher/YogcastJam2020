function update_bullets()
    local bulletsToDelete = {}

    for i, bullet in pairs(bulletPool) do
        bullet:update()

        if (not bullet.playerVersion and bullet:collide(player:getHitBox())) then
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

        if not bullet:isInsideScreen() then 
            add(bulletsToDelete, i)
        end
    end

    local function deleteBullet(i) deli(bulletPool, i) end
    foreach(bulletsToDelete, deleteBullet)

    bulletClearIfTimeout()
end

bulletTimeout = 0

function bulletClearIfTimeout()
    if bulletTimeout > 0 then
        for k in pairs(bulletPool) do
            bulletPool[k] = nil
        end
    end
    bulletTimeout -= 1
end