function love.load()
 x = 0
 y = 0
 yinc = 0
 userxspeed = 0
 useryspeed = 0
 userx = 300
 usery = 200
end

function love.update()
 -- =================== Bouncy box code
	yinc = yinc + 0.1
	if x > 800 then
		x = -200
	else
		x = x + 2
	end
	y = (240 * math.cos(yinc)) + 200
-- ==================== End Bouncy box code

-- ==================== Character Triangle code

-- Shitty ass way of preventing drift of character
	if math.abs(userxspeed) < 0.1 then
		userxspeed = 0
	end
	
	if math.abs(useryspeed) < 0.1 then
		useryspeed = 0
	end
	
	
-- Keyboard control code	
	if love.keyboard.isDown("left") then
		userxspeed = userxspeed - .2
	end
	if love.keyboard.isDown("right") then
		userxspeed = userxspeed + .2
	end
	if love.keyboard.isDown("up") then
		useryspeed = useryspeed - .2
	end
	if love.keyboard.isDown("down") then
		useryspeed = useryspeed + .2
	end
	
	
-- Idle/"friction" effect
	if userxspeed > 0 then
		userxspeed = userxspeed - .1
	elseif userxspeed < 0 then
		userxspeed = userxspeed + .1
	end
	
	if useryspeed > 0 then
		useryspeed = useryspeed - .1
	elseif useryspeed < 0 then
		useryspeed = useryspeed + .1
	end
	
-- Character is leaving bounds of screen, put them on opposite side	
	if userx < -45 then
		userx = 795
	elseif userx > 795 then
		userx = -45
	else
		userx = userx + userxspeed
	end
	if usery < -45 then
		usery = 595
	elseif usery > 595 then
		usery = -45
	else
		usery = usery + useryspeed
	end
	usery = usery + useryspeed
	
end

function love.draw()
	love.graphics.rectangle("line", x,y, 200, 150)
	love.graphics.polygon("fill", userx, usery, userx + 50, usery, userx + 25, usery + 50)
end