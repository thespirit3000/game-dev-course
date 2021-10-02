Bullet = Class {}

function Bullet:init(x, y)
    self.x = x
    self.y = y
    self.speed = 300
    self.remove = false
    self.width = 16
    self.height = 16
end

function Bullet:update(dt)
    self.y = self.y - self.speed * dt
    if self.y < 0 then self.remove = true end
end
function Bullet:collides() end

function Bullet:render()
    love.graphics.draw(gTextures['main'], gFrames['bullets'][math.random(5)],
                       self.x, self.y)
    -- body
end

