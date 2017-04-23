worldLimits = {}

worldLimits.new = function(physicsWorld)
  self = self or {}

  self.physicsWorld = physicsWorld
  self.limit1 = {}
  self.limit2 = {}
  self.limit1.body = love.physics.newBody(self.physicsWorld, love.graphics.getWidth()/2, 0, "static")
  self.limit1.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 1)
  self.limit1.fixture = love.physics.newFixture(self.limit1.body, self.limit1.shape)

  self.limit2.body = love.physics.newBody(self.physicsWorld, love.graphics.getWidth()/2, love.graphics.getHeight(), "static")
  self.limit2.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 1)
  self.limit2.fixture = love.physics.newFixture(self.limit2.body, self.limit2.shape)

  self.limit1.fixture:setFriction(0)
  self.limit2.fixture:setFriction(0)
  return self
end
