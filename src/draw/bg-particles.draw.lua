function draw_bgParticles()
    for _,particle in pairs(bgParticles) do
        particle:draw()
    end
end