pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

#include src/globals.lua
#include src/states.lua
#include src/helpers.lua

#include src/models/entity.model.lua
#include src/models/game-object.model.lua

#include src/models/shooting-types/shooting-type.model.lua
#include src/models/shooting-types/trishot.model.lua
#include src/models/shooting-types/homing.model.lua
#include src/models/shooting-types/default.model.lua
#include src/models/shooting-types/trishot.model.lua
#include src/models/shooting-types/bulletstream.model.lua

#include src/models/moving-types/moving-type.model.lua
#include src/models/moving-types/default-player.model.lua
#include src/models/moving-types/default-enemy.model.lua
#include src/models/moving-types/grid-player.model.lua

#include src/models/bullet.model.lua
#include src/models/player.model.lua
#include src/models/basic-enemy.model.lua
#include src/models/camera.model.lua
#include src/models/bg-particle.model.lua

#include src/init/camera.init.lua
#include src/init/player.init.lua
#include src/init/bullets.init.lua
#include src/init/enemies.init.lua
#include src/init/main.init.lua
#include src/init/player.init.lua
#include src/init/bg-particles.init.lua

#include src/update/camera.update.lua
#include src/update/player.update.lua
#include src/update/bullets.update.lua
#include src/update/enemies.update.lua
#include src/update/main.update.lua
#include src/update/player.update.lua
#include src/update/bg-particles.update.lua

#include src/draw/debug.draw.lua
#include src/draw/player.draw.lua
#include src/draw/enemies.draw.lua
#include src/draw/bullets.draw.lua
#include src/draw/main.draw.lua
#include src/draw/player.draw.lua
#include src/draw/bg-particles.draw.lua
#include src/draw/bossbar.draw.lua

__gfx__
00000000000000000000008008000000090000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000008000000808000070070000809a9000008a80000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700770070707707007077070898000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700770070707707007077070080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700770070707677007767770080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000677667760766662002666670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002666666202ddd0d00d0ddd20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000d00dd00d0d000000000000d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
000000999900000000cccc000000000000000000000cc00000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000099aa99000000cccccc00008800006700070000c600000000000000000000000000000000000000000000000000000000000000000000000000088800000
000cc7677e7cc000cc6776cc008e780000600660000c700000000000000000000000000000000000000000000000000000000000000000000000000080000000
00c1c76c8e7c1c00cc7777cc00877800000c70000007700000000000000000000000000000000000000000000000000000000000000000000000000088088088
00c1c7c7787c1c00cc7777cc00877800000cc0000007700000000000000000000000000000000000000000000000000000000000000000000000000080080080
00c1c777777c1c00cc6776cc0087e800067006000007c00000000000000000000000000000000000000000000000000000000000000000000000000088880080
00cc11d11d11cc000cccccc000088000060006700006c00000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cc1d11d111cc0000cccc000000000000000000000cc00000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c1d11111111c0003333330000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c1111111111c0033bbbb3300a99000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc777777ccc003b7777b30a676900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc676676ccc003b7777b396777690000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc676676ccc003b7777b397447790000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc777777ccc003b7777b396747690000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa565656aaa0033bbbb3309646900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999656565999000333333000999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000bb0000000000000aa90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000bbbbbb0000000000a6469000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000bbbbbbbbbb0000000a67476900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bbbbbbbbbbbbbb00000977447900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b77bbbbbbbbbbb730000967776900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbb77bbbbbbb7b330000096769000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b1b1b77bbb7b33330770009990007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bb11b1b77b3333330092000400029000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b1671b1b333333330002226962220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b67171bb333333330000027772000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b31171bb333333330000022622000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bb37761b333333330000004940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bbb33bb333333300000022222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000bbbbb333330000000222022200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000bbb3330000000a092000290a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000b300000000009000000090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000099990000cc770000499900
0000000000000000000000000000000000000000000000000000000000000000000000000d00000000900000000070d200888270049999900cbcccc009994940
000000000000000000000000000000000000000000000000000000000007000000000000016d10000007700000022d200888882699994994cbbbcc7199999492
000000000000000000000000000000000000000000000000000000000000000000000700001d6d100007700000277d20088888709999994277bbc76194994994
000000000000000000000000000000000000000000000000000000000000000000007770001dd7d00000008000d762007888872049994420c667ccb399499994
000000000000000000000000000000000000000000000000000000000000000000000700000177600000000007d0d2006777622002442000ccccc65149994942
0000000000000000000000000000000000000000000000000000000000000000000000000000d600000040000dd2600000222200000000990cbbc11009949440
000000000000000000000000000000000000000000000000000000000000000000000000000000000d0000002220000000000000000000420013110000244200
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888ffffff882222228888888888888888888888888888888888888888888888888888888888888888228228888ff88ff888222822888888822888888228888
88888f8888f882888828888888888888888888888888888888888888888888888888888888888888882288822888ffffff888222822888882282888888222888
88888ffffff882888828888888888888888888888888888888888888888888888888888888888888882288822888f8ff8f888222888888228882888888288888
88888888888882888828888888888888888888888888888888888888888888888888888888888888882288822888ffffff888888222888228882888822288888
88888f8f8f88828888288888888888888888888888888888888888888888888888888888888888888822888228888ffff8888228222888882282888222288888
888888f8f8f8822222288888888888888888888888888888888888888888888888888888888888888882282288888f88f8888228222888888822888222888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000000000000000000000000000000000005555555
55555550000000000000999999990000000000000000cccccccc0000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000999999990000000000000000cccccccc0000000000000000000005555550000000000011111111112222222222333333333305555555
5555555000000000009999aaaa9999000000000000cccccccccccc00000000888800000005555550000000000011111111112222222222333333333305555555
5555555000000000009999aaaa9999000000000000cccccccccccc00000000888800000005555550000000000011111111112222222222333333333305555555
55555550000000cccc77667777ee77cccc000000cccc66777766cccc000088ee7788000005555550000000000011111111112222222222333333333305555555
55555550000000cccc77667777ee77cccc000000cccc66777766cccc000088ee7788000005555550000000000011111111112222222222333333333305555555
555555500000cc11cc7766cc88ee77cc11cc0000cccc77777777cccc000088777788000005555550000000000011111111112222222222333333333305555555
555555500000cc11cc7766cc88ee77cc11cc0000cccc77777777cccc000088777788000005555550000000000011111111112222222222333333333305555555
555555500000cc11cc77cc77778877cc11cc0000cccc77777777cccc000088777788000005555550000000000011111111112222222222333333333305555555
555555500000cc11cc77cc77778877cc11cc0000cccc77777777cccc000088777788000005555550444444444455555555556666666666777777777705555555
555555500000cc11cc777777777777cc11cc0000cccc66777766cccc00008877ee88000005555550444444444455555555556666666666777777777705555555
555555500000cc11cc777777777777cc11cc0000cccc66777766cccc00008877ee88000005555550444444444455555555556666666666777777777705555555
555555500000cccc1111dd1111dd1111cccc000000cccccccccccc00000000888800000005555550444444444455555555556666666666777777777705555555
555555500000cccc1111dd1111dd1111cccc000000cccccccccccc00000000888800000005555550444444444455555555556666666666777777777705555555
555555500000cccc11dd1111dd111111cccc00000000cccccccc0000000000000000000005555550444444444455555555556666666666777777777705555555
555555500000cccc11dd1111dd111111cccc00000000cccccccc0000000000000000000005555550444444444455555555556666666666777777777705555555
555555500000cc11dd1111111111111111cc00000033333333333300000000aa0000000005555550444444444455555555556666666666777777777705555555
555555500000cc11dd1111111111111111cc00000033333333333300000000aa0000000005555550444444444455555555577777777777777777777705555555
555555500000cc11111111111111111111cc00003333bbbbbbbb33330000aa9999000000055555508888888888999999999700000000007bbbbbbbbb05555555
555555500000cc11111111111111111111cc00003333bbbbbbbb33330000aa999900000005555550888888888899999999970aaaaaaaa07bbbbbbbbb05555555
555555500000cccccc777777777777cccccc000033bb77777777bb3300aa66776699000005555550888888888899999999970aaaaaaaa07bbbbbbbbb05555555
555555500000cccccc777777777777cccccc000033bb77777777bb3300aa66776699000005555550888888888899999999970aaaaaaaa07bbbbbbbbb05555555
555555500000cccccc667766667766cccccc000033bb77777777bb33996677777766990005555550888888888899999999970aaaaaaaa07bbbbbbbbb05555555
555555500000cccccc667766667766cccccc000033bb77777777bb33996677777766990005555550888888888899999999970aaaaaaaa07bbbbbbbbb05555555
555555500000cccccc667766667766cccccc000033bb77777777bb33997744447777990005555550888888888899999999970aaaaaaaa07bbbbbbbbb05555555
555555500000cccccc667766667766cccccc000033bb77777777bb33997744447777990005555550888888888899999999970aaaaaaaa07bbbbbbbbb05555555
555555500000cccccc777777777777cccccc000033bb77777777bb339966774477669900055555508888888888999999999700000000007bbbbbbbbb05555555
555555500000cccccc777777777777cccccc000033bb77777777bb33996677447766990005555550ccccccccccddddddddd777777777777fffffffff05555555
555555500000aaaaaa556655665566aaaaaa00003333bbbbbbbb3333009966446699000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
555555500000aaaaaa556655665566aaaaaa00003333bbbbbbbb3333009966446699000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000099999966556655665599999900000033333333333300000099999900000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000099999966556655665599999900000033333333333300000099999900000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
555555500000000000000077770000000000000000000000000000aaaa9900000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
555555500000000000000077770000000000000000000000000000aaaa9900000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
5555555000000000007777bbbb77770000000000000000000000aa66446699000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
5555555000000000007777bbbb77770000000000000000000000aa66446699000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
555555500000007777bbbbbbbbbbbb77770000000000000000aa6677447766990000000005555550000000000000000000000000000000000000000005555555
555555500000007777bbbbbbbbbbbb77770000000000000000aa6677447766990000000005555555555555555555555555555555555555555555555555555555
55555550007777bbbbbbbbbbbbbbbbbbbb7777000000000000997777444477990000000005555555555555555555555555555555555555555555555555555555
55555550007777bbbbbbbbbbbbbbbbbbbb7777000000000000997777444477990000000005555555555555555555555555555555555555555555555555555555
5555555077bbbbbbbbbbbbbbbbbbbbbbbbbbbb770000000000996677777766990000000005555550000000555556667655555555555555555555555555555555
5555555077bbbbbbbbbbbbbbbbbbbbbbbbbbbb770000000000996677777766990000000005555550000000555555666555555555555555555555555555555555
55555550777777bbbbbbbbbbbbbbbbbbbb7777bb000000000000996677669900000000000555555000000055555556dddddddddddddddddddddddd5555555555
55555550777777bbbbbbbbbbbbbbbbbbbb7777bb000000000000996677669900000000000555555000a0005555555655555555555555555555555d5555555555
5555555077bbbb7777bbbbbbbbbbbb77773333bb0000777700000099999900000077770005555550000000555555576666666d6666666d666666655555555555
5555555077bbbb7777bbbbbbbbbbbb77773333bb0000777700000099999900000077770005555550000000555555555555555555555555555555555555555555
5555555077bbbbbbbb7777bbbb777733333333bb0000009922000000440000002299000005555550000000555555555555555555555555555555555555555555
5555555077bbbbbbbb7777bbbb777733333333bb0000009922000000440000002299000005555555555555555555555555555555555555555555555555555555
5555555077bb6677bbbbbb7777333333333333bb0000000022222266996622222200000005555555555555555555555555555555555555555555555555555555
5555555077bb6677bbbbbb7777333333333333bb0000000022222266996622222200000005555556665666555555555555555555555666765555555555555555
555555507766771177bbbb7733333333333333bb0000000000002277777722000000000005555556555556555555555555555555555566655555555555555555
555555507766771177bbbb7733333333333333bb000000000000227777772200000000000555555555555555555555ddddddddddddddd6dddddddd5555555555
5555555077bb111177bbbb7733333333333333bb00000000000022226622220000000000055555565555565555555655555555555555565555555d5555555555
5555555077bb111177bbbb7733333333333333bb0000000000002222662222000000000005555556665666555555576666666d6666666d666666655555555555
5555555077bbbb777766bb7733333333333333bb0000000000000044994400000000000005555555555555555555555555555555555555555555555555555555
5555555077bbbb777766bb7733333333333333bb0000000000000044994400000000000005555555555555555555555555555555555555555555555555555555
55555550007777bbbbbbbb773333333333bbbb000000000000002222222222000000000005555555555555555555555555555555555555555555555555555555
55555550007777bbbbbbbb773333333333bbbb000000000000002222222222000000000005555555555555555555555555555555555555555555555555555555
555555500000007777bbbb77333333bbbb0000000000000000222222002222220000000005555550005550005550005550005550005550005550005550005555
555555500000007777bbbb77333333bbbb00000000000000002222220022222200000000055555011d05011d05011d05011d05011d05011d05011d05011d0555
55555550000000000077777733bbbb0000000000000000aa009922000000229900aa000005555501110501110501110501110501110501110501110501110555
55555550000000000077777733bbbb0000000000000000aa009922000000229900aa000005555501110501110501110501110501110501110501110501110555
555555500000000000000077bb000000000000000000000099000000000000009900000005555550005550005550005550005550005550005550005550005555
555555500000000000000077bb000000000000000000000099000000000000009900000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555555555575555555ddd55555d5d5d5d55555d5d555555555d5555555ddd5555550000009955555555555555555555555555555555555555555555555555
555555555555777555555ddd55555555555555555d5d5d55555555d55555d555d555550000099a56666666666666555555555555577777555555555555555555
555555555557777755555ddd55555d55555d55555d5d5d555555555d555d55555d5555000cc76756ddd6d666d6d655555666665577dd77755666665556666655
555555555577777555555ddd55555555555555555ddddd5555ddddddd55d55555d555500c1c76c56d6d6d666d6d6555566ddd665777d777566ddd66566ddd665
5555555557577755555ddddddd555d55555d555d5ddddd555d5ddddd555d55555d555500c1c7c756d6d6ddd6ddd6555566d6d665777d77756666d665666dd665
5555555557557555555d55555d55555555555555dddddd555d55ddd55555d555d5555500c1c77756d6d6d6d666d6555566d6d66577ddd77566d666656666d665
5555555557775555555ddddddd555d5d5d5d555555ddd5555d555d5555555ddd55555500cc11d156ddd6ddd666d6555566ddd6657777777566ddd66566ddd665
555555555555555555555555555555555555555555555555555555555555555555555500cc1d1156666666666666555566666665777777756666666566666665
555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555ddddddd566666665ddddddd5ddddddd5
77777777777777777777777777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000999900000000cccc0000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000099aa99000000cccccc000088000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000cc7677e7cc000cc6776cc008e7800700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c1c76c8e7c1c00cc7777cc00877800700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c1c7c7787c1c00cc7777cc00877800700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c1c777777c1c00cc6776cc0087e800700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cc11d11d11cc000cccccc000088000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cc1d11d111cc0000cccc0000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c1d11111111c0003333330000a0000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c1111111111c0033bbbb3300a99000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc777777ccc003b7777b30a676900700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc676676ccc003b7777b396777690700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc676676ccc003b7777b397447790700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ccc777777ccc003b7777b396747690700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa565656aaa0033bbbb3309646900700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999656565999000333333000999000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007700000000000000aa9000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000077bb7700000000000a646900000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077bbbbbb7700000000a6747690000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
077bbbbbbbbbb7700000097744790000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7bbbbbbbbbbbbbb70000096777690000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
777bbbbbbbbbb77b0000009676900000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7bb77bbbbbb7733b0077000999000770700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7bbbb77bb773333b0009200040002900700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7b67bbb77333333b0000222696222000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
76717bb73333333b0000002777200000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7b117bb73333333b0000002262200000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7bb776b73333333b0000000494000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
077bbbb733333bb00000002222200000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077bb7333bb0000000022202220000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000007773bb00000000a092000290a00700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007b00000000000900000009000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777777777777777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__map__
00000000000000f8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f800f9000000f700fd00000000f80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000f80000000000f80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000fe0000f800fb0000f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00fc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000f8000000fa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f7000000f700000000f800ff00f80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000f8000000f800f800000000f7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000200002e650006002d65019650136201362015650196501d6502065023650246502465023640206401e6401d6401c6401a640186401564013640106300d6300962007610056000060001600006001650016500
0001000000150011500215003150071500c150111501a150271503a150187000765008650096500965009650096500965009650096500965009650267002b200297002d20034d002f2000e700137003120011700
00010000064500a4500d4501345015450114500845003450012000120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
