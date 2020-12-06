---@param draw boolean
function draw_debug(draw)

    if (not draw) then return end

    local debug = {
        {label = "mem", value = ceil((stat(0)/2048)*100).."%"},
        {label = "cpu", value = ceil(stat(1)*100).."%"},
        -- {label = "state", value = STATE},
        -- {label = "player hp", value = player.hp.value.."/"..player.hp.max},
        {label = "bullets", value = #bulletPool},
        -- {label = "cd", value = enemy.shootingType.cooldown.value.."/"..enemy.shootingType.cooldown.max},
        -- {label = "time", value = SuperhotModifier.timeMod},
    }
    for i = 1, #debug do
        local dbg = debug[i]
        write(dbg.label..":"..dbg.value, main_camera.x+1, main_camera.y + (SCREEN_SIZE - 8*i), 0,7)
    end 

    local x = player:getHitBox()
    rect(x.x, x.y, x.x + x.w, x.y + x.h, 11)
end