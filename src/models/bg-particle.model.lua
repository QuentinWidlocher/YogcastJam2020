BgParticle = GameObject:new({
    w = fromOct(1),
    h = fromOct(1),
    top_left_sprite = SPRITES.BG_STAR,
    lifetime = 600,
    y = -fromOct(1)
})

function BgParticle:init()
    if rnd(10) <= 1 then self.top_left_sprite = SPRITES.BG_BIG_STAR end
    if rnd(50) <= 1 then self.top_left_sprite = SPRITES.BG_BIGS[flr(rnd(#SPRITES.BG_BIGS + 1))] end
end

function BgParticle:update()
    self.y += self.speed
    self.lifetime -= 1
end

