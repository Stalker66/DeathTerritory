-----------------------------------------------------------------------------------------
-- Машина
-- location2.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationBunkerRoom2Event1 = composer.newScene(); -- Создаём новую сцену

function LocationBunkerRoom2Event1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpBunkerRoom2Scene = self.view; -- Группа
	local imgBackgroundLoc2 = display.newImage(grpBunkerRoom2Scene, "img/location_bunker_room_2/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	local back = display.newImage('img/common/back.png');
	back.x = display.contentWidth - back.width/2;
	back.y = display.contentHeight - back.height/2;
	back:addEventListener('touch', function(event)
		if event.phase == 'began' then
			if globalConfig.openedWindow == true then
				return;
			end
			
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_enter');
		end
	end);
	grpBunkerRoom2Scene:insert(back);

	local desk = display.newRect(grpBunkerRoom2Scene, 480, 390, 400, 380);
	desk.alpha = globalConfig.alpha;
	desk:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_3');
		end
	end);
	desk:addEventListener('tap', function() return true; end);

	-- Debug get position
	local debugRect = Debug:getMask();
	grpBunkerRoom2Scene:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBunkerRoom2Event1:addEventListener("create", LocationBunkerRoom2Event1); -- Создание сцены
return LocationBunkerRoom2Event1;