GameOverState = Class {__includes = BaseState}

function GameOverState:enter(params)
    self.score = params.score -- body
end
function GameOverState:update(dt)
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("start")
    end
end
function GameOverState:render()
    RenderScore(self.score)
    love.graphics.setFont(gFonts["large"])
    love.graphics.printf("GAME OVER", 0, 64, VIRTUAL_WIDTH, "center")
    love.graphics.setFont(gFonts["medium"])
    love.graphics.setColor(103 / 255, 1, 1, 1)
    love.graphics.printf("press ENTER to START new game", 0, VIRTUAL_HEIGHT - 32, VIRTUAL_WIDTH, "center")
end
