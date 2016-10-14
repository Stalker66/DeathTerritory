-----------------------------------------------------------------------------------------
-- Машина
-- location2.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationBunkerRoom4Event1 = composer.newScene(); -- Создаём новую сцену

function LocationBunkerRoom4Event1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpBunkerRoom4Scene = self.view; -- Группа
	local imgBackgroundLoc2 = display.newImage(grpBunkerRoom4Scene, "img/location_bunker_room_4/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
	print('Hello');
	local back = display.newImage('img/common/back.png');
	back.x = display.contentWidth - back.width/2;
	back.y = display.contentHeight - back.height/2;
	back:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_1');
		end
	end);
	grpBunkerRoom4Scene:insert(back);
end

LocationBunkerRoom4Event1:addEventListener("create", LocationBunkerRoom4Event1); -- Создание сцены
return LocationBunkerRoom4Event1;