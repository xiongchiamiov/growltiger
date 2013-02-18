local Gamestate = require 'hump.gamestate'
local Box = require 'objects.box'

local boxes = {}
local activeBox

local play = Gamestate.new()

function play:enter()
   table.insert(boxes, Box(0, 0, 255, 0, 0))
   table.insert(boxes, Box(0, 100, 0, 255, 0))
   table.insert(boxes, Box(0, 300, 0, 0, 255))
   activeBox = boxes[2]
end

function play:draw()
   for i, box in ipairs(boxes) do
      box:draw()
   end
end

function boxSorter(a, b)
   return a.y < b.y
end

function play:update()
   if love.keyboard.isDown('w') then
      activeBox:move(-1)
      # I started to make an ordered doubly-linked list system to handle this,
      # but then decided that was too much work for the moment.  Optimize it
      # when it becomes a problem.
      table.sort(boxes, boxSorter)
   elseif love.keyboard.isDown('s') then
      activeBox:move(1)
      table.sort(boxes, boxSorter)
   end
end

function play:keypressed(key)
   if key == '1' then
      activeBox = boxes[1]
   elseif key == '2' then
      activeBox = boxes[2]
   elseif key == '3' then
      activeBox = boxes[3]
   end
end

return play

