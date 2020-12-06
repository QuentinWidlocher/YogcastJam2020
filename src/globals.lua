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
    PLAYER = {
        STILL = 1,
        LEAN_LEFT = 2,
        LEAN_RIGHT = 3,
        BULLET = 17,
    },
    FLAMES = {
        ON = 4,
        OFF = 5
    },
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
    PLAYER_DMG = 9,
    ENEMY_DMG = 10,
    PLAYER_BULLET = 11,
}

MUSIC = {
    ARPUMENT = 0,
    MISSION = 11,
    HIJINX = 17,
    OUT_OF_CONTROL = 27,
}

STATES = {
    NORMAL = 0,
    DIALOGUE = 1,
}