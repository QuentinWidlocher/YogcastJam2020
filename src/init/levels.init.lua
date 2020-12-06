levelIndex = 0
levels = {
    {
        player = Player:new({
            x = SCREEN_SIZE/2,
            y = SCREEN_SIZE/2,
            shootingType = DefaultShootingType:new(),
            movingType = DefaultPlayerMovingType:new(),
        }),
        enemy = BasicEnemy:new({
            top_left_sprite = 64,
            hurtSprite = 72,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE / 2,
            y = SCREEN_SIZE / 4,
            movingType = DefaultEnemyMovingType:new(),
            dialogue = {
                "man, aimlessly floating around in space sure is great",
                "oh my goodness would you look at that, it's christmas",
                "i should go celebrate with my friends or something",
                "not so fast!",
                "who're you?",
                "i'm the interstellar parking inspector, and you've been parked here for way too long!",
                "man how am i going to afford any presents now?",
                "not my problem hombre",
                "i was literally just floating through space and time",
                "doesn't change the fact that you're about to get a ridiculously high fine",
                "and that doesn't change the fact that you're about to get shot",
                "is that so? enjoy the few remaining seconds of your life, criminal scum!",
            },
            phases = {
                {shootingType = DefaultShootingType:new(), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 70, damage = 10},
                {shootingType = DefaultShootingType:new(), bulletCooldown = 10, bulletSpeed = 2, hpMax = 60, damage = 10},
                {shootingType = HomingShootingType:new(), bulletCooldown = 15, bulletSpeed = 1, hpMax = 50, damage = 10},
                {shootingType = TrishotShootingType:new(), bulletCooldown = 6, bulletSpeed = 4, hpMax = 50, damage = 10},
            }
        })
    },
    {
        player = Player:new({
            x = SCREEN_SIZE/2,
            y = SCREEN_SIZE/2,
            shootingType = DefaultShootingType:new(),
            movingType = GridPlayerMovingType:new(),
        }),
        enemy = BasicEnemy:new({
            top_left_sprite = 96,
            hurtSprite = 104,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE / 2,
            y = SCREEN_SIZE / 4,
            movingType = DefaultEnemyMovingType:new(),
            dialogue = {
                "greetings mortal.",
                "aww cmon, what is it now?",
                "it is i, the omnipotent floating space eye cube.",
                "ok?",
                "my eye has sensed that you have violated interstellar parking laws.",
                "really now",
                "it is my obligation to maintain order in this universe, and you are making my job a real pain in the ass.",
                "that's one lame job",
                "not as lame as your mother. ha-ha.",
                "was that... a joke?",
                "i have been practicing.",
                "how about you practice dying instead",
                "you wish to fight? very well. you may notice you can only move in a grid now.",
                "man, i just got used to flying normally",
                "this is pretty \"surprising\", wouldn't you agree?",
                "what are you even talking about?",
                "never mind. let the fight commence!"
            },
            phases = {
                {shootingType = DefaultShootingType:new(), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 70, damage = 10},
                {shootingType = DefaultShootingType:new(), bulletCooldown = 10, bulletSpeed = 2, hpMax = 60, damage = 10},
                {shootingType = HomingShootingType:new(), bulletCooldown = 15, bulletSpeed = 1, hpMax = 50, damage = 10},
                {shootingType = TrishotShootingType:new(), bulletCooldown = 15, bulletSpeed = 4, hpMax = 50, damage = 10},
            }
        })
    },
    {
        player = Player:new({
            x = SCREEN_SIZE/2,
            y = SCREEN_SIZE/2,
            shootingType = SuperhotShootingType:new(),
            movingType = SuperhotPlayerMovingType:new(),
        }),
        enemy = BasicEnemy:new({
            top_left_sprite = 98,
            hurtSprite = 106,
            w = fromOct(2),
            h = fromOct(2),
            x = SCREEN_SIZE / 2,
            y = SCREEN_SIZE / 4,
            movingType = SuperhotEnemyMovingType:new(),
            dialogue = {
                "hello there.",
                "what the heck",
                "i'm time itself. i've had to step in because it seems like you've erased my best friend, floaty space cube.",
                "you were friends with that thing?",
                "it's a great guy when you get to know it.",
                "anyway, i'm not going to forgive you for what you did. you shall meet the same fate as my friend.",
                "to give you the slightest chance to win, time only moves when you do.",
                "quite a \"surprise\", no?",
                "why does everybody keep bringing that up?",
                "fear not, it won't matter once you're dead. goodbye."
            },
            phases = {
                {shootingType = SuperhotShootingType:new({ baseShootingType = DefaultShootingType:new()}), bulletCooldown = 20, bulletSpeed = 1.5, hpMax = 70, damage = 10},
                {shootingType = SuperhotShootingType:new({ baseShootingType = DefaultShootingType:new()}), bulletCooldown = 10, bulletSpeed = 2, hpMax = 60, damage = 10},
                {shootingType = SuperhotShootingType:new({ baseShootingType = HomingShootingType:new()}), bulletCooldown = 15, bulletSpeed = 1, hpMax = 50, damage = 10},
                {shootingType = SuperhotShootingType:new({ baseShootingType = TrishotShootingType:new()}), bulletCooldown = 15, bulletSpeed = 4, hpMax = 50, damage = 10},
            }
        })
    }
}

function currentLevel() return levels[levelIndex] end

function nextLevel()
    levelIndex = levelIndex + 1
    player = currentLevel().player
    enemy = currentLevel().enemy
    enemy:init()
end