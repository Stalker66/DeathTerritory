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

	local doorToRoom1 = display.newRect(grpLocationBunkerScene, 490, 342, 100, 160);
	doorToRoom1.alpha = globalConfig.alpha;
	doorToRoom1:addEventListener('tap', function() return true; end);
	doorToRoom1:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_1');
		end
	end);

	local doorToRoom2 = display.newRect(grpLocationBunkerScene, 988, 352, 180, 350);
	doorToRoom2.alpha = globalConfig.alpha;
	doorToRoom2:addEventListener('tap', function() return true; end);
	doorToRoom2:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_2');
		end
	end);

	weapon:pickUp('basementAx');

	-- Debug get position
	local debugRect = Debug:getMask();
	grpLocationBunkerScene:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBunkerEnterEvent1:addEventListener("create", LocationBunkerEnterEvent1); -- Создание сцены
return LocationBunkerEnterEvent1;