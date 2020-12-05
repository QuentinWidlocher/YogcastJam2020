---@type BasicEnemy[]
enemies = {}

function init_enemies()
    enemy = BasicEnemy:new({
        top_left_sprite = 64,
        w = fromOct(2),
        h = fromOct(2),
        x = SCREEN_SIZE / 2,
        y = SCREEN_SIZE / 4,
    })

    add(enemies, enemy)

    foreach(enemies, function (enemy) enemy:init() end)
end