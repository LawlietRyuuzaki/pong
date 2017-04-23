require("racket")
require("keyboard")
require ("ballLogic")
require("worldLimits")
require("soundLogic")

local sounds = {}
local rack = {}
local ball
local size = 100
local edges
local physicsWorld

function love.load()
  physicsWorld = love.physics.newWorld(0, 0, true)
  rack.speed = 400
  rack.left = racket.new(10,love.graphics.getHeight()/2 - size/2, size, rack.speed, physicsWorld)
  rack.right = racket.new(love.graphics.getWidth() - 20, love.graphics.getHeight()/2 - size/2, size, rack.speed, physicsWorld)

  ball = ballLogic.new(300, 50, 10, 350, physicsWorld)

  edges = worldLimits.new(physicsWorld)

  sounds.bounce = love.audio.newSource("hit.wav", "stream")
end

function love.draw()
  rack.left:draw()
  rack.right:draw()
  ball:draw()
end

function love.update(dt)
  checkKeyboardInput(rack, ball)
  physicsWorld:update(dt)
  checkBallChangeDirection(ball, sounds)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "space" then ball:reset() end
end
