Brick = Class {}

function Brick:init(x, y)
    self.tier = 0
    self.color = 1
    self.x = x
    self.y = y
    self.width = 32
    self.height = 16
    self.inGame = true
end

function Brick:hit()
    gSounds["brick-hit-1"]:play()
    self.inGame = false
end

function Brick:render()
    if self.inGame then
        love.graphics.draw(gTextures["main"], gFrames["bricks"][1 + ((self.color - 1) * 4) + self.tier], self.x, self.y)
    end
    -- body
end
