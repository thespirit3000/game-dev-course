ScoreState = Class {__includes = BaseState}
function ScoreState:init()
    self.score = 0
end
function ScoreState:enter(score)
    self.score = score
    -- body
end
function ScoreState:update()
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("title")
    end
end
function ScoreState:render()
    love.graphics.setFont(gFonts["medium"])
    love.graphics.printf("Your score:  " .. tostring(self.score), 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, "center")
end
