---@type Bullet[]
bulletPool = {}

getEnemiesBulletPool = function ()
    return M.filter(bulletPool, function (b) return not b.playerVersion end)
end

getPlyaerBulletPool = function ()
    return M.filter(bulletPool, function (b) return b.playerVersion end)
end

function init_bullets()
    foreach(bulletPool, function (bullet) bullet:init() end)
end