---@param draw boolean
function draw_debug(draw)

    if (not draw) then return end

    local debug = {
        {label = "mem", value = ceil((stat(0)/2048)*100).."%"},
        {label = "cpu", value = ceil(stat(1)*100).."%"},
        {label = "state", value = STATE},
    }
    for i = 1, #debug do
        local dbg = debug[i]
        write(dbg.label..":"..dbg.value, main_camera.x+1, main_camera.y + (SCREEN_SIZE - 8*i), 0,7)
    end 
end