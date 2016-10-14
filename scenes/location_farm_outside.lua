-----------------------------------------------------------------------------------------
-- Окрестности фермы
-- location_farm_outside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

local composer = require('composer');

-- СЦЕНЫ
local LocationFarmOutsideEvent = composer.newScene(); -- Создаём новую сцену

function LocationFarmOutsideEvent:create(event)
	diary:showDiaryIcon();
	inventory:showInventoryIcon();

	-- ПЕРЕМЕННЫЕ
	local grpLocationFarmOutsideEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationFarmOutsideEvent, "img/location_farm_outside/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	local door = display.newRect(0, 0, 100, 150);
	door.x = display.contentCenterX - 170;
	door.y = display.contentCenterY + 150;
	door.alpha = globalConfig.alpha;
	door:addEventListener('touch', function(event)
		if event.phase == 'began' then
			if not globalConfig.canGo then
				return;
			end
			
			composer.gotoScene('scenes.location_farm_inside');
			composer.removeScene("scenes.location_farm_outside");
		end
	end);
	grpLocationFarmOutsideEvent:insert(door);

	local car = display.newRect(0, 0, 200, 110);
	car.x = display.contentCenterX + car.width + 130;
	car.y = display.contentCenterY + 210;
	car.alpha = globalConfig.alpha;
	car:addEventListener('touch', function(event)
		if event.phase == 'began' then
			globalConfig.canGo = false;

			tmr:showTimer(function()
				globalConfig.canGo = true;
				weapon:pickUp('wrench');
			end);
		end
	end);
	grpLocationFarmOutsideEvent:insert(car);
	
	displayGroup:toFront();
end

LocationFarmOutsideEvent:addEventListener("create", LocationFarmOutsideEvent); -- Создание сцены
return LocationFarmOutsideEvent;