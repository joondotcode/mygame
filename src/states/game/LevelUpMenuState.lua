LevelUpMenuState = Class{__includes = BaseState}

function LevelUpMenuState:init(def)
	self.levelUpMenu = Menu {
		x = 30,
		y = 15,
		width = 150,
		height = 100,
		items = def.statItems,
		cursorEnabled = false
	}
	self.onClose = def.onClose
end

function LevelUpMenuState:update(dt)
	self.levelUpMenu:update(dt)

	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateStack:pop()
		self:onClose()
	end
end

function LevelUpMenuState:render()
	self.levelUpMenu:render()
end