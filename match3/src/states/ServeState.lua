ServeState = Class {__includes = BaseState}

function ServeState:enter(params) end
function ServeState:update(dt)
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("play", {
            paddle = self.paddle,
            bricks = self.bricks,
            health = self.health,
            score = self.score,
            ball = self.ball
        })
    end
end
function ServeState:render()
    love.graphics.printf("press Enter", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH,
                         "center")
end
