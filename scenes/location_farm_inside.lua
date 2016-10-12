-----------------------------------------------------------------------------------------
-- Окрестности машины
-- location_farm_inside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationFarmOutsideEvent = composer.newScene(); -- Создаём новую сцену

function LocationFarmOutsideEvent:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationFarmOutsideEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationFarmOutsideEvent, "img/location_farm_inside/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	-- Show key stuff
	foundStuff:showStuff('farmKey');

	-- Start zombie attack
	zombieAnimations:start('farm');
end

LocationFarmOutsideEvent:addEventListener("create", LocationFarmOutsideEvent); -- Создание сцены
return LocationFarmOutsideEvent;