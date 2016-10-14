-----------------------------------------------------------------------------------------
-- Подвал
-- location_farm_outside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

local composer = require('composer');

-- СЦЕНЫ
local LocationBasementEvent = composer.newScene(); -- Создаём новую сцену

function LocationBasementEvent:create(event)
	globalConfig.canGo = true;

	-- ПЕРЕМЕННЫЕ
	local grpLocationBasementEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationBasementEvent, "img/location_basement/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	zombieAnimations:start('basement', {
		onComplete = function()
			globalConfig.canGo = true;
		end
	});

	local upDoor = display.newRect(0, 0, 185, 450);
	upDoor.x = upDoor.width/2 + 430;
	upDoor.y = upDoor.height/2 + 90;
	upDoor.alpha = globalConfig.alpha;
	upDoor:addEventListener('touch', function()
		if (not globalConfig.canGo or globalConfig.openedWindow == true) then
			return;
		end

		composer.gotoScene('scenes.location_farm_inside');
		composer.removeScene('scenes.location_basement');

		return true;
	end);
	upDoor:addEventListener('tap', function() return true; end);
	grpLocationBasementEvent:insert(upDoor);

	local tunnelDoor = display.newRect(0, 0, 250, 80);
	tunnelDoor.x = 910;
	tunnelDoor.y = display.contentHeight - tunnelDoor.height/2;
	tunnelDoor.alpha = globalConfig.alpha;
	tunnelDoor:addEventListener('touch', function()
		if (not globalConfig.canGo or globalConfig.openedWindow == true) then
			return;
		end
		
		composer.gotoScene('scenes.location_tunel_enter');
		composer.removeScene('scenes.location_basement');

		return true;
	end);
	tunnelDoor:addEventListener('tap', function() return true; end);
	grpLocationBasementEvent:insert(tunnelDoor);

	-- Ax weapon
	local axStash = display.newRect(0, 0, 150, 300);
	axStash.x = display.contentWidth - axStash.width/2 - 40;
	axStash.y = display.contentHeight - axStash.height/2;
	axStash.alpha = globalConfig.alpha;
	axStash:addEventListener('touch', function()
		tmr:showTimer(function()
			weapon:pickUp('basementAx');
		end);

		return true;
	end);
	axStash:addEventListener('tap', function() return true; end);
	grpLocationBasementEvent:insert(axStash);

	-- Debug get position
	local debugRect = Debug:getMask();
	grpLocationBasementEvent:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBasementEvent:addEventListener("create", LocationBasementEvent); -- Создание сцены
return LocationBasementEvent;