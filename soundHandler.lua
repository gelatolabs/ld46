function setupSound()
	titleMusic1 = love.audio.newSource("assets/music/title-intro.ogg", "stream")
	titleMusic2 = love.audio.newSource("assets/music/title-loop.ogg", "stream")
	mapleIntro = love.audio.newSource("assets/music/Maple_Syruptitle.wav", "stream")
	sorryMusic = love.audio.newSource("assets/music/Canadian_Sorry.wav", "stream")
	wasteMusic = love.audio.newSource("assets/music/WASTELAND.wav", "stream")
	
	mapMusic = {sorryMusic}
	
	mapMusicCount = 0
	
	for i in pairs(mapMusic) do
		mapMusicCount = mapMusicCount + 1
	end

	mapleIntro:play()
	currentMusic = "menu"
end

function soundManager()
	if gamePhase == "menu" then
		if not (currentMusic == "menu") then
			currentMusic = "menu"
			love.audio.stop()
		end
		if not mapleIntro:isPlaying() and currentMusic == "menu" then
			mapleIntro:play()
		end
	end
	if gamePhase == "storyline" then
		if not (currentMusic == "storyline") then
			currentMusic = "storyline"
			love.audio.stop()
		end
		if not titleMusic1:isPlaying() and currentMusic == "storyline" then
			titleMusic1:play()
		end		
	end
	if gamePhase == "aboot" then
		if not (currentMusic == "aboot") then
			currentMusic = "aboot"
			love.audio.stop()
		end
		if not wasteMusic:isPlaying() and currentMusic == "aboot" then
			wasteMusic:play()
		end		
	end
	if gamePhase == "map" then
		if not (currentMusic == "mapType") then
			currentMusic = "mapType"
			love.audio.stop()
		end
		if love.audio.getActiveSourceCount() == 0 then
			mapMusic[math.random(mapMusicCount)]:play()
		end
	end
end
