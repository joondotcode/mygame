Powerup = Class{}

function Powerup:init(x, y, icon)
	-- this will return true if the Ball hits the Block 5 times
	self.trigger = true

	self.width = 16
	self.height = 16

	self.x = x
	self.y = y
	self.dy = 40
	self.dx = 0

	self.icon = icon

end

function Powerup:collides(target)
	if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or self.y + self.height < target.y then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

function Powerup:update(dt)
	-- Powerup dropping to the floor
	if self.y < VIRTUAL_HEIGHT then
		self.y = self.y + self.dy * dt
	end
end

function Powerup:render()
	if self.trigger then
		love.graphics.draw(gTextures['main'], gFrames['powerup'][self.icon], self.x, self.y)
	end
end
