-----------------------------------------------------------------------------------------
-- Машина
-- location2.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationBunkerEnterEvent1 = composer.newScene(); -- Создаём новую сцену

function LocationBunkerEnterEvent1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationBunkerScene = self.view; -- Группа
	local imgBackgroundLoc2 = display.newImage(grpLocationBunkerScene, "img/location_bunker_enter/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
end

LocationBunkerEnterEvent1:addEventListener("create", LocationBunkerEnterEvent1); -- Создание сцены
return LocationBunkerEnterEvent1;