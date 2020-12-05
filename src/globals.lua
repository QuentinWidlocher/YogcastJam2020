-- Global variables

function init_globals()
end

-- Constants

SCREEN_SIZE = 128
SPRITE_SIZE = 8
GAMEPAD = {
    UP = 2,
    DOWN = 3,
    LEFT = 0,
    RIGHT = 1,
    O = 4,
    X = 5,
    START = 6
}
SPRITES = {
    BG_STAR = 247,
    BG_BIG_STAR = 248,
    BG_BIGS = {
        249,
        250,
        251,
        252,
        253,
        254,
        255
    }
}

SFX = {
    PLAYER_DMG = 0,
    ENEMY_DMG = 1,
    PLAYER_BULLET = 2,
}