Player = GameObject:new()

function Player:new(o,p)
    o = o or Entity:new()
        setmetatable(o, self)
    self.__index = self
    self.__type = 'Player'
    self.sprite = 1

    self.x = SCREEN_SIZE / 2
    self.y = SCREEN_SIZE / 2
    self.vx = 0
    self.vy = 0
    self.speed = 4

    return o
end

function init_player()
    player = Player:new()
end