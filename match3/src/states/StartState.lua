StartState = Class {__includes = BaseState}

function StartState:init()
    self.menuItem = 1
    self.colors = {
        [1] = {217 / 255, 87 / 255, 99 / 255, 255 / 255},
        [2] = {95 / 255, 205 / 255, 228 / 255, 255},
        [3] = {251 / 255, 242 / 255, 54 / 255, 255},
        [4] = {118 / 255, 66 / 255, 138 / 255, 255},
        [5] = {153 / 255, 229 / 255, 80 / 255, 255},
        [6] = {223 / 255, 113 / 255, 38 / 255, 255}
    }

    self.leterTable = {
        {'S', -108}, {'P', -64}, {'A', -28}, {'C', 2}, {'E', 40}, {'3', 112}
    }
    self.backgroundY = -64
    self.transitionAlpha = 0
    self.colorTimer = 0
    TIMER.tween(3, {[self] = {backgroundY = VIRTUAL_HEIGHT / 2 - 16}})
end

function StartState:update(dt)
    TIMER.update(dt)
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        TIMER.tween(1, {[self] = {transitionAlpha = 1}}):finish(function()
            gStateMachine:change("serve", {player = Ship(VIRTUAL_WIDTH / 2 - 8)})
        end)
    end
    self.colorTimer = self.colorTimer + dt
    if self.colorTimer > 0.5 then
        self.colorTimer = 0
        self.colors[0] = self.colors[6]
        for i = 6, 1, -1 do self.colors[i] = self.colors[i - 1] end
    end
end

function StartState:render() self:drawTitle() end

function StartState:drawTitle(y)
    love.graphics.setFont(gFonts["large"])
    for i = 1, 6 do
        love.graphics.setColor(self.colors[i])
        love.graphics.printf(self.leterTable[i][1], 0, self.backgroundY,
                             VIRTUAL_WIDTH + self.leterTable[i][2], 'center')
    end
    love.graphics.setColor(0, 0, 0, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end
