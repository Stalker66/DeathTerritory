-----------------------------------------------------------------------------------------
-- Окрестности машины
-- location_farm_inside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

local composer = require('composer');

-- СЦЕНЫ
local LocationFarmOutsideEvent = composer.newScene(); -- Создаём новую сцену

function LocationFarmOutsideEvent:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationFarmInsideEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationFarmInsideEvent, "img/location_farm_inside/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	local doorToOutside = display.newRect(0, 0, 120, 340);
	doorToOutside.x = doorToOutside.width/2 + 400;
	doorToOutside.y = doorToOutside.height/2 + 110;
	doorToOutside.alpha = globalConfig.alpha;
	doorToOutside:addEventListener('touch', function(event)
		if (event.phase ~= 'began' or globalConfig.openedWindow == true) then
			return;
		end

		foundStuff:hideStuff('farmKey');

		composer.removeScene('scenes.location_farm_inside');
		composer.gotoScene('scenes.location_farm_outside');
	end);
	grpLocationFarmInsideEvent:insert(doorToOutside);

	local wardrobe1 = display.newRect(0, 0, 180, 340);
	wardrobe1.x = wardrobe1.width/2 + 530;
	wardrobe1.y = wardrobe1.height/2 + 110;
	wardrobe1.alpha = globalConfig.alpha;
	wardrobe1:addEventListener('touch', function(event)
		if event.phase ~= 'began' then
			return;
		end

		tmr:showTimer();
	end);
	grpLocationFarmInsideEvent:insert(wardrobe1);

	local wardrobe2 = display.newRect(0, 0, 120, 300);
	wardrobe2.x = display.contentWidth - wardrobe2.width/2;
	wardrobe2.y = wardrobe2.height/2 + 110;
	wardrobe2.alpha = globalConfig.alpha;
	wardrobe2:addEventListener('touch', function(event)
		if event.phase ~= 'began' then
			return;
		end

		tmr:showTimer();
	end);
	grpLocationFarmInsideEvent:insert(wardrobe2);

	local basementDoor = display.newRect(0, 0, 200, 130);
	basementDoor.x = basementDoor.width/2 + 170;
	basementDoor.y = display.contentCenterY + basementDoor.height/2 + 110;
	basementDoor.alpha = globalConfig.alpha;
	basementDoor:addEventListener('touch', function(event)
		if (event.phase ~= 'began' or globalConfig.openedWindow == true) then
			return;
		end

		if foundStuff:getPickedUp('farmKey') then
			foundStuff:throwStuff('farmKey');
		else
			return;
		end

		composer.removeScene('scenes.location_farm_inside');
		composer.gotoScene('scenes.location_basement');
	end);
	grpLocationFarmInsideEvent:insert(basementDoor);

	-- Show key stuff
	foundStuff:showStuff('farmKey');

	-- Start zombie attack
	zombieAnimations:start('farm');
end

LocationFarmOutsideEvent:addEventListener("create", LocationFarmOutsideEvent); -- Создание сцены
return LocationFarmOutsideEvent;