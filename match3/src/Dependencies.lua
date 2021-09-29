--
-- libraries
--
Class = require "lib.class"
push = require "lib.push"
Timer = require("lib.knife.timer")

-- utility
-- require 'src/StateMachine'
-- require 'src/Util'

-- game states
-- require 'src/states/BaseState'
-- require 'src/states/BeginGameState'
-- require 'src/states/HighScoresState'
-- require 'src/states/PlayState'
-- require 'src/states/StartState'

-- management
-- require 'src/ScoreManager'

gSounds = {}

gTextures = {}

-- this time, we're keeping our fonts in a global table for readability
gFonts = {
    ["small"] = love.graphics.newFont("fonts/font.ttf", 8),
    ["medium"] = love.graphics.newFont("fonts/font.ttf", 16),
    ["large"] = love.graphics.newFont("fonts/font.ttf", 32)
}

-- global score manager to access between states
-- gScoreManager = ScoreManager()
