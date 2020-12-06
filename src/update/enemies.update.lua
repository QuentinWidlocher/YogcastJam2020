function update_enemies()
    enemy:update()
    if (enemy.phase <= 0) then
        level = level + 1
    end
end