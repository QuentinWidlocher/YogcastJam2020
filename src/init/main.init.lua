-- Init Game

function _init()
    cls() -- clear the screen
    printh("", "log.txt", true) -- clear the log file
    dtb_init(3)
    nextLevel()
    init_globals()
    init_camera()
    init_player()
    init_enemies()
    init_bg_particles()
    init_bullets()
end