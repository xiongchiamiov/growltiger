local Gamestate = require 'hump.gamestate'

play = require 'states.play'

function love.load()
   Gamestate.registerEvents()
   Gamestate.switch(play)
end

