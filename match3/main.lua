require "src.Dependencies"

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600

VIRTUAL_HEIGHT = 243
VIRTUAL_WIDTH = 432
local stars = {}

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())
    love.window.setTitle("Breakout game")
    love.graphics.setFont(gFonts["small"])
    gSounds["music"]:play()
    gSounds["music"]:setLooping(true)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,
                     {fullscreen = false, resizable = true, vsync = true})

    love.keyboard.keysPressed = {}

    timer = 0

    gStateMachine:change("start")
end

function love.resize(w, h) push:resize(w, h) end

function love.update(dt)
    timer = timer + dt
    if timer > 0.3 then
        timer = 0
        table.insert(stars, Stars())
    end

    for k, star in pairs(stars) do star:update(dt) end
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    local backgroundWidth = gTextures["background"]:getWidth()
    local backgroundHeight = gTextures["background"]:getHeight()
    love.graphics.setColor(59 / 255, 57 / 255, 66 / 255, 255)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    for k, star in pairs(stars) do star:render() end
    love.graphics.setColor(255, 255, 255, 1)
    gStateMachine:render()
    displayFPS()
    push:finish()
end

function displayFPS()
    love.graphics.setFont(gFonts["small"])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print("FPS:  " .. tostring(love.timer.getFPS()), 10, 10)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == "escape" then love.event.quit() end
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end
