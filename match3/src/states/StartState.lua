StartState = Class {__includes = BaseState}

local selected = 1

function StartState:update(dt)
    if love.keyboard.wasPressed("up") or love.keyboard.wasPressed("down") then
        selected = selected == 1 and 2 or 1
    end

    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
    end
end

function StartState:render()
    love.graphics.setFont(gFonts["large"])
    love.graphics.printf("MATCH", 0, 64, VIRTUAL_WIDTH, "center")
end
