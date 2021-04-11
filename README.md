
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
for i, v in ipairs(lst:range(3, 2)) do
   print(i, v)                  -- should print '8, table'
end

print("-- finish")
```

# Performance

MacBook Pro 2017, 3.1 GHz Intel Core i5

```
-- performance, round:1
push 10000000 cost 0.436185
pop  10000000 cost 0.036015
-- performance, round:2 push_mean:0.436185 pop_mean:0.036015
push 10000000 cost 0.133759
pop  10000000 cost 0.036306
-- performance, round:3 push_mean:0.284972 pop_mean:0.0361605
push 1000,000, cost 0.377446
pop  1000,000, cost 0.121516
```
