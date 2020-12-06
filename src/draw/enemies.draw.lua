function draw_enemies()
    if enemy.hurtCooldown.value < enemy.hurtCooldown.max then
        local origSprite = enemy.top_left_sprite
        enemy.top_left_sprite = enemy.hurtSprite
        enemy:draw() 
        enemy.top_left_sprite = origSprite
    else
        enemy:draw() 
    end
end