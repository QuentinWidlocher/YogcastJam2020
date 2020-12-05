function update_bgParticles()
    --printh("updating particles")
    --for _,particle in pairs(bgParticles) do
    --    printh(particle.x .. " " .. particle.speed)
    --end

    if rnd(5) <= 1 then
        local particle = BgParticle:new({
            x = rnd(SCREEN_SIZE - fromOct(1)),
            speed = rnd(0.5) + 1
        })
        particle:init()
        add(bgParticles, particle)
    end

    --!!implement sorting bgparticles by speed here (faster ones should be drawn after slow ones for illusion of parallax)!!
    --nevermind
    --table.sort(bgParticles, function (a,b) return b.speed - a.speed end)

    for _,particle in pairs(bgParticles) do
        particle:update()
        if particle.lifetime == 0 then del(bgParticles, particle) end
    end
end