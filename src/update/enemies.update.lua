function update_enemies()
    for i, enemy in pairs(enemies) do
        enemy:update()

        if (enemy.hp.value <= 0) then
            deli(enemies, i)
        end
    end
end