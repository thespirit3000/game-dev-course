Stars = Class {}
function Stars:init()
    self.x = math.random(20, VIRTUAL_WIDTH - 20)
    self.speed = math.random(3, 7) * 10
    self.remove = false
    self.size = math.random(3)
    self.y = -5
end
function Stars:update(dt) self.y = self.y + self.speed * dt end

function Stars:render()
    love.graphics.setColor(1, 1, 1, math.random(2, 7) / 10)
    love.graphics.rectangle('fill', self.x, self.y, self.size, self.size)
    love.graphics.setColor(1, 1, 1, 1)
end
