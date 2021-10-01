StartState = Class {__includes = BaseState}

function StartState:init()
    self.menuItem = 1
self.colors = {
    [1] = {217/255, 87/255, 99/255, 255/255},
    [2] = {95/255, 205/255, 228/255, 255},
    [3] = {251/255, 242/255, 54/255, 255},
    [4] = {118/255, 66/255, 138/255, 255},
    [5] = {153/255, 229/255, 80/255, 255},
    [6] = {223/255, 113/255, 38/255, 255}
}

self.leterTable = {
    {'M', -108},
    {'A', -64},
    {'T', -28},
    {'C', 2},
    {'H', 40},
    {'3', 112}
}
self.colorTimer = 0
end



function StartState:update(dt)
    self.colorTimer = self.colorTimer + dt
    if self.colorTimer > 0.75 then
        self.colorTimer = 0
        self.colors[0] = self.colors[6]
        for i = 6,1, -1 do
            self.colors[i] = self.colors[i-1]
        end
    end

    if love.keyboard.wasPressed("up") or love.keyboard.wasPressed("down") then

    end

    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
    end
end

function StartState:render()
    love.graphics.setFont(gFonts["large"])
    for i = 1,6 do
love.graphics.setColor(self.colors[i])
love.graphics.printf(self.leterTable[i][1], 0,VIRTUAL_HEIGHT/2 , VIRTUAL_WIDTH+ self.leterTable[i][2], 'center')
    end
end
