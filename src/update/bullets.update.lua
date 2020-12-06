function update_bullets()
    local bulletsToDelete = {}

    for i, bullet in pairs(bulletPool) do
        bullet:update()

        if (not bullet.playerVersion and bullet:collide(player:getHitBox())) then
            player:hurt(bullet.dmg)
            add(bulletsToDelete, i)
        end

        if (bullet.playerVersion and bullet:collide(enemy)) then
            enemy:hurt(bullet.dmg)
            add(bulletsToDelete, i)
        end

        if not bullet:isInsideScreen() then 
            add(bulletsToDelete, i)
        end
    end

    local function deleteBullet(i) deli(bulletPool, i) end
    foreach(bulletsToDelete, deleteBullet)

    bulletClearIfTimeout()
end

bulletTimeout = 60

function bulletClearIfTimeout()
    if bulletTimeout > 0 then
        for k in pairs(bulletPool) do
            bulletPool[k] = nil
        end
    end
    bulletTimeout = bulletTimeout - 1
end