PlayState = Class {__includes = BaseState}

function PlayState:enter(params) self.player = params.player end

function PlayState:init()
    self.bullets = {}
    self.enemies = {}
    self.timer = 0
end

function PlayState:update(dt)
    self.timer = self.timer + dt
    if love.keyboard.wasPressed('space') then
        table.insert(self.bullets, Bullet(self.player.x, VIRTUAL_HEIGHT - 32))
        gSounds['fireSound']:play()
    end
    if self.timer > 2 then
        self.timer = 0
        table.insert(self.enemies,
                     Enemy(math.random(20, VIRTUAL_WIDTH - 20), 0,
                           math.random(-10, 10), math.random(15, 50)))
    end
    for k, enemy in pairs(self.enemies) do
        if enemy.remove then table.remove(self.enemies, k) end
        enemy:update(dt)
    end
    for k, bullet in pairs(self.bullets) do
        if bullet.remove then table.remove(self.bullets, k) end
        bullet:update(dt)
    end
    self.player:update(dt)
end

function PlayState:render()
    self.player:render()

    for k, enemy in pairs(self.enemies) do enemy:render() end
    for k, bullet in pairs(self.bullets) do bullet:render() end
end
