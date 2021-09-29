TitleScreenState = Class {__includes = BaseState}

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("timer")
    end
end

function TitleScreenState:render()
    love.graphics.setFont(gFonts["large"])
    love.graphics.printf("Flappy Bird", 0, 64, VIRTUAL_WIDTH, "center")
    love.graphics.setFont(gFonts["medium"])
    love.graphics.printf("press Enter ", 0, 100, VIRTUAL_WIDTH, "center")
end
