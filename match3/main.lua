require("src.Dependencies")

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 216

function love.load()
    intervals = {1, 2, 4, 3, 2, 8}
    counters = {0, 0, 0, 0, 0, 0}
    for i = 1, 6 do
        Timer.every(
            intervals[i],
            function()
                counters[i] = counters[i] + 1
            end
        )
    end
    love.graphics.setDefaultFilter("nearest", "nearest")
    currentSecond = 0
    secondTimer = 0
    love.window.setTitle("Match 3 Game")
    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        {fullscreen = false, resizable = false, vsync = true}
    )

    gameState = "start"
end

function love.update(dt)
    secondTimer = secondTimer + dt
    if secondTimer > 1 then
        currentSecond = currentSecond + 1
        secondTimer = secondTimer % 1
    end
    Timer.update(dt)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "enter" or key == "return" then
        if gameState == "start" then
            gameState = "play"
        else
            gameState = "start"
        end
    end
end

function love.draw()
    push:start()
    love.graphics.clear(0, 0, 0, 255)
    love.graphics.setFont(gFonts["small"])
    for i = 1, 6 do
        love.graphics.printf(
            "Timer " .. tostring(counters[i]) .. " seconds (every) " .. tostring(intervals[i]),
            0,
            16 * i,
            VIRTUAL_WIDTH,
            "center"
        )
    end
    displayFPS()
    push:finish()
end

function love.resize(w, h)
    push:resize(w, h)
end

function displayFPS()
    love.graphics.setFont(gFonts["small"])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print("FPS:  " .. tostring(love.timer.getFPS(), 10, 10))
end
