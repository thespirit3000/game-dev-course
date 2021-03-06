require "src.Dependencies"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_HEIGHT = 243
VIRTUAL_WIDTH = 432

PADDLE_SPEED = 200

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())
    love.window.setTitle("Breakout game")
    love.graphics.setFont(gFonts["small"])
    gSounds["music"]:play()
    gSounds["music"]:setLooping(true)

    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        {fullscreen = false, resizable = true, vsync = true}
    )

    love.keyboard.keysPressed = {}

    gStateMachine:change("start")
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    local backgroundWidth = gTextures["background"]:getWidth()
    local backgroundHeight = gTextures["background"]:getHeight()
    love.graphics.draw(
        gTextures["background"],
        0, -- x starting point
        0, -- y starting point
        0, -- rotation
        VIRTUAL_WIDTH / (backgroundWidth - 1), --scale x
        VIRTUAL_HEIGHT / (backgroundHeight - 1) -- scale y
    )
    gStateMachine:render()
    displayFPS()
    push:finish()
end

function displayFPS()
    love.graphics.setFont(gFonts["small"])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print("FPS:  " .. tostring(love.timer.getFPS(), 10, 10))
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

function renderHealth(health)
    local healthX = VIRTUAL_WIDTH - 50
    for i = 1, 3 - health do
        love.graphics.draw(gTextures["hearts"], gFrames["hearts"][2], healthX, 0)
        healthX = healthX + 11
    end
    for i = 1, health do
        love.graphics.draw(gTextures["hearts"], gFrames["hearts"][1], healthX, 0)
        healthX = healthX + 11
    end
    -- body
end
function RenderScore(score)
    love.graphics.printf("Score:" .. tostring(score), 0, 0, VIRTUAL_WIDTH, "center")
end
