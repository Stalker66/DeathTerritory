-----------------------------------------------------------------------------------------
-- Окрестности машины
-- location1.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local Location1Event1 = composer.newScene(); -- Создаём новую сцену

function Location1Event1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocation1Event1 = self.view; -- Группа
	local imgBackgroundLoc1 = display.newImage(grpLocation1Event1, "img/location1.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
	local butLoc1Car = display.newRect( 419, 352, 600, 225 ); -- Машина
		  butLoc1Car.alpha = globalConfig.alpha;
	local imgCharacterLena = display.newImage(grpLocation1Event1, "img/lena.png", display.contentCenterX, 600 ); -- Лена

	-- ФУНКЦИИ
	local function funcBeganCar( event )
		if event.phase == "began" then
			tutorials:removeArrow("touchTutorial");
			butLoc1Car:removeEventListener( "touch", funcBeganCar );
			composer.removeScene( "scenes.location1" );
			composer.gotoScene( "scenes.location2", "fade", 100 );
		end
	end

	local function funcEventOne( obj )
    	butLoc1Car:addEventListener( "touch", funcBeganCar );
	end

	local function funcDialogPhrase( event )
		if event.phase == "began" then
			Dialogs:startDialogs();

			if dialogs.sayACTOR.text == localization.next_text then
				dialogs:showDialog(localization.dialog1_say2_text,localization.dialog1_say3_text,localization.lena_name_text);
				tutorials:removeArrow("dialogTutorial");
			elseif dialogs.sayACTOR.text == localization.dialog1_say3_text then
				dialogs:showDialog(localization.dialog1_say7_text,localization.dialog1_say4_text,localization.lena_name_text);
			elseif dialogs.sayACTOR.text == localization.dialog1_say4_text then
				dialogs:showDialog(localization.ellipsis_text,localization.dialog1_say5_text,localization.lena_name_text);
			elseif dialogs.sayACTOR.text == localization.dialog1_say5_text then
				dialogs:showDialog(localization.dialog1_say6_text,localization.dialog1_say8_text,localization.lena_name_text);
			elseif dialogs.sayACTOR.text == localization.dialog1_say8_text then
				dialogs.butChangeDialog:removeEventListener( "touch", funcDialogPhrase );
				dialogs:removeDialog(); -- Удалить диалог
				Dialogs:endDialogs();
				tutorials:showArrow("touchTutorial",490,185,"vertical");
				transition.to( imgCharacterLena, { time=800, x=1150, y=460, width=220, height=622, onComplete=funcEventOne } );
			end	
		end
	end

	local function funcStartDialog(event)
		dialogs:showDialog(localization.dialog1_say1_text,localization.next_text,localization.lena_name_text); -- Создать диалог
		dialogs.butChangeDialog:addEventListener( "touch", funcDialogPhrase ); -- Создаём управление диалогом
		tutorials:showArrow("dialogTutorial",525,497); -- Создаём стрелку
	end

	-- АКТИВАТОРЫ/СЛУШАТЕЛИ
	timer.performWithDelay( 1000, funcStartDialog );
end

Location1Event1:addEventListener("create", Location1Event1); -- Создание сцены
return Location1Event1;