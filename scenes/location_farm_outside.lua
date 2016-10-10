-----------------------------------------------------------------------------------------
-- Окрестности фермы
-- location_farm_outside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationFarmOutsideEvent = composer.newScene(); -- Создаём новую сцену

function LocationFarmOutsideEvent:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationFarmOutsideEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationFarmOutsideEvent, "img/location_farm_outside/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
end

LocationFarmOutsideEvent:addEventListener("create", LocationFarmOutsideEvent); -- Создание сцены
return LocationFarmOutsideEvent;