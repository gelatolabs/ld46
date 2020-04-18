function setupSound()
	titleMusic1 = love.audio.newSource("assets/music/title-intro.ogg", "stream")
	titleMusic2 = love.audio.newSource("assets/music/title-loop.ogg", "stream")

	titleMusic1:play()
	currentMusic = "titlemusic1"
end

function soundManager()
	if gamePhase == "menu" then
		if not titleMusic1:isPlaying() and not titleMusic2:isPlaying() then
			titleMusic2:play()
		end
	end
end
