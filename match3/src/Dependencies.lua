Class = require "lib.class"
push = require "lib.push"
require "src.Util"
TIMER = require 'lib.knife.timer'

require "src.StateMachine"
require "src.states.BaseState"
require "src.states.PlayState"
require "src.states.StartState"
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
    ["hight-scores"] = function()
        return HightScoresState()
    end,
    ["serve"] = function()
        return ServeState()
    end,
    ["game-over"] = function()
        return GameOverState()
    end
}

gSounds = {
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
