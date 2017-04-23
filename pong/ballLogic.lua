ballLogic = {}

ballLogic.new = function(x, y, size, velocity, physicsWorld)
  self = self or {}
  self.x = x
  self.y = y
  self.size = size
  self.velocity = velocity

  self.physics = {}
  self.physics.world = physicsWorld
  self.physics.body = love.physics.newBody(physicsWorld, self.x, self.y, "dynamic")
  self.physics.shape = love.physics.newRectangleShape(self.size, self.size)
  self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape, 1)

  self.physics.fixture:setRestitution(1.1)
  self.physics.body:setLinearVelocity(self.velocity, math.random(50, 230))

  self.draw = function()
    love.graphics.rectangle("fill", self.physics.body:getX(), self.physics.body:getY(), self.size, self.size)
  end
  self.getLinearVelocity = function()
    return self.physics.body:getLinearVelocity()
  end
  self.reset = function()
    self.physics.body:setPosition(self.x, self.y)
    self.physics.body:setLinearVelocity(self.velocity, math.random(50,230))
  end
  return self
end
