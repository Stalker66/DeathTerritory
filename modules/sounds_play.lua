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

local cannelMusic;
local channelSound1;
local channelSound2;
local channelSound3;

-- Play sound
function Sounds_Play:play(name,type)
	if type == "music" then
		cannelMusic = audio.play( Sounds_Play[name] );
	elseif type == "snd1" then
		channelSound1 = audio.play( Sounds_Play[name] );
	elseif type == "snd2" then
		channelSound2 = audio.play( Sounds_Play[name] );
	elseif type == "snd3" then
		channelSound3 = audio.play( Sounds_Play[name] );
	end
end

-- Pause sound
function Sounds_Play:pause(name,type)
	if type == "music" then
		audio.pause( cannelMusic );
	elseif type == "snd1" then
		audio.pause( channelSound1 );
	elseif type == "snd2" then
		audio.pause( channelSound2 );
	elseif type == "snd3" then
		audio.pause( channelSound3 );
	end
end

-- Resume sound
function Sounds_Play:resume(name,type)
	if type == "music" then
		audio.resume( cannelMusic );
	elseif type == "snd1" then
		audio.resume( channelSound1 );
	elseif type == "snd2" then
		audio.resume( channelSound2 );
	elseif type == "snd3" then
		audio.resume( channelSound3 );
	end
end

-- Stop sound
function Sounds_Play:stop(name,type)
	if type == "music" then
		audio.stop( cannelMusic );
	elseif type == "snd1" then
		audio.stop( channelSound1 );
	elseif type == "snd2" then
		audio.stop( channelSound2 );
	elseif type == "snd3" then
		audio.stop( channelSound3 );
	end
end

-- Off sound
function Sounds_Play:off()
	audio.setVolume( 0 );
end

-- On sound
function Sounds_Play:on()
	audio.setVolume( 1 );
end

return Sounds_Play;