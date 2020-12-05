pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

#include src/globals.lua
#include src/states.lua
#include src/helpers.lua

#include src/models/entity.model.lua
#include src/models/game-object.model.lua
#include src/models/bullet.model.lua
#include src/models/player.model.lua
#include src/models/basic-enemy.model.lua
#include src/models/camera.model.lua

#include src/init/camera.init.lua
#include src/init/player.init.lua
#include src/init/bullets.init.lua
#include src/init/enemies.init.lua
#include src/init/main.init.lua
#include src/init/player.init.lua

#include src/update/camera.update.lua
#include src/update/player.update.lua
#include src/update/bullets.update.lua
#include src/update/enemies.update.lua
#include src/update/main.update.lua

#include src/draw/debug.draw.lua
#include src/draw/player.draw.lua
#include src/draw/enemies.draw.lua
#include src/draw/bullets.draw.lua
#include src/draw/main.draw.lua
#include src/draw/player.draw.lua

__gfx__
00000000800770080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700770070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700770070008800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000770770770087880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000770770770088780000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000677667760008800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000266666620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000d00dd00d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00800000000008000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0800000000000080007c770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08000000000000800077c70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80000000000000080007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00800000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000200002e650006002d65019650136201362015650196501d6502065023650246502465023640206401e6401d6401c6401a640186401564013640106300d6300962007610056000060001600006001650016500
000100003a150341502e15028150211501a15015150201502115021150187000765008650096500965009650096500965009650096500965009650267002b200297002d20034d002f2000e700137003120011700
00010000064500a4500d4501345015450114500845003450012000120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
