---@type Bullet[]
    bulletPool = {}

function init_bullets()
    foreach(bulletPool, function (bullet) bullet:init() end)
end