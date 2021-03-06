-- Helper functions

-- Calculate center position in X axis
-- This is asuming the text uses the system font which is 4px wide
---@param text string
---@return number
function text_x_pos(text)
    local letter_width = 4

    -- first calculate how wide is the text
    local width = #text * letter_width
    
    -- if it's wider than the screen then it's multiple lines so we return 0 
    if width > SCREEN_SIZE then 
        return 0 
    end 

   return SCREEN_SIZE / 2 - flr(width / 2)
end

-- Prints black bordered text
-- color1 is bg, color2 foreground
---@param text string
---@param x number
---@param y number
---@param color1 Color
---@param color2 Color
function write(text,x,y,color1, color2) 
    for i=0,2 do
        for j=0,2 do
            print(text,x+i,y+j, color1)
        end
    end
    print(text,x+1,y+1,color2)
end

---@param time integer
---@param maxtime number
---@return number
function timer(time, maxtime)
    time = time + 1
    if time > maxtime then time = 0 end
    return time
end

---@param text string
---@param x number
---@param y number
function cooltext(text,x,y)
    print(text,x,y+1,6)
    print(text,x,y,7)
end

---@param text string
---@param x number
---@param y number
function supercooltext(text,x,y)
    write(text,x,y,0,0)
    write(text,x,y+1,0,0)
    print(text,x+1,y+1+1,9)
    print(text,x+1,y+1,10)
end

--- log to console AND file
---@param text string
--function log(text)
--    printh(text)
--    printh(text, "log.txt")
--end

---@param x number
---@return number
function fromOct(x)
    return x * 8
end

---@param x number
---@param floor boolean
---@return number|integer
function toOct(x, floor)
    floor = floor or false
    return floor and flr(x / 8) or x / 8
end

---@param index integer sprite index
---@return Vector
function getSpriteCoord(index)
    local y = flr(index / 16)
    local x = ((index / 16)%1) * 16
    return {x = x, y = y}
end

---@param x number
---@return boolean
function isInsideScreen(x)
    return x > 0 and x < SCREEN_SIZE
end

---@param forceToEight boolean
---@return Vector
function getRandomDirection(forceToEight)
    if forceToEight then
        return { x = 1 - flr(rnd(2)), y = 1 - flr(rnd(2)) }
    else
        return { x = 1 - rnd(2), y = 1 - rnd(2) }
    end
end

---@param v1 Vector
---@param v2 Vector
---@return number
function getVectorDistance(v1, v2)
    return sqrt(((v1.x - v2.x)^2)+((v1.y - v2.y)^2))
end

---@param v Vector
---@return number
function getVectorLength(v)
    return sqrt(v.x * v.x + v.y * v.y)
end

---@param v Vector
---@return Vector
function normalize(v)
    local length = getVectorLength(v)
    return {
        x = v.x / length,
        y = v.y / length,
    }
end

---@param v1 Vector
---@param v2 Vector
---@return Vector
function subtractVectors(v1, v2)
    return {
        x = v2.x - v1.x,
        y = v2.y - v1.y,
    }
end

function rotateVector(v, rad)
    return {
        x = v.x * cos(rad) - v.y * sin(rad),
        y = v.x * sin(rad) + v.y * cos(rad)
    }
end

function vectorToString(v)
    local string = "Vector {\n"
    string = string.."\tx = "..tostr(v.x).."\n"
    string = string.."\ty = "..tostr(v.y).."\n"
    string = string.."}"
    return string
end

---@param t table
---@return table
function shallowCopy(t)
    local u = { }
    for k, v in pairs(t) do u[k] = v end
    return setmetatable(u, getmetatable(t))
end

---@param a table
---@param cmp function
---@return table
function sort(a,cmp)
  for i=1,#a do
    local j = i
    while j > 1 and cmp(a[j-1],a[j]) do
        a[j],a[j-1] = a[j-1],a[j]
    j = j - 1
    end
  end
end

-- === Moses === --

M = {}

--- Maps `f (v, k)` on value-key pairs, collects and returns the results. 
-- Uses `pairs` to iterate over elements in `t`.
-- <br/><em>Aliased as `collect`</em>.
-- @name map
-- @param t a table
-- @param f  an iterator function, prototyped as `f (v, k)`
-- @return a table of results
-- @see mapi
function M.map(t, f)
  local _t = {}
  for index,value in pairs(t) do
    local k, kv, v = index, f(value, index)
    _t[v and kv or k] = v or kv
  end
  return _t
end

--- filters and returns values passing an iterator test.
-- <br/><em>Aliased as `filter`</em>.
-- @name filter
-- @param t a table
-- @param f an iterator function, prototyped as `f (v, k)`
-- @return the filtered values
-- @see reject
function M.filter(t, f)
  local _t = {}
  for index,value in pairs(t) do
    if f(value,index) then _t[#_t+1] = value end
  end
  return _t
end

--@param x number
--@return integer
function ceil(x)
    --It just works (tm)
 return -flr(-x)
end

---"Glitches" the screen by copying part of a line into another
--@param l1 integer line to copy from (optional)
--@param l2 integer line to copy to (optional)
--@param amt integer amount of l1 to copy
function glitch(l1,l2,amt)
 local amt = amt or flr(rnd(64))
 local l1 = 0x6000 + 64 * (l1 or flr(rnd(127)))
 local l2 = 0x6000 + 64 * (l2 or flr(rnd(127))) + flr(rnd(64-amt))
    
 memcpy(l2, l1, amt)
end

---Violently shakes the screen
--MUST be called at the very start of _draw() to function
--Triggered by assigning a positive value to shake - could maybe implement a function instead?
shake = 0
function screen_shake()
 local fade = 0.5
 local amt = 32
 local offset_x=amt/2-rnd(amt)
 local offset_y=amt/2-rnd(amt)
 offset_x = offset_x * shake
 offset_y = offset_y * shake
  
 camera(offset_x,offset_y)
 shake = shake * fade
 if shake<0.05 then
   shake=0
 end
end

---A function that makes sure a number doesn't go outside certain bounds
--@param val number value to clamp
--@param a number lower bound
--@param b number upper bound
function clamp(val, a, b)
    if val < a then val = a end
    if val > b then val = b end
    return val
end

function inc(x, v) return x + v end
function invert(x) return -x end

function lerp(a, b, t, speed)
    local poop = a + t * speed * (b - a)
    --Gotta make sure the poop isn't too big
    if a < b then
        if poop >= b then return b
        else return poop end
    else
        if poop <= b then return b
        else return poop end
    end
end

--DIALOGUE STUFF
function dtb_init(n) dtb_q={}dtb_f={}dtb_n=3 if n then dtb_n=n end _dtb_c() end function dtb_disp(t,c)local s,l,w,h,u s={}l=""w=""h=""u=function()if #w+#l>29 then add(s,l)l=""end l=l..w w=""end for i=1,#t do h=sub(t,i,i)w=w..h if h==" "then u()elseif #w>28 then w=w.."-"u()end end u()if l~=""then add(s,l)end add(dtb_q,s)if c==nil then c=0 end add(dtb_f,c)end function _dtb_c()dtb_d={}for i=1,dtb_n do add(dtb_d,"")end dtb_c=0 dtb_l=0 end function _dtb_l()dtb_c+=1 for i=1,#dtb_d-1 do dtb_d[i]=dtb_d[i+1]end dtb_d[#dtb_d]=""end function dtb_update()if #dtb_q>0 then if dtb_c==0 then dtb_c=1 end local z,x,q,c z=#dtb_d x=dtb_q[1]q=#dtb_d[z]c=q>=#x[dtb_c]if c and dtb_c>=#x then if btnp(4) then if dtb_f[1]~=0 then dtb_f[1]()end del(dtb_f,dtb_f[1])del(dtb_q,dtb_q[1])_dtb_c()return end elseif dtb_c>0 then dtb_l-=1 if not c then if dtb_l<=0 then local v,h v=q+1 h=sub(x[dtb_c],v,v)dtb_l=1 if h=="." then dtb_l=6 end dtb_d[z]=dtb_d[z]..h end if btnp(4) then dtb_d[z]=x[dtb_c]end else if btnp(4) then _dtb_l()end end end end end function dtb_draw()if #dtb_q>0 then local z,o z=#dtb_d o=0 if dtb_c<z then o=z-dtb_c end rectfill(2,125-z*8,125,125,0)if dtb_c>0 and #dtb_d[#dtb_d]==#dtb_q[1][dtb_c] then print("\x8e",118,120,1)end for i=1,z do print(dtb_d[i],4,i*8+119-(z+o)*8,7)end end end