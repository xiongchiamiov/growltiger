local Class = require 'hump.class'

local Box = Class(function(self, x, y, red, green, blue)
   self.x = x
   self.y = y
   self.color = {red, green, blue}
end)

function Box:draw()
   local r, g, b, a = love.graphics.getColor()
   love.graphics.setColor(self.color)
   love.graphics.rectangle(
      'fill',
      self.x,
      self.y,
      100,
      100
   )
   love.graphics.setColor(r, g, b, a)
end

function Box:move(yDirection)
   self.y = self.y + (3 * yDirection)
end

return Box

