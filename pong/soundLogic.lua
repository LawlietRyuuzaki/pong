
local oldX, oldY
function checkBallChangeDirection(ball, sounds)
  sounds.bounce:setVolume(0.1)
  if oldX ~= select(1, ball:getLinearVelocity()) or oldY ~= select(2, ball:getLinearVelocity()) then
    oldX, oldY = ball:getLinearVelocity()
    sounds.bounce:stop()
    sounds.bounce:play()
    oldX, oldY = ball:getLinearVelocity()
  end
end
