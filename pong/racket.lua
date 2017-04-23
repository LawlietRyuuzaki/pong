racket = {}

racket.new = function(x, y, size, speed, physicsWorld)
  local self = self or {}
  self.physicsWorld = physicsWorld
  self.x = x
  self.y = y
  self.size = size
  self.speed = speed

  self.physics = {}
  self.physics.world = physicsWorld
  self.physics.body = love.physics.newBody(self.physics.world, self.x, self.y, "static")
  self.physics.shape = love.physics.newRectangleShape(10, self.size)
  self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape, 1)

  self.physics.fixture:setFriction(0)

  self.draw = function()
    love.graphics.rectangle("fill", self.physics.body:getX(), self.physics.body:getY() - self.size/2, 10, self.size)
  end

  self.moveUp = function()
    self.physics.body:setPosition(self.x, self.physics.body:getY() - self.speed * love.timer.getDelta())
  end
  self.moveDown = function()
    self.physics.body:setPosition(self.x, self.physics.body:getY() + self.speed * love.timer.getDelta())
  end
  self.getPosition = function()
    return self.physics.body:getY()
  end
  self.getSize = function()
    return self.size
  end
  return self
end
