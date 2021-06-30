--[[
   list will keep only one value instance, for using table to record prev/next value
]]
local lst = require("linked-list").new()

lst:pushl("b") -- push last 'b'
lst:pushf("a") -- push first 'a'

for i = 1, 4, 1 do
    lst:pushl(tostring(i)) -- push last '1, 2, 3, 4'
end

lst:pushl({5, 6, 7}) -- push table
lst:pushl(8) -- push number
lst:pushl(true) -- push boolean

lst:remove("3") -- remove '3', in middle
lst:popf() -- pop first 'a'

lst:pushl("end") -- push 'end'
lst:popl() -- pop 'end'

print("-- walk: { b, 1, 2, 4, table, 8, true }")
for k, v in lst:walk() do
    print(k, v)
end

print("-- walk reverse: { true, 8, table, 4, 2, 1, b }")
for k, v in lst:walk(false) do
    print(k, v)
end

print("-- range: { 1, 2 }")
for i, v in ipairs(lst:range(2, 3)) do
    print(i, v)
end

print("-- range reverse: { 8, table }")
for i, v in ipairs(lst:range(6, 5)) do
    print(i, v)
end

print("-- contains true: " .. tostring(lst:contains(true)) .. "\n")

local round = 0
local push_mean = 0
local pop_mean = 0
while true do
    round = round + 1
    io.write("-- performance, round:" .. round)
    if round > 1 then
        io.write(" push_mean:" .. push_mean/(round-1) .. " pop_mean:" .. pop_mean/(round-1))
    end
    io.write("\n")
    local max_count = 1000 * 1000 * 10
    local o = os.clock()
    for i = 50, max_count + 50, 1 do
        lst:pushf(i)
    end
    local t = os.clock() - o
    push_mean = push_mean + t
    print("push " .. max_count .. " cost " .. t)
    o = os.clock()
    while lst:count() > 0 do
        lst:popl()
    end
    t = os.clock() - o
    pop_mean = pop_mean + t
    print("pop  " .. max_count .. " cost " .. t)
end
