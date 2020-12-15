--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Player = Class{__includes = Entity}

function Player:init(def)
    Entity.init(self, def)

    self.objectHitbox = Hitbox(self.x, self.y, 16, 16)

    Event.on('heartConsume', function()
        self.health = math.min(6, self.health + 2)
    end)
end

function Player:update(dt)
    Entity.update(self, dt)

    self.objectHitbox.x, self.objectHitbox.y = self.x, self.y
    if self.direction == 'left' then
        self.objectHitbox.x = self.objectHitbox.x - 16
    elseif self.direction == 'right' then
        self.objectHitbox.x = self.objectHitbox.x + 16
    elseif self.direction == 'up' then
        self.objectHitbox.y = self.objectHitbox.y - 16
    elseif self.direction == 'down' then
        self.objectHitbox.y = self.objectHitbox.y + 16
    end

    if love.keyboard.wasPressed('z') then
        Event.dispatch('grabPot', self.objectHitbox)
    end
end

function Player:collides(target)
    local selfY, selfHeight = self.y + self.height / 2, self.height - self.height / 2
    
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                selfY + selfHeight < target.y or selfY > target.y + target.height)
end

function Player:render()
    Entity.render(self)
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end