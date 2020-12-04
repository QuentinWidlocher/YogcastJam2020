-- Init Game

function _init()
    cls() -- clear the screen
    printh("", "log.txt", true) -- clear the log file
    init_globals()
    init_camera()
end