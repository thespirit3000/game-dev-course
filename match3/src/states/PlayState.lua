PlayState = Class {__includes = BaseState}

function PlayState:enter(params)
    self.paddle = params.paddle
    self.ball = params.ball
    self.health = params.health
    self.bricks = params.bricks
    self.score = params.score
    self.ball.dx = math.random(-200, 200)
    self.ball.dy = math.random(-50, -60)
end

function PlayState:init()
    self.paused = false
end

function PlayState:update(dt)
    if self.paused then
        if love.keyboard.wasPressed("space") then
            self.paused = false
            gSounds["pause"]:play()
        else
            return
        end
    elseif love.keyboard.wasPressed("space") then
        self.paused = true
        gSounds["pause"]:play()
    end
    if self.ball:collides(self.paddle) then
        self.ball.y = self.paddle.y - self.ball.height
        self.ball.dy = -self.ball.dy
        if self.ball.x < self.paddle.x + (self.paddle.width / 2) and self.ball.dx < 0 then
            self.ball.dx = -50 + -(8 * (self.paddle.x + self.paddle.width / 2 - self.ball.x))
        end
        if self.ball.x > self.paddle.x + (self.paddle.width / 2) and self.ball.dx > 0 then
            self.ball.dx = 50 + (8 * math.abs(self.paddle.x + self.paddle.width / 2 - self.ball.x))
        end
        gSounds["paddle-hit"]:play()
    end
    for k, brick in pairs(self.bricks) do
        if brick.inGame and self.ball:collides(brick) then
            brick:hit()
            self.score = self.score + 10
            if self.ball.x < brick.x and self.ball.dx > 0 then
                self.ball.dx = -self.ball.dx
                self.ball.x = brick.x - self.ball.width
            elseif self.ball.x + 6 > brick.x + brick.width and self.ball.dx < 0 then
                self.ball.dx = -self.ball.dx
                self.ball.x = brick.x + brick.width
            elseif self.ball.y < brick.y then
                self.ball.dy = -self.ball.dy
                self.ball.y = brick.y - self.ball.height
            else
                self.ball.dy = -self.ball.dy
                self.ball.y = brick.y + brick.height
            end
            self.ball.dy = self.ball.dy * 1.02
            self.ball.dx = self.ball.dx * 1.02
        end
    end
    if self.ball.y > self.paddle.y + self.paddle.height + 4 then
        self.ball:reset()
        gSounds["hurt"]:play()
        self.health = self.health - 1
        if self.health == 0 then
            gStateMachine:change("game-over", {score = self.score})
        else
            gStateMachine:change(
                "serve",
                {
                    paddle = self.paddle,
                    bricks = self.bricks,
                    health = self.health,
                    score = self.score
                }
            )
        end
    end

    self.paddle:update(dt)
    self.ball:update(dt)
end

function PlayState:render()
    self.paddle:render()
    self.ball:render()
    brickRender(self.bricks)

    if self.paused then
        love.graphics.setFont(gFonts["large"])
        love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, "center")
    end

    renderHealth(self.health)
    RenderScore(self.score)
end
