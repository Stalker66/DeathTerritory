-----------------------------------------------------------------------------------------
-- Машина
-- location2.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local LocationBunkerRoom3Event1 = composer.newScene(); -- Создаём новую сцену

function LocationBunkerRoom3Event1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpBunkerRoom3Scene = self.view; -- Группа
	local imgBackgroundLoc2 = display.newImage(grpBunkerRoom3Scene, "img/location_bunker_room_3/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	local back = display.newImage('img/common/back.png');
	back.x = display.contentWidth - back.width/2;
	back.y = display.contentHeight - back.height/2;
	back:addEventListener('touch', function(event)
		if event.phase == 'began' then
			if globalConfig.openedWindow == true then
				return;
			end
			
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_room_2');
		end
	end);
	grpBunkerRoom3Scene:insert(back);

	function setmLampImages()
		local lamps = {};

		local function createLamp(name, x, y)
			if x == nil then x = 0 end

			if y == nil then y = 0 end

			local lamp = display.newImage(grpBunkerRoom3Scene, table.concat({'img/location_bunker_room_3/Lamp', name, '.png'}, ""), x, y);
			lamp.isVisible = false;

			return lamp;
		end

		local function changeLamp(lampName, writeFromGlob)
			if writeFromGlob == nil then
				writeFromGlob = true;
			end

			if writeFromGlob then
				if lamps[lampName].current == '' then
					lamps[lampName].current = 'l1_1';
					lamps[lampName].l1_3.isVisible = false;
					lamps[lampName].l1_1.isVisible = true;
				elseif lamps[lampName].current == 'l1_1' then
					lamps[lampName].current = 'l1_2';
					lamps[lampName].l1_1.isVisible = false;
					lamps[lampName].l1_2.isVisible = true;
				elseif lamps[lampName].current == 'l1_2' then
					lamps[lampName].current = 'l1_3';
					lamps[lampName].l1_2.isVisible = false;
					lamps[lampName].l1_3.isVisible = true;
				else
					lamps[lampName].current = '';
					lamps[lampName].l1_3.isVisible = false;
				end

				globalData.codeDoor.lamps[lampName] = lamps[lampName].current;

				-- Open code door
				if globalData.codeDoor.lamps.lamp_1 == 'l1_2' and globalData.codeDoor.lamps.lamp_2 == 'l1_3' and globalData.codeDoor.lamps.lamp_3 == 'l1_2' then
					globalData.codeDoor.open = true;
					print('Open');
				else
					globalData.codeDoor.open = false;
				end
			elseif lamps[lampName].current ~= '' then
				lamps[lampName][lamps[lampName].current].isVisible = true;
			end
		end

		local lamp1 = {
			x = 446,
			y = 128
		}
		local lamp2 = {
			x = 340,
			y = 353
		}
		local lamp3 = {
			x = 506,
			y = 310
		}

		lamps.lamp_1 = {};
		lamps.lamp_1.current = globalData.codeDoor.lamps.lamp_1;
		lamps.lamp_1.l1_1 = createLamp('1_Gre', lamp1.x, lamp1.y);
		lamps.lamp_1.l1_2 = createLamp('1_Ok', lamp1.x, lamp1.y);
		lamps.lamp_1.l1_3 = createLamp('1_Yel', lamp1.x, lamp1.y);

		lamps.lamp_2 = {};
		lamps.lamp_2.current = globalData.codeDoor.lamps.lamp_2;
		lamps.lamp_2.l1_1 = createLamp('1_Gre', lamp2.x, lamp2.y);
		lamps.lamp_2.l1_2 = createLamp('1_Ok', lamp2.x, lamp2.y);
		lamps.lamp_2.l1_3 = createLamp('1_Yel', lamp2.x, lamp2.y);

		lamps.lamp_3 = {};
		lamps.lamp_3.current = globalData.codeDoor.lamps.lamp_3;
		lamps.lamp_3.l1_1 = createLamp('2_Blu', lamp3.x, lamp3.y);
		lamps.lamp_3.l1_2 = createLamp('2_Ok', lamp3.x, lamp3.y);
		lamps.lamp_3.l1_3 = createLamp('2_Yel', lamp3.x, lamp3.y);

		local lamp1 = display.newCircle(grpBunkerRoom3Scene, lamp1.x, lamp1.y, 30);
		lamp1.alpha = globalConfig.alpha;
		lamp1:addEventListener('touch', function(event)
			if event.phase == 'began' then
				changeLamp('lamp_1');
			end
		end);

		local lamp2 = display.newCircle(grpBunkerRoom3Scene, lamp2.x, lamp2.y, 30);
		lamp2.alpha = globalConfig.alpha;
		lamp2:addEventListener('touch', function(event)
			if event.phase == 'began' then
				changeLamp('lamp_2');
			end
		end);

		local lamp3 = display.newRect(grpBunkerRoom3Scene, 515, 310, 110, 75);
		lamp3.alpha = globalConfig.alpha;
		lamp3:addEventListener('touch', function(event)
			if event.phase == 'began' then
				changeLamp('lamp_3');
			end
		end);

		changeLamp('lamp_1', false);
		changeLamp('lamp_2', false);
		changeLamp('lamp_3', false);
	end

	setmLampImages();

	-- Debug get position
	local debugRect = Debug:getMask();
	grpBunkerRoom3Scene:insert(debugRect);
	Debug:getMousePoint(debugRect);
end

LocationBunkerRoom3Event1:addEventListener("create", LocationBunkerRoom3Event1); -- Создание сцены
return LocationBunkerRoom3Event1;