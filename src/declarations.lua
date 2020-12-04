--- Here are the Pico8 API specifications
--- Don't include them in your project, they are meant to be used by a linter
--- so it can provide autocompletion and documentation

---@alias Color integer

--- play music
function music() end
--- play music starting from pattern n (0..63)
---@param n number n = -1 : stop
function music(n) end
--- play music starting from pattern n (0..63)
---@param n number n = -1 : stop
---@param fade_len number in ms (default: 0)
function music(n, fade_len) end
--- play music starting from pattern n (0..63)
---@param n number n = -1 : stop
---@param fade_len number in ms (default: 0)
---@param channel_mask number specifies which channels to reserve for music only (e.g. to play on channels 0..2: 1+2+4 = 7)
function music(n, fade_len, channel_mask) end

--- play sfx n
---@param n number sfx index
function sfx(n) end
--- play sfx n on channel (0..3)
--- channel -1 (default) to automatically choose a channel that is not being used
--- channel -2 to stop the sound from playing on any channel
---@param n number sfx index
---@param channel number channel index (0..3)
function sfx(n, channel) end
--- play sfx n on channel (0..3) from note offset (0..31)
--- channel -1 (default) to automatically choose a channel that is not being used
--- channel -2 to stop the sound from playing on any channel
---@param n number sfx index
---@param channel number channel index (0..3)
---@param offset number (0..31)
function sfx(n, channel, offset) end
--- play sfx n on channel (0..3) from note offset (0..31) for length notes
--- channel -1 (default) to automatically choose a channel that is not being used
--- channel -2 to stop the sound from playing on any channel
---@param n number sfx index
---@param channel number channel index (0..3)
---@param offset number (0..31)
---@param length number 
function sfx(n, channel, offset, length) end

--- reset camera position
function camera() end
--- set camera position
---@param x number
---@param y number
function camera(x, y) end

--- draw circle
---@param x number
---@param y number
---@param r number radius >= 0
function circ(x, y, r) end
--- draw circle
---@param x number
---@param y number
---@param r number radius >= 0
---@param col Color color index
function circ(x, y, r, col) end

--- draw filled circle
---@param x number
---@param y number
---@param r number radius >= 0
function circfill(x, y, r) end
--- draw filled circle
---@param x number
---@param y number
---@param r number radius >= 0
---@param col Color color index
function circfill(x, y, r, col) end

--- reset screen clipping region
function clip() end
--- set screen clipping region
---@param x number
---@param y number
---@param w number
---@param h number
function clip(x, y, w, h) end
--- set screen clipping region
--- when clip_previous is true, clip the new clipping region by the old one.
---@param x number
---@param y number
---@param w number
---@param h number
---@param clip_previous boolean
function clip(x, y, w, h, clip_previous) end

--- clear the screen and reset the clipping rectangle.
function cls() end
--- clear the screen and reset the clipping rectangle.
---@param col Color color index clear color (default to 0 black)
function cls(col) end

--- set the current colour to be used by drawing functions to 6
function color() end
--- set the current colour to be used by drawing functions
---@param col Color color index (default to 6)
function color(col) end

--- set cursor and CR/LF margin position
---@param x number
---@param y number
function cursor(x, y) end

--- get values of sprite flags
---@param n number sprite index
---@return boolean
function fget(n) end
--- get values of sprite flags
---@param n number sprite index
---@param f number flag index
---@return boolean
function fget(n, f) end

--- flip screen back buffer (30fps)
function flip() end

--- set values of sprite flags
---@param n number sprite index
---@param v number value (power of 2)
function fset(n, v) end
--- set values of sprite flags
---@param n number sprite index
---@param f number flag index
---@param v boolean value
function fset(n, f, v) end

--- draw line (end at the end of the last drawn line)
---@param x0 number
---@param y0 number
function line(x0, y0) end
--- draw line
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
function line(x0, y0, x1, y1) end
--- draw line
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col Color color index
function line(x0, y0, x1, y1, col) end

--- swaps colour c0 for c1
---@param c0 number color to replace
---@param c1 number new color
function pal(c0, c1) end
--- swaps colour c0 for c1 for one of two palette re-mappings (p defaults to 0)
---@param c0 number color to replace
---@param c1 number new color
---@param p number palette mode (0: draw, 1: display)
function pal(c0, c1, p) end

--- set transparency for colour to t
---@param col Color color index color index
---@param t boolean
function palt(col, t) end

--- get pixel colour
---@param x number
---@param y number
---@return numer
function pget(x, y) end

--- print string
---@param str string
function print(str) end
--- print string
---@param str string
---@param x number
---@param y number
function print(str, x, y) end
--- print string
---@param str string
---@param x number
---@param y number
---@param col Color color index
function print(str, x, y, col) end

--- set pixel colour
---@param x number
---@param y number
function pset(x, y) end
--- set pixel colour
---@param x number
---@param y number
---@param coloColor number
function pset(x, y, color) end

--- draw rectangle
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
function rect(x0, y0, x1, y1) end
--- draw rectangle
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col Color color index
function rect(x0, y0, x1, y1, col) end

--- draw filled rectangle
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
function rectfill(x0, y0, x1, y1) end
--- draw filled rectangle
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col Color color index
function rectfill(x0, y0, x1, y1, col) end

--- get spritesheet pixel colour
---@param x number
---@param y number
---@return number
function sget(x, y) end

--- draw sprite n (0..255) at position x,y
---@param n number sprite index
---@param x number
---@param y number
function spr(n, x, y) end
--- draw sprite n (0..255) at position x,y
--- width and height specify how many sprites wide to blit.
---@param n number sprite index
---@param x number
---@param y number
---@param w number (default to 1)
---@param h number (default to 1)
function spr(n, x, y, w, h) end
--- draw sprite n (0..255) at position x,y
--- width and height specify how many sprites wide to blit.
---@param n number sprite index
---@param x number
---@param y number
---@param w number
---@param h number
---@param flip_x boolean 
---@param flip_y boolean
function spr(n, x, y, w, h, flip_x, flip_y) end

--- set spritesheet pixel colour
---@param x number
---@param y number
function sset(x, y) end
--- set spritesheet pixel colour
---@param x number
---@param y number
---@param col Color color index
function sset(x, y, col) end

--- draw texture from spritesheet
---@param sx number
---@param sy number
---@param sw number
---@param sh number
---@param dx number
---@param dy number
function sspr(sx, sy, sw, sh, dx, dy) end
--- draw texture from spritesheet
---@param sx number
---@param sy number
---@param sw number
---@param sh number
---@param dx number
---@param dy number
---@param dw number
---@param dh number
function sspr(sx, sy, sw, sh, dx, dy, dw, dh) end
--- draw texture from spritesheet
---@param sx number
---@param sy number
---@param sw number
---@param sh number
---@param dx number
---@param dy number
---@param dw number
---@param dh number
---@param flip_x boolean
function sspr(sx, sy, sw, sh, dx, dy, dw, dh, flip_x) end
--- draw texture from spritesheet
---@param sx number
---@param sy number
---@param sw number
---@param sh number
---@param dx number
---@param dy number
---@param dw number
---@param dh number
---@param flip_x boolean
---@param flip_y boolean
function sspr(sx, sy, sw, sh, dx, dy, dw, dh, flip_x, flip_y) end

--- set fill pattern for circ, circfill, rect, rectfill, pset, and line
-- .-----------------------.
-- |32768|16384| 8192| 4096|
-- |-----|-----|-----|-----|
-- | 2048| 1024| 512 | 256 |
-- |-----|-----|-----|-----|
-- | 128 |  64 |  32 |  16 |
-- |-----|-----|-----|-----|
-- |  8  |  4  |  2  |  1  |
-- '-----------------------'
---@param mask number
function fillp(mask) end

--- returns a bitfield of all 12 button states for player 0 & 1
---@return number 
function btn() end 
--- get button i state for player 0
---@param i number gamepad index
---@return number 
function btn(i) end 
--- get button i state for player p
---@param i number gamepad index
---@param p number player index
---@return number 
function btn(i, p) end 

--- only true when the button was not pressed the last frame; repeats every 4 frames after button held for 15 frames
function btnp() end 
--- only true when the button was not pressed the last frame; repeats every 4 frames after button held for 15 frames
---@param i number gamepad index
function btnp(i) end 
--- only true when the button was not pressed the last frame; repeats every 4 frames after button held for 15 frames
---@param i number gamepad index
---@param p number player index
function btnp(i, p) end

-- draw map; sprite 0 is empty
---@param cel_x number
---@param cel_y number
---@param sx number
---@param sy number
---@param cel_w number
---@param cel_h number
function map(cel_x, cel_y, sx, sy, cel_w, cel_h) end
-- draw map; layers from flags; sprite 0 is empty
---@param cel_x number
---@param cel_y number
---@param sx number
---@param sy number
---@param cel_w number
---@param cel_h number
---@param layer number
function map(cel_x, cel_y, sx, sy, cel_w, cel_h, layer) end

-- draw map; sprite 0 is empty
---@param cel_x number
---@param cel_y number
---@param sx number
---@param sy number
---@param cel_w number
---@param cel_h number
function mapdraw(cel_x, cel_y, sx, sy, cel_w, cel_h) end
-- draw map; layers from flags; sprite 0 is empty
---@param cel_x number
---@param cel_y number
---@param sx number
---@param sy number
---@param cel_w number
---@param cel_h number
---@param layer number
function mapdraw(cel_x, cel_y, sx, sy, cel_w, cel_h, layer) end

--- get map value
---@param x number
---@param y number
---@return number
function mget(x, y) end

--- set map value
---@param x number
---@param y number
---@param v number
function mset(x, y, v) end

--- add value v to the end of table t.
--- Equivalent to t[#t+1] = v
---@param t table
---@param v any
function add(t, v) end
--- add value v to the end of table t.
--- Equivalent to t[#t+1] = v
--- if index is given then the element is inserted at that position
---@param t table
---@param v any
---@param index number
function add(t, v, index) end

--- return a iterator for loops
---@param t table
function all(t) end

--- returns the length of table t (same as #t)
---@param t table
---@return number
function count(t) end
--- returns the number of instances of v in the table t
---@param t table
---@return number
function count(t, v) end

--- Delete the the last element in table t
--- The remaining entries are shifted left one index to avoid holes.
--- To remove an item at a particular index, use deli.
--- del returns the deleted item, or returns no value when nothing was deleted.
---@param t table
---@return any
function del(t) end
--- Delete the first instance of value v in table t
--- The remaining entries are shifted left one index to avoid holes.
--- Note that v is the value of the item to be deleted, not the index into the table.
--- To remove an item at a particular index, use deli.
--- When v is not given, the last element in the table is removed.
--- del returns the deleted item, or returns no value when nothing was deleted.
---@param t table
---@param v any
---@return any
function del(t, v) end

--- like del(), but remove the first item from table t
---@param t table
---@return any
function deli(t) end
--- like del(), but remove the item from table t at index i.
---@param t table
---@param v number index
---@return any
function deli(t, i) end

--- for each item in table t, call function f with the item as a single parameter.
---@param t table
---@param f function
function foreach(t, f) end

--- x absolute value
---@param x number
---@return number
function abs(x) end

--- convert (dx, dy) to an angle in [0..1]
---@param dx number
---@param dy number
---@return number
function atan2(dx, dy) end

--- round up
---@param x number
---@return integer
function ceil(x) end

--- x cosine, [0..1]
---@param x number
---@return number
function cos(x) end

--- round down
---@param x number
---@return integer
function flr(x) end

--- x/y maximum
---@param x number
---@param y number
---@return number
function max(x, y) end

--- x/y/z middle value
---@param x number
---@param y number
---@param z number
---@return number
function mid(x, y, z) end

--- x/y minimum
---@param x number
---@param y number
---@return number
function min(x, y) end

--- random; 0 <= n < x
---@param x number
---@return number
function rnd(x) end

--- returns argument sign: -1 or 1; sgn(0) = 1
---@param x number
---@return number
function sgn(x) end

--- x sine, [0..1]; inverted
---@param x number
---@return number
function sin(x) end

--- set random seed
---@param x number
function srand(x) end

--- Grab a substring from string str, from "from" up to and including the end of the string.
---@param str string
---@param from number
---@return string
function sub(str, from) end
--- Grab a substring from string str, from "from" up to and including "to".
---@param str string
---@param from number
---@param to number
---@return string
function sub(str, from, to) end

--- convert val to a string
---@param val any
---@return string
function tostr(val) end
--- convert val to a string; if hex is true and val is a number, output format is "0x0000.0000"
---@param val any
---@param hex boolean
---@return string
function tostr(val, hex) end

--- cast parseable str to number; nil if str isn't a number; "0xAF" format for hex
---@param str string
---@return number | nil
function tonum(str) end

--- number of seconds elasped since the cartridge was run.
---@return number
function time() end
--- number of seconds elasped since the cartridge was run.
---@return number
function t() end

-- Get system status where x is:
-- 0  Memory usage (0..2048)
-- 1  CPU used since last flip (1.0 == 100% CPU at 30fps)
-- 4  Clipboard contents (after user has pressed CTRL-V)
-- 6  Parameter string
-- 7  Current framerate
-- 16..19  Index of currently playing SFX on channels 0..3
-- 20..23  Note number (0..31) on channel 0..3
-- 24      Currently playing pattern index
-- 25      Total patterns played
-- 26      Ticks played on current pattern
-- 80..85  UTC time: year, month, day, hour, minute, second
-- 90..95  Local time
-- 100     Current breadcrumb label, or nil
-- 110		Returns true when in frame-by-frame mode
---@param x number
---@return any
function stat(x) end

--- print a string to the host operating system's console for debugging.
---@param str string
function printh(str) end
--- print a string to a file on the host operating system for debugging.
---@param str string
---@param filename string
function printh(str, filename) end
--- print a string to a file on the host operating system for debugging.
--- Setting overwrite to true causes that file to be overwritten rather than appended
---@param str string
---@param filename string
---@param overwrite boolean
function printh(str, filename, overwrite) end
--- print a string to a file on the host operating system for debugging.
--- Setting overwrite to true causes that file to be overwritten rather than appended.
--- Setting save_to_desktop to true saves to the desktop instead of the current path.
---@param str string
---@param filename string
---@param overwrite boolean
---@param save_to_desktop boolean
function printh(str, filename, overwrite, save_to_desktop) end