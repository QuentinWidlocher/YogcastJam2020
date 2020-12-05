--- Here are some useful object types
--- Don't include them in your project, they are meant to be used by a linter
--- so it can provide autocompletion and documentation

---@class Vector
---@field public x number
---@field public y number
local Vector = {
    x = 0,
    y = 0
}

---@class Gauge
---@field public value number
---@field public max number
local Gauge = { 
    value = 0, 
    max = 100
}