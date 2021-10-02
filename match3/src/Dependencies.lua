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

require("src.Ship")
require("src.Bullet")
require("src.Enemy")
require("src.Stars")

-- game states
gStateMachine = StateMachine {
    ["start"] = function() return StartState() end,
    ["play"] = function() return PlayState() end,
    ["hight-scores"] = function() return HightScoresState() end,
    ["serve"] = function() return ServeState() end,
    ["game-over"] = function() return GameOverState() end
}

gSounds = {
    ["music"] = love.audio.newSource("sounds/music.wav", "static"),
    ['fireSound'] = love.audio.newSource('sounds/paddle_hit.wav', 'static')
}

gTextures = {
    ["background"] = love.graphics.newImage("graphics/background.png"),
    ['main'] = love.graphics.newImage('graphics/tiny.png')
}
gFrames = {
    ['sprites'] = GenerateQuads(gTextures['main'], 16, 16),
    ["bullets"] = GenerateQuadsBullets(gTextures['main']),
    ["enemies"] = GenerateQuadsEnemies(gTextures['main'])
}

gFonts = {
    ["small"] = love.graphics.newFont("fonts/font.ttf", 8),
    ["medium"] = love.graphics.newFont("fonts/font.ttf", 16),
    ["large"] = love.graphics.newFont("fonts/font.ttf", 32)
}

gIntervals = {0.5, 0.2, 1, 2, 4}
