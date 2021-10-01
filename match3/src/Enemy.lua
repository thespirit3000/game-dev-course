Enemy = Class {}

function Enemy:init(x, y, dx, dy)
    self.x = x
    self.y = y
    self.dy = dy
    self.dx = dx
    self.remove = false
    self.type = math.random(4)
end
function Enemy:update(dt)
    self.y = self.y + self.dy * dt
    self.x = self.x + self.dx * dt
end
function Enemy:render(type)
    love.graphics.draw(gTextures['main'], gFrames['enemies'][self.type], self.x,
                       self.y, 0, 1.2, 1.2)
end
