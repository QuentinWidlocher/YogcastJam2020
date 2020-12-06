-- Init Game

function _init()
    cls() -- clear the screen
    printh("", "log.txt", true) -- clear the log file

    music(MUSIC.ARPUMENT)

    init_globals()
    init_camera()
    init_player()
    init_enemies()
    init_bg_particles()
    init_bullets()
end