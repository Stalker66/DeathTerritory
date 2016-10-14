-----------------------------------------------------------------------------------------
-- Первый скрипт в приложении он же и главный
-- main.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- Debug package
_G.Debug = require('lib.debug');

globalConfig = {
	language = "Rus", --  Переменная содержит выбранный язык приложения
	soundOnGame = false, --  Переменная содержит параметры звука
	alpha = 0.3, -- Прозрачность кнопок в игре
	openedWindow = false, -- Открыто ли окно,
	canGo = true
}

-- Подгрузка библиотек
composer = require "composer"; -- Подгружаем библиотеку создания сцен
widget = require("widget"); -- Подгружаем библиотеку виджетов
json = require("json"); -- Подгружаем библиотеку для работы с форматом json
movieclip = require("modules.movieclip"); -- Подгружаем библиотеку мувиклипов
-- by Stalker66
tutorials = require("modules.tutorials"); -- Подгружаем библиотеку обучения
dialogs = require("modules.dialogs"); -- Подгружаем библиотеку диалогов
tmr = require("modules.timer"); -- Подгружаем библиотеку таймера
snd = require("modules.sounds_play"); -- Подгружаем библиотеку звука
-- by Bamiza
inventory = require('modules.inventory'); -- Inventory module
diary = require('modules.diary'); -- Diary module
zombieAnimations = require('modules.zombie_animations');
zombieAnimations:new();
weapon = require('modules.weapon');
weapon:new();
foundStuff = require('modules.foundStuff');
foundStuff:new();
displayGroup = display.newGroup();
displayGroup:insert(zombieAnimations:getDisplayGroup());
displayGroup:insert(weapon:getDisplayGroup());
--displayGroup:insert(foundStuff:getDisplayGroup());
displayGroup:insert(diary:getDisplayGroup());
displayGroup:insert(inventory:getDisplayGroup());

-- ФУНКЦИИ
-- Загружаем текст
function funcLoadText(filename)
	local path = system.pathForFile(filename, system.ResourceDirectory); -- Получаем путь к файлу
	local contents = "";
	local myTable = {};
	local file = io.open(path, "r"); -- Открываем файл
	if (file) then -- Если такой файл существует
		local contents = file:read( "*a" ); -- Читаем из него данные
		myTable = json.decode(contents); -- Расшифровываем их
		io.close(file); -- Закрываем файл
		return myTable; -- Возвращаем параметры из файла
	end
	return nil
end 

-- Подгрузка файла локализации
function loadLocalization(language)
    if globalConfig.language == "Rus" then
        localization = funcLoadText("localization/rus.json");
    elseif globalConfig.language == "Eng" then
        localization = funcLoadText("localization/eng.json");
    end
end

loadLocalization(globalConfig.language); -- Подгрузка/Обновление файла локализации

inventory:new(); -- Init inventory
diary:new(); -- Init diary

-- Переходим к игре
display.setStatusBar( display.HiddenStatusBar ); -- Скрываем статус бар
--composer.gotoScene("scenes.main_menu", "fade", 500); -- Переход на сцену "Меню"
--composer.gotoScene( "scenes.location_tunel_door", "fade", 500 ); -- Тестовый переход на локацию 1
--composer.gotoScene( "scenes.location_basement", "fade", 500 ); -- Тестовый переход на локацию 1
composer.gotoScene( "scenes.location_farm_outside", "fade", 500 );

-- FPS
fpsText = display.newText(display.fps, 50, 50, native.systemFont, 60);
function updateText()
    fpsText.txt = display.fps;
end
Runtime:addEventListener("enterFrame", updateText);