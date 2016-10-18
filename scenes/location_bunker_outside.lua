-----------------------------------------------------------------------------------------
-- Машина
-- location2.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationBunkerOutsideEvent1 = composer.newScene(); -- Создаём новую сцену

function LocationBunkerOutsideEvent1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpBunkerOutsideScene = self.view; -- Группа
	local imgBackgroundLoc2 = display.newImage(grpBunkerOutsideScene, "img/location_bunker_outside/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
	
	local door1 = display.newRect(grpBunkerOutsideScene, 0, 0, 550, 230);
	door1.x = display.contentCenterX - 100;
	door1.y = display.contentCenterY + 100;
	door1.alpha = globalConfig.alpha;
	door1:addEventListener('touch', function(event)
		if event.phase == 'began' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_outside');
		end
	end);

	weapon:pickUp('basementAx', function()
		weapon:attack('bunkerOutside', {
			onComplete = function() end
		});
	end);

	zombieAnimations:showAnimation('bunkerOutside');

	-- Debug get position
	local debugRect = Debug:getMask();
	grpBunkerOutsideScene:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBunkerOutsideEvent1:addEventListener("create", LocationBunkerOutsideEvent1); -- Создание сцены
return LocationBunkerOutsideEvent1;