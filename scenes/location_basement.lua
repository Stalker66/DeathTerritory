-----------------------------------------------------------------------------------------
-- Подвал
-- location_farm_outside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationFarmOutsideEvent = composer.newScene(); -- Создаём новую сцену

function LocationFarmOutsideEvent:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationFarmOutsideEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationFarmOutsideEvent, "img/location_basement/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	zombieAnimations:start('spirit', {
		onComplete = function()
			print('On complete');
		end
	});
end

LocationFarmOutsideEvent:addEventListener("create", LocationFarmOutsideEvent); -- Создание сцены
return LocationFarmOutsideEvent;