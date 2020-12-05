bgParticles = {}

function init_bg_particles()
    for i = 1, 20 do
        local particle = BgParticle:new({
            x = rnd(SCREEN_SIZE - fromOct(1)),
            speed = rnd(0.5) + 1
        })
        particle.y = rnd(SCREEN_SIZE)
        particle:init()
        add(bgParticles, particle)
    end
end