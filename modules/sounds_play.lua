-----------------------------------------------------------------------------------------
-- Запуск звуков
-- sounds_play.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------
Sounds_Play = {
	-- Music
	main_menu = audio.loadSound( "snd/menu.mp3" ),
	-- Interaction
	button = audio.loadSound( "snd/interaction/button.mp3" ),
	glass = audio.loadSound( "snd/interaction/glass.mp3" ),
	metal = audio.loadSound( "snd/interaction/metal.mp3" ),
	step = audio.loadSound( "snd/interaction/step.mp3" ),
	wood = audio.loadSound( "snd/interaction/wood.mp3" ),
	-- Others
	timer = audio.loadSound( "snd/others/timer.wav" ),
	wrote = audio.loadSound( "snd/others/wrote.mp3" ),
	give = audio.loadSound( "snd/others/give.mp3" )
}

Sounds_Play.metatable = {}
Sounds_Play.metatable.__index = Sounds_Play;

-- Play sound
function Sounds_Play:play(name)
	audio.play( Sounds_Play[name] );
end

return Sounds_Play;