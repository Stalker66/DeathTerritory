-----------------------------------------------------------------------------------------
-- Окрестности фермы
-- location_farm_outside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

local composer = require('composer');

-- СЦЕНЫ
local LocationFarmOutsideEvent = composer.newScene(); -- Создаём новую сцену

function LocationFarmOutsideEvent:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationFarmOutsideEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationFarmOutsideEvent, "img/location_farm_outside/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	local door = display.newRect(0, 0, 100, 150);
	door.x = display.contentCenterX - 170;
	door.y = display.contentCenterY + 150;
	door.alpha = globalConfig.alpha;
	door:addEventListener('touch', function(event)
		if event.phase == 'began' then
			-- @todo fix remove object after go to nex scene
			door.isVisible = false;

			composer.removeScene( "scenes.location_farm_outside" );
			composer.gotoScene('scenes.location_farm_inside');
		end
	end);
end

LocationFarmOutsideEvent:addEventListener("create", LocationFarmOutsideEvent); -- Создание сцены
return LocationFarmOutsideEvent;