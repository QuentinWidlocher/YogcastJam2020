-- Init Game

function _init()
    cls() -- clear the screen
    dtb_init(3)

    music(MUSIC.ARPUMENT)

    init_globals()
    init_camera()
    init_player()
    init_enemies()
    init_bg_particles()
    init_bullets()
end