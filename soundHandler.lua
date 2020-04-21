function setupSound()
	introMusic   = love.audio.newSource("assets/music/intro.ogg",   "stream")
	menuMusic    = love.audio.newSource("assets/music/menu.ogg",    "stream")
	storyMusic   = love.audio.newSource("assets/music/story.wav",   "stream")
	creditsMusic = love.audio.newSource("assets/music/credits.wav", "stream")
	mainMusic    = love.audio.newSource("assets/music/main.wav",    "stream")
	level3Music  = love.audio.newSource("assets/music/level3.wav",  "stream")
	level6Music  = love.audio.newSource("assets/music/level6.wav",  "stream")
	
	introMusic:play()
	currentMusic = "intro"
end

function soundManager()
	if gamePhase == "menu" then
		if not (currentMusic == "menu") then
			currentMusic = "menu"
			love.audio.stop()
		end
		if not menuMusic:isPlaying() and currentMusic == "menu" then
			menuMusic:play()
		end
	end
	if gamePhase == "storyline" then
		if not (currentMusic == "story") then
			currentMusic = "story"
			love.audio.stop()
		end
		if not storyMusic:isPlaying() and currentMusic == "story" then
			storyMusic:play()
		end
	end
	if gamePhase == "aboot" then
		if not (currentMusic == "credits") then
			currentMusic = "credits"
			love.audio.stop()
		end
		if not creditsMusic:isPlaying() and currentMusic == "credits" then
			creditsMusic:play()
		end
	end
	if gamePhase == "map" then
		if level == "level3" then
			if not (currentMusic == "level3") then
				currentMusic = "level3"
				love.audio.stop()
			end
			if not level3Music:isPlaying() and currentMusic == "level3" then
				level3Music:play()
			end
		elseif level == "level6" then
			if not (currentMusic == "level6") then
				currentMusic = "level6"
				love.audio.stop()
			end
			if not level6Music:isPlaying() and currentMusic == "level6" then
				level6Music:play()
			end
		else
			if not (currentMusic == "main") then
				currentMusic = "main"
				love.audio.stop()
			end
			if not mainMusic:isPlaying() and currentMusic == "main" then
				mainMusic:play()
			end
		end
	end
end
