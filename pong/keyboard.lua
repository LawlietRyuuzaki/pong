

function checkKeyboardInput(rack)
  if love.keyboard.isDown("z") and rack.left:getPosition() > 0 + rack.left:getSize()/2 then rack.left:moveUp() end
  if love.keyboard.isDown("s") and rack.left:getPosition() < love.graphics.getHeight() - rack.left:getSize()/2 then rack.left:moveDown() end
  if love.keyboard.isDown("up") and rack.right:getPosition() > 0 + rack.right:getSize()/2 then rack.right:moveUp() end
  if love.keyboard.isDown("down") and rack.right:getPosition() < love.graphics.getHeight() - rack.right:getSize()/2 then rack.right:moveDown() end
end
