function draw_bullets()
    foreach(bulletPool, function (bullet) bullet:draw() end)
end