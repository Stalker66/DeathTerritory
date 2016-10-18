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

	local door1 = display.newRect(grpBunkerRoom4Scene, 222, 402, 200, 325);
	door1.alpha = globalConfig.alpha;
	door1:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_5');
		end
	end);

	local door2 = display.newRect(grpBunkerRoom4Scene, 980, 300, 250, 250);
	door2.alpha = globalConfig.alpha;
	door2:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_6');
		end
	end);

	local door3 = display.newRect(grpBunkerRoom4Scene, 0, 0, 150, 300);
	door3.x = display.contentWidth - door3.width/2;
	door3.y = display.contentCenterY + 80;
	door3.alpha = globalConfig.alpha;
	door3:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_7');
		end
	end);

	-- Debug get position
	local debugRect = Debug:getMask();
	grpBunkerRoom4Scene:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBunkerRoom4Event1:addEventListener("create", LocationBunkerRoom4Event1); -- Создание сцены
return LocationBunkerRoom4Event1;