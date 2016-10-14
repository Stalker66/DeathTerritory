-----------------------------------------------------------------------------------------
-- Окрестности машины
-- location_farm_inside.lua
-- Пишевский Стас
-----------------------------------------------------------------------------------------

local composer = require('composer');

-- СЦЕНЫ
local LocationTunelDoorEvent = composer.newScene(); -- Создаём новую сцену

function LocationTunelDoorEvent:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocationTunelDoorEvent = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocationTunelDoorEvent, "img/location_tunel_door/background.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

	local codeGroup = display.newGroup();
	codeGroup.isVisible = false;
	codeGroup:toFront( );
	grpLocationTunelDoorEvent:insert(codeGroup);
	local code = display.newImage(grpLocationTunelDoorEvent, "img/location_tunel_door/code.png", display.contentCenterX, display.contentCenterY);
	codeGroup:insert(code);
	local back = display.newImage(grpLocationTunelDoorEvent, "img/common/back.png", 0, 0);
	back.x = code.x + code.width/2 + back.width /2;
	back.y = code.y + code.height/2 - back.height/2;
	back:addEventListener('tap', function() return true; end);
	back:addEventListener('touch', function()
		weapon:toggleVisble('basementAx', true);
		
		codeGroup.isVisible = false;
	end);
	codeGroup:insert(back);

	local keyboard = display.newRect(0, 0, 80, 90);
	keyboard.x = 342;
	keyboard.y = 328;
	keyboard.alpha = globalConfig.alpha;
	grpLocationTunelDoorEvent:insert(keyboard);
	keyboard:addEventListener('tap', function() return true; end);
	keyboard:addEventListener('touch', function()
		weapon:toggleVisble('basementAx', false);
		codeGroup:toFront();

		codeGroup.isVisible = true;
	end);

	local keyWidth = 48;
	local keyHeight = 50;
	local key7 = display.newRect(codeGroup, 482, 382, keyWidth, keyHeight);
	key7.alpha = globalConfig.alpha;
	key7:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('7');
		end
	end)
	local key8 = display.newRect(codeGroup, 558, 385, keyWidth, keyHeight);
	key8.alpha = globalConfig.alpha;
	key8:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('8');
		end
	end);
	local key9 = display.newRect(codeGroup, 634, 386, keyWidth, keyHeight);
	key9.alpha = globalConfig.alpha;
	key9:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('9');
		end
	end);
	local key4 = display.newRect(codeGroup, 484, 458, keyWidth, keyHeight);
	key4.alpha = globalConfig.alpha;
	key4:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('4');
		end
	end);
	local key5 = display.newRect(codeGroup, 560, 457, keyWidth, keyHeight);
	key5.alpha = globalConfig.alpha;
	key5:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('6');
		end
	end);
	local key6 = display.newRect(codeGroup, 634, 458, keyWidth, keyHeight);
	key6.alpha = globalConfig.alpha;
	key6:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('7');
		end
	end);
	local key1 = display.newRect(codeGroup, 486, 529, keyWidth, keyHeight);
	key1.alpha = globalConfig.alpha;
	key1:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('1');
		end
	end);
	local key2 = display.newRect(codeGroup, 560, 529, keyWidth, keyHeight);
	key2.alpha = globalConfig.alpha;
	key2:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('2');
		end
	end);
	local key3 = display.newRect(codeGroup, 634, 528, keyWidth, keyHeight);
	key3.alpha = globalConfig.alpha;
	key3:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('3');
		end
	end);
	local key0 = display.newRect(codeGroup, 525, 600, 119, keyHeight);
	key0.alpha = globalConfig.alpha;
	key0:addEventListener('touch', function(event)
		if event.phase == 'began' then
			enterCode('0');
		end
	end);
	local keyDel = display.newRect(codeGroup, 634, 600, keyWidth, keyHeight);
	keyDel.alpha = globalConfig.alpha;
	keyDel:addEventListener('touch', function(event)
		if event.phase == 'began' then
			deleteCode();
		end
	end);
	local keyEnter = display.newRect(codeGroup, 708, 571, keyWidth, 119);
	keyEnter.alpha = globalConfig.alpha;
	keyEnter:addEventListener('touch', function(event)
		if event.phase == 'began' then
			pressEnter();
		end
	end);

	local inputText = display.newText({
		text = '',
		x = 634,
		y = 163,
		width = 190,
		height = keyHeight,
		font = native.systemFont,
		align = "center",
		fontSize = 32
	});
	inputText:setFillColor(1, 1, 1);
	codeGroup:insert(inputText);
	
	function enterCode(value)
		if string.len(inputText.text) >= 4 then
			return;
		end

		inputText.text = table.concat({inputText.text, value}, '');
	end

	function deleteCode()
		local len = string.len(inputText.text);

		if len == 0 then
			return;
		end

		inputText.text = inputText.text:sub(1, len-1);
	end

	function pressEnter()
		if inputText.text == '3802' then
			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene('scenes.location_bunker_enter');
		end
	end
end

LocationTunelDoorEvent:addEventListener("create", LocationTunelDoorEvent); -- Создание сцены
return LocationTunelDoorEvent;