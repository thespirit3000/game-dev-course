--
-- libraries
--
Class = require "lib.class"
push = require "lib.push"

require "src.Bird"
require "src.Pipe"
require "src.PipePair"
require("src.StateMachine")
require("src.states.BaseState")
require("src.states.PlayState")
require "src.states.ScoreState"
require("src.states.CountDownState")
require("src.states.TitleScreenState")

-- game states
gStateMachine =
    StateMachine {
    ["play"] = function()
        return PlayState()
    end,
    ["timer"] = function()
        return CountDownState()
    end,
    ["title"] = function()
        return TitleScreenState()
    end,
    ["score"] = function()
        return ScoreState()
    end
}

-- management
-- require 'src/ScoreManager'

gSounds = {
    ["jump"] = love.audio.newSource("sounds/jump.wav", "static"),
    ["explosion"] = love.audio.newSource("sounds/explosion.wav", "static"),
    ["hurt"] = love.audio.newSource("sounds/hurt.wav", "static"),
    ["score"] = love.audio.newSource("sounds/score.wav", "static"),
    ["main"] = love.audio.newSource("sounds/mario-s-way.mp3", "static")
}

gTextures = {
    ["bird"] = love.graphics.newImage("graphics/bird.png"),
    ["background"] = love.graphics.newImage("graphics/background.png"),
    ["ground"] = love.graphics.newImage("graphics/ground.png"),
    ["pipe"] = love.graphics.newImage("graphics/pipe.png")
}

-- this time, we're keeping our fonts in a global table for readability
gFonts = {
    ["small"] = love.graphics.newFont("fonts/font.ttf", 8),
    ["medium"] = love.graphics.newFont("fonts/font.ttf", 16),
    ["large"] = love.graphics.newFont("fonts/font.ttf", 32)
}

-- global score manager to access between states
-- gScoreManager = ScoreManager()
