-----------------------------------------------------------------------------------------
-- Машина
-- location2.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationBunkerRoom1Event1 = composer.newScene(); -- Создаём новую сцену

function LocationBunkerRoom1Event1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpBunkerRoom1Scene = self.view; -- Группа
	local imgBackgroundLoc2 = display.newImage(grpBunkerRoom1Scene, "img/location_bunker_room_1/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	local back = display.newImage('img/common/back.png');
	back.x = display.contentWidth - back.width/2;
	back.y = display.contentHeight - back.height/2;
	back:addEventListener('touch', function(event)
		if event.phase == 'began' then
			if globalConfig.openedWindow == true then
				return;
			end
			
			inventory:hideFindStuff('scheme');

			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_enter');
		end
	end);
	grpBunkerRoom1Scene:insert(back);

	local door = display.newRect(grpBunkerRoom1Scene, 330, 320, 200, 430);
	door.rotation = -1;
	door.alpha = globalConfig.alpha;
	door:addEventListener('touch', function(event)
		if event.phase == 'began' then
			if not globalData.codeDoor.open then
				return;
			end

			inventory:hideFindStuff('scheme');

			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_4');
		end
	end);
	door:addEventListener('tap', function() return true; end);

	inventory:showFindStuff('scheme');
end

LocationBunkerRoom1Event1:addEventListener("create", LocationBunkerRoom1Event1); -- Создание сцены
return LocationBunkerRoom1Event1;