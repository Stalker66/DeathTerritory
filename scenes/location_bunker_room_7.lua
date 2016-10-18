-----------------------------------------------------------------------------------------
-- Машина
-- location2.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationBunkerRoom7Event1 = composer.newScene(); -- Создаём новую сцену

function LocationBunkerRoom7Event1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpBunkerRoom7Scene = self.view; -- Группа
	local imgBackgroundLoc2 = display.newImage(grpBunkerRoom7Scene, "img/location_bunker_room_7/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
	
	local back = display.newImage('img/common/back.png');
	back.x = display.contentWidth - back.width/2;
	back.y = display.contentHeight - back.height/2;
	back:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_4');
		end
	end);
	grpBunkerRoom7Scene:insert(back);

	local door1 = display.newRect(grpBunkerRoom7Scene, 600, 294, 175, 300);
	door1.alpha = globalConfig.alpha;
	door1:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_outside');
		end
	end);

	-- Debug get position
	local debugRect = Debug:getMask();
	grpBunkerRoom7Scene:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBunkerRoom7Event1:addEventListener("create", LocationBunkerRoom7Event1); -- Создание сцены
return LocationBunkerRoom7Event1;