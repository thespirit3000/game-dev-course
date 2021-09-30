ServeState = Class {__includes = BaseState}

function ServeState:enter(params)
    self.paddle = params.paddle
    self.bricks = params.bricks
    self.health = params.health
    self.score = params.score
    self.ball = Ball(math.random(7))
end
function ServeState:update(dt)
    self.paddle:update(dt)
    self.ball.x = self.paddle.x + (self.paddle.width / 2) - self.ball.width / 2
    self.ball.y = self.paddle.y - self.ball.height
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change(
            "play",
            {
                paddle = self.paddle,
                bricks = self.bricks,
                health = self.health,
                score = self.score,
                ball = self.ball
            }
        )
    end
end
function ServeState:render()
    self.paddle:render()
    self.ball:render()
    brickRender(self.bricks)
    renderHealth(self.health)
    love.graphics.setFont(gFonts["medium"])
    love.graphics.printf("press Enter", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, "center")
end
