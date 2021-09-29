require "src.Dependencies"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_HEIGHT = 243
VIRTUAL_WIDTH = 432
local backgroundScroll = 0
local groundScroll = 0
local BACKGROUND_SPEED = 30
local GROUND_SPEED = 60
local BACKGROUND_LOOPING_POINT = 514

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())
    love.window.setTitle("Bird")
    love.graphics.setFont(gFonts["small"])

    gSounds["main"]:setLooping(true)
    gSounds["main"]:play()

    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        {fullscreen = false, resizable = true, vsync = true}
    )

    love.keyboard.keysPressed = {}

    gStateMachine:change("title")
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)
    backgroundScroll = (backgroundScroll + BACKGROUND_SPEED * dt) % BACKGROUND_LOOPING_POINT
    groundScroll = (groundScroll + GROUND_SPEED * dt) % VIRTUAL_WIDTH
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == "escape" then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end
function love.draw()
    push:start()
    love.graphics.draw(gTextures["background"], -backgroundScroll, 0)

    gStateMachine:render()
    love.graphics.draw(gTextures["ground"], -groundScroll, VIRTUAL_HEIGHT - 16)

    displayFPS()
    push:finish()
end

function displayFPS()
    love.graphics.setFont(gFonts["small"])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print("FPS:  " .. tostring(love.timer.getFPS(), 10, 10))
end
