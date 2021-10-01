require "src.Dependencies"

WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600

VIRTUAL_HEIGHT = 243
VIRTUAL_WIDTH = 432

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

    gStateMachine:change("start")
end

function love.resize(w, h) push:resize(w, h) end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    local backgroundWidth = gTextures["background"]:getWidth()
    local backgroundHeight = gTextures["background"]:getHeight()
    love.graphics.setColor(242 / 255, 242 / 255, 170 / 255, 255)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
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
