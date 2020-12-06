function update_bullets()

    for i, bullet in ipairs(bulletPool) do
        bullet:update()

        if (not bullet.playerVersion and bullet:collide(player:getHitBox())) then
            player:hurt(bullet.dmg)
            deli(bulletPool, i)
        end

        if (bullet.playerVersion and bullet:collide(enemy)) then
            enemy:hurt(bullet.dmg)
            deli(bulletPool, i)
        end

        if not bullet:isInsideScreen() then
          deli(bulletPool, i)
        end
    end

    bulletClearIfTimeout()
end

bulletTimeout = 60

function bulletClearIfTimeout()
    if bulletTimeout > 0 then
        bulletPool = {}
    end
    bulletTimeout = bulletTimeout - 1
end