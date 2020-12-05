function draw_enemies()
    foreach(enemies, function (enemy) enemy:draw() end)
end