Bird = Class {}
local GRAVITY = 20

function Bird:init()
    self.image = gTextures["bird"]
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)
    self.dy = 0
end

function Bird:render(...)
    love.graphics.draw(self.image, self.x, self.y)
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt
    if love.keyboard.wasPressed("space") then
        gSounds["jump"]:play()
        self.dy = -5
    end
    self.y = self.y + self.dy

    if self.y < 0 then
        self.y = 0
    end
    if self.y > VIRTUAL_HEIGHT - self.height - 16 then
        self.y = VIRTUAL_HEIGHT - self.height - 16
    end
end

function Bird:collides(pipe)
    if (self.x + 2) + (self.width - 4) >= pipe.x and self.x <= PIPE_WIDTH + pipe.x then
        if (self.y + 2) + (self.height - 4) >= pipe.y and self.y <= pipe.y + PIPE_HEIGHT then
            return true
        end
    end
    return false
end
