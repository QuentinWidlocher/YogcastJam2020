levelIndex = 0
levels = {
    {
        player = function ()
            return Player:new({
            x = SCREEN_SIZE/2 - 4,
            y = SCREEN_SIZE/2 - 4,
            shootingType = DefaultShootingType:new(),
            movingType = DefaultPlayerMovingType:new(),
        })
        end,
        music = MUSIC.MISSION,
        dialogue = {
                "YOU: man, aimlessly floating around in space sure is great",
                "YOU: oh my goodness would you look at that, it's christmas",
                "YOU: i should go celebrate with my friends or something",
                "?: not so fast!",
                "YOU: who're you?",
                "?: i'm the interstellar parking inspector, and you've been parked here for way too long!",
                "YOU: man how am i going to afford any presents now?",
                "POPO: not my problem hombre",
                "YOU: i was literally just floating through space and time",
                "POPO: doesn't change the fact that you're about to get a ridiculously high fine",
                "YOU: and that doesn't change the fact that you're about to get shot",
                "POPO: is that so? enjoy the few remaining seconds of your life, criminal scum!",
            },
        enemy = function ()
            return BasicEnemy:new({
            top_left_sprite = 64,
            hurtSprite = 72,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE/2 - fromOct(1),
            y = (SCREEN_SIZE/4),
            movingType = DefaultEnemyMovingType:new(),
            phases = {
                {shootingType = DefaultShootingType:new(), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 50, damage = 20},
                {shootingType = DefaultShootingType:new(), bulletCooldown = 10, bulletSpeed = 2, hpMax = 50, damage = 20},
                {shootingType = HomingShootingType:new(), bulletCooldown = 15, bulletSpeed = 1, hpMax = 50, damage = 10},
                {shootingType = TrishotShootingType:new(), bulletCooldown = 10, bulletSpeed = 4, hpMax = 50, damage = 10},
            }
        })
        end
    },
    {
        player = function ()
            return Player:new({
            x = SCREEN_SIZE/2,
            y = SCREEN_SIZE/2,
            shootingType = DefaultShootingType:new(),
            movingType = GridPlayerMovingType:new(),
        })
        end,
        music = MUSIC.HIJINX,
        dialogue = {
            "?: greetings mortal.",
            "YOU: aww cmon, what is it now?",
            "?: it is i, the omnipotent floating space eye cube.",
            "YOU: ok?",
            "EYE: my eye has sensed that you have violated interstellar parking laws.",
            "YOU: really now",
            "EYE: it is my obligation to maintain order in this universe, and you are making my job a real pain in the ass.",
            "YOU: that's one lame job",
            "EYE: not as lame as your mother. ha-ha.",
            "YOU: was that... a joke?",
            "EYE: i have been practicing.",
            "YOU: how about you practice dying instead",
            "EYE: you wish to fight? very well. you may notice you can only move in a grid now.",
            "YOU: man, i just got used to flying normally",
            "EYE: this is pretty \"surprising\", wouldn't you agree?",
            "YOU: what are you even talking about?",
            "EYE: never mind. let the fight commence!"
        },
        enemy = function ()
            return BasicEnemy:new({
            top_left_sprite = 96,
            hurtSprite = 104,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE / 2,
            y = SCREEN_SIZE / 4,
            movingType = DefaultEnemyMovingType:new(),
            phases = {
                {shootingType = DefaultShootingType:new(), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 50, damage = 10},
                {shootingType = BrokenTentacleShootingType:new(), bulletCooldown = 2, bulletSpeed = 3, hpMax = 40, damage = 5},
                {shootingType = SlowfillShootingType:new(), bulletCooldown = 20, bulletSpeed = 0.02, hpMax = 70, damage = 10},
                {shootingType = TrishotShootingType:new(), bulletCooldown = 15, bulletSpeed = 4, hpMax = 50, damage = 20},
            }
        })
        end
    },
    {
        player = function ()
            Player:new({
            x = SCREEN_SIZE/2,
            y = SCREEN_SIZE/2,
            shootingType = SuperhotShootingType:new(),
            movingType = SuperhotPlayerMovingType:new(),
        })
        end,
        music = MUSIC.OUT_OF_CONTROL,
        dialogue = {
            "?: hello there.",
            "YOU: what the heck",
            "?: i'm time itself. i've had to step in because it seems like you've erased my best friend, floaty space cube.",
            "YOU: you were friends with that thing?",
            "TIME: it's a great guy when you get to know it.",
            "TIME: anyway, i'm not going to forgive you for what you did. you shall meet the same fate as my friend.",
            "TIME: to give you the slightest chance to win, time only moves when you do.",
            "TIME: quite a \"surprise\", no?",
            "YOU: why does everybody keep bringing that up?",
            "TIME: fear not, it won't matter once you're dead. goodbye."
        },
        enemy = function ()
            BasicEnemy:new({
            top_left_sprite = 98,
            hurtSprite = 106,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE / 2,
            y = SCREEN_SIZE / 4,
            movingType = SuperhotEnemyMovingType:new(),
            phases = {
                {shootingType = SuperhotShootingType:new({ baseShootingType = TrishotShootingType:new()}), bulletCooldown = 8, bulletSpeed = 4, hpMax = 40, damage = 10},
                {shootingType = SuperhotShootingType:new({ baseShootingType = BulletstreamShootingType:new()}), bulletCooldown = 15, bulletSpeed = 1, hpMax = 40, damage = 5},
                {shootingType = SuperhotShootingType:new({ baseShootingType = BrokenTentacleShootingType:new()}), bulletCooldown = 1, bulletSpeed = 7, hpMax = 40, damage = 10},
                {shootingType = SuperhotShootingType:new({ baseShootingType = DefaultShootingType:new()}), bulletCooldown = 3, bulletSpeed = 3, hpMax = 30, damage = 5},
            }
        })
        end
    }
}

function currentLevel() return levels[levelIndex] end

function nextLevel()
    levelIndex = levelIndex + 1
    player = currentLevel().player()
    enemy = currentLevel().enemy()
    enemy:init()
    music(currentLevel().music)

    change_state(GAME_STATES.DIALOGUE)

    for i,text in ipairs(currentLevel().dialogue) do
        dtb_disp(text, function ()
            if i >= #currentLevel().dialogue then
                change_state(GAME_STATES.GAME)
            end
        end)        
    end
end