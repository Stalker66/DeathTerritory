-----------------------------------------------------------------------------------------
-- Окрестности машины
-- location_farm_inside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

local composer = require('composer');

-- СЦЕНЫ
local LocationBunkerRooom6Event = composer.newScene(); -- Создаём новую сцену

function LocationBunkerRooom6Event:create(event)
	-- ПЕРЕМЕННЫЕ
	local LocationBunkerRooom6Event = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(LocationBunkerRooom6Event, "img/location_bunker_room_6/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	weapon:pickUp('basementAx', function()
		
	end);

	-- Start zombie attack
	zombieAnimations:start('bunker_room_6');
	
	local back = display.newImage('img/common/back.png');
	back.x = display.contentWidth - back.width/2;
	back.y = display.contentHeight - back.height/2;
	back:addEventListener('touch', function(event)
		if event.phase == 'began' then
			foundStuff:hideStuff('bunkerRoom6Key');

			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_4');
		end
	end);
	LocationBunkerRooom6Event:insert(back);

	-- Show key stuff
	foundStuff:showStuff('bunkerRoom6Key');

	-- Debug get position
	local debugRect = Debug:getMask();
	LocationBunkerRooom6Event:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBunkerRooom6Event:addEventListener("create", LocationBunkerRooom6Event); -- Создание сцены
return LocationBunkerRooom6Event;