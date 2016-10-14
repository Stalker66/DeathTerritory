-----------------------------------------------------------------------------------------
-- Окрестности машины
-- location_farm_inside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

local composer = require('composer');

-- СЦЕНЫ
local LocationTunelEvent = composer.newScene(); -- Создаём новую сцену

function LocationTunelEvent:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationTunelEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationTunelEvent, "img/location_tunel_enter/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	-- weapon:pickUp('basementAx', function()
	-- 	weapon:attack('tunelEnter', {
	-- 		onComplete = function() end
	-- 	});
	-- end);

	-- Start zombie attack
	zombieAnimations:start('tunelEnter');

	local tunelDoor = display.newRect(0, 0, 100, 200);
	tunelDoor.x = display.contentCenterX;
	tunelDoor.y = display.contentCenterY;
	tunelDoor.alpha = globalConfig.alpha;
	tunelDoor:addEventListener('tap', function() return true; end);
	tunelDoor:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_tunel_door');
		end
	end);
	grpLocationTunelEvent:insert(tunelDoor);
	
	-- Debug get position
	local debugRect = Debug:getMask();
	grpLocationTunelEvent:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationTunelEvent:addEventListener("create", LocationTunelEvent); -- Создание сцены
return LocationTunelEvent;