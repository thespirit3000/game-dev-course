StartState = Class {__includes = BaseState}

local selected = 1

function StartState:update(dt)
    if love.keyboard.wasPressed("up") or love.keyboard.wasPressed("down") then
        selected = selected == 1 and 2 or 1
    end

    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        if selected == 1 then
            gStateMachine:change(
                "serve",
                {
                    paddle = Paddle(1),
                    bricks = LevelMaker.createMap(),
                    health = 3,
                    score = 0
                }
            )
        else
            gStateMachine:change("hight-scores")
        end
    end
end

function StartState:render()
    love.graphics.setFont(gFonts["large"])
    love.graphics.printf("Breakout", 0, 64, VIRTUAL_WIDTH, "center")
    love.graphics.setFont(gFonts["small"])
    if selected == 1 then
        love.graphics.setColor(103 / 255, 1, 1, 1)
    end
    love.graphics.printf("START", 0, VIRTUAL_HEIGHT - 24, VIRTUAL_WIDTH, "center")
    love.graphics.setColor(1, 1, 1, 1)
    if selected == 2 then
        love.graphics.setColor(103 / 255, 1, 1, 1)
    end
    love.graphics.printf("HIGHT SCORES", 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, "center")
    love.graphics.setColor(1, 1, 1, 1)
end
