ServeState = Class {__includes = BaseState}

function ServeState:enter(params) self.player = params.player end
function ServeState:update(dt)
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("play", {player = self.player})
    end
end
function ServeState:render()
    self.player:render()
    love.graphics.printf("press Enter to play", 0, VIRTUAL_HEIGHT / 2 - 4,
                         VIRTUAL_WIDTH, "center")
end
