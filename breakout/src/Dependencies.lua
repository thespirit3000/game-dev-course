--
-- libraries
--
Class = require "lib.class"
push = require "lib.push"
require "src.Util"

require "src.Paddle"
require "src.Ball"
require "src.Brick"
require "src.LevelMaker"

require "src.StateMachine"
require "src.states.BaseState"
require "src.states.PlayState"
require "src.states.StartState"
require "src.states.PadleSelectState"
require "src.states.HightScoresState"
require "src.states.ServeState"
require "src.states.GameOverSate"

-- game states
gStateMachine =
    StateMachine {
    ["start"] = function()
        return StartState()
    end,
    ["play"] = function()
        return PlayState()
    end,
    ["padle-select"] = function()
        return PadleSelectState()
    end,
    ["hight-scores"] = function()
        return HightScoresState()
    end,
    ["serve"] = function()
        return ServeState()
    end,
    ["game-over"] = function()
        return GameOverState()
        -- body
    end
}

gSounds = {
    ["paddle-hit"] = love.audio.newSource("sounds/paddle_hit.wav", "static"),
    ["score"] = love.audio.newSource("sounds/score.wav", "static"),
    ["wall-hit"] = love.audio.newSource("sounds/wall_hit.wav", "static"),
    ["confirm"] = love.audio.newSource("sounds/confirm.wav", "static"),
    ["select"] = love.audio.newSource("sounds/select.wav", "static"),
    ["no-select"] = love.audio.newSource("sounds/no-select.wav", "static"),
    ["brick-hit-1"] = love.audio.newSource("sounds/brick-hit-1.wav", "static"),
    ["brick-hit-2"] = love.audio.newSource("sounds/brick-hit-2.wav", "static"),
    ["hurt"] = love.audio.newSource("sounds/hurt.wav", "static"),
    ["victory"] = love.audio.newSource("sounds/victory.wav", "static"),
    ["recover"] = love.audio.newSource("sounds/recover.wav", "static"),
    ["high-score"] = love.audio.newSource("sounds/high_score.wav", "static"),
    ["pause"] = love.audio.newSource("sounds/pause.wav", "static"),
    ["music"] = love.audio.newSource("sounds/music.wav", "static")
}

gTextures = {
    ["arrows"] = love.graphics.newImage("graphics/arrows.png"),
    ["background"] = love.graphics.newImage("graphics/background.png"),
    ["blocks"] = love.graphics.newImage("graphics/blocks.png"),
    ["main"] = love.graphics.newImage("graphics/breakout.png"),
    ["hearts"] = love.graphics.newImage("graphics/hearts.png"),
    ["particle"] = love.graphics.newImage("graphics/particle.png"),
    ["ui"] = love.graphics.newImage("graphics/ui.png")
}
gFrames = {
    ["paddles"] = GenerateQuadsPaddles(gTextures["main"]),
    ["balls"] = GenerateQuadsBalls(gTextures["main"]),
    ["bricks"] = GenerateQuadsBricks(gTextures["main"]),
    ["hearts"] = GenerateQuads(gTextures["hearts"], 10, 9)
}

gFonts = {
    ["small"] = love.graphics.newFont("fonts/font.ttf", 8),
    ["medium"] = love.graphics.newFont("fonts/font.ttf", 16),
    ["large"] = love.graphics.newFont("fonts/font.ttf", 32)
}
