Ship = Class {}

function Ship:init(x)
    self.x = x
    self.y = VIRTUAL_HEIGHT - 32

    self.dx = 0
    self.dy = 0
    self.width = 16
    self.height = 16
    self.speed = 200

    self.animationTimer = 0
    self.fire = 40
end

function Ship:update(dt)
    self.animationTimer = self.animationTimer + dt
    if self.animationTimer > 0.1 then
        self.animationTimer = 0
        self.fire = self.fire == 40 and 46 or 40
    end
    if love.keyboard.isDown('right') then
        self.dx = self.speed
    elseif love.keyboard.isDown('left') then
        self.dx = -self.speed
    else
        self.dx = 0
    end

    if self.dx < 0 then
        self.x = math.max(0, self.x + self.dx * dt)
    else
        self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
    end

end
function Ship:render()
    love.graphics
        .draw(gTextures['main'], gFrames['sprites'][32], self.x, self.y)
    love.graphics.draw(gTextures['main'], gFrames['sprites'][self.fire], self.x,
                       self.y + 16)
end
