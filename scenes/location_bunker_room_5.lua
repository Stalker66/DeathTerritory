-----------------------------------------------------------------------------------------
-- Окрестности машины
-- location_farm_inside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

local composer = require('composer');

-- СЦЕНЫ
local LocationBunkerRooom5Event = composer.newScene(); -- Создаём новую сцену

function LocationBunkerRooom5Event:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationBunkerRooom5Event = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationBunkerRooom5Event, "img/location_bunker_room_5/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	-- Start zombie attack
	zombieAnimations:start('bunker_room_5');
	
	local back = display.newImage('img/common/back.png');
	back.x = display.contentWidth - back.width/2;
	back.y = display.contentHeight - back.height/2;
	back:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_4');
		end
	end);
	grpLocationBunkerRooom5Event:insert(back);

	-- Debug get position
	local debugRect = Debug:getMask();
	grpLocationBunkerRooom5Event:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBunkerRooom5Event:addEventListener("create", LocationBunkerRooom5Event); -- Создание сцены
return LocationBunkerRooom5Event;