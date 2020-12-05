function update_bullets()
    -- foreach(bulletPool, 
    -- function (bullet) 
    --     bullet:update()
    --     if (bullet.life >= bullet.lifeTime) then del(bulletPool, bullet) end
    -- end)

    for i, bullet in pairs(bulletPool) do
        bullet:update()

        if (bullet.life >= bullet.lifetime) then 
            deli(bulletPool, i)
        end
    end
end