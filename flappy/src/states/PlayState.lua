PlayState = Class {__includes = BaseState}

function PlayState:init()
    self.bird = Bird()
    self.pipePairs = {}
    self.spawnTimer = 0
    self.lastY = -PIPE_HEIGHT + math.random(80) + 20
    self.score = 0
end

function PlayState:update(dt)
    self.spawnTimer = self.spawnTimer + dt
    if self.spawnTimer > 2 then
        local y =
            math.max(-PIPE_HEIGHT + 10, math.min(self.lastY + math.random(-20, 20), VIRTUAL_HEIGHT - 90 - PIPE_HEIGHT))
        self.lastY = y
        table.insert(self.pipePairs, PipePair(y))
        self.spawnTimer = 0
    end
    for k, pipePair in pairs(self.pipePairs) do
        pipePair:update(dt)
        if not pipePair.scored then
            if pipePair.x + PIPE_WIDTH < self.bird.x then
                self.score = self.score + 1
                pipePair.scored = true
                gSounds["score"]:play()
            end
        end
        for l, pipe in pairs(pipePair.pipes) do
            if self.bird:collides(pipe) then
                gSounds["explosion"]:play()
                gSounds["hurt"]:play()
                gStateMachine:change("score", self.score)
            end
        end
    end
    for k, pipePair in pairs(self.pipePairs) do
        if pipePair.remove then
            table.remove(self.pipePairs, k)
        end
    end
    self.bird:update(dt)
end

function PlayState:render()
    self.bird:render()
    for k, pipePair in pairs(self.pipePairs) do
        pipePair:render()
    end
    love.graphics.setFont(gFonts["medium"])
    love.graphics.print("score:  " .. tostring(self.score), 0, 16)
end
