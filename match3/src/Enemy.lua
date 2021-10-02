Enemy = Class {}

function Enemy:init(x, y, dx, dy)
    self.x = x
    self.y = y
    self.width = 16
    self.height = 16
    self.dy = dy
    self.dx = dx
    self.remove = false
    self.type = math.random(4)
end
function Enemy:update(dt)
    self.y = self.y + self.dy * dt
    self.x = self.x + self.dx * dt
end
function Enemy:collides(target)
    return
        target.x < self.x + self.width and self.x < target.x + target.width and
            target.y < self.y + self.height and self.y < target.y +
            target.height
end
function Enemy:render(type)
    love.graphics.draw(gTextures['main'], gFrames['enemies'][self.type], self.x,
                       self.y, 0, 1.2, 1.2)
end
