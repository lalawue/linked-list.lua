
# About

list.lua was a double link list implement.

# Usage

```lua
--[[
   list will keep only one value instance, for using table to record prev/next value
]]

local lst = require("list").new()

lst:pushl("b")                  -- push last 'b'
lst:pushf("a")                  -- push first 'a'

for i=1, 4, 1 do
   lst:pushl(tostring(i))       -- push last '1, 2, 3, 4'
end

lst:pushl({5, 6, 7})            -- push table
lst:pushl(8)                    -- push number
lst:pushl(true)                 -- push boolean

lst:remove("3")                 -- remove '3', in middle
lst:popf()                      -- pop first 'a'

lst:pushl("end")                -- push 'end'
lst:popl()                      -- pop 'end'

print("-- walk")
for k, v in lst:walk() do
   print(k, v)                  -- should print 'b, 1, 2, 4, ...'
end

print("-- walk reverse")
for k, v in lst:walk(false) do
   print(k, v)                  -- should print 'true, 8, table, 4, 3, 2, 1'
end

print("-- range seq")
for i, v in ipairs(lst:range(2, 3)) do
   print(i, v)                  -- should print '1, 2'
end

print("-- range reverse")
for i, v in ipairs(lst:range(6, 5)) do
   print(i, v)                  -- should print '8, table'
end

print("-- finish")
```

# Performance

3.29 GHz Intel Core i5 GHz Intel Core i5

```
-- performance, round:1
push 10000000 cost 0.439592
pop  10000000 cost 0.036406
-- performance, round:2 push_mean:0.439592 pop_mean:0.036406
push 10000000 cost 0.133136
pop  10000000 cost 0.036463
-- performance, round:3 push_mean:0.286364 pop_mean:0.0364345
push 10000000 cost 0.13311
pop  10000000 cost 0.03642
```
