-----------------------------------------------------------------------------------------
-- Первый скрипт в приложении он же и главный
-- main.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- Подгрузка библиотек
local composer = require "composer"; -- Подгружаем библиотеку создания сцен
local json = require("json"); -- Подгружаем библиотеку для работы с форматом json

-- Глобальные переменные
language = "Rus"; --  Переменная содержит выбранный язык приложения
soundOnGame = false; --  Переменная содержит параметры звука

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
function loadLocalization( language )
	if language == "Rus" then
		localization = funcLoadText("localization/rus.json");
	elseif language == "Eng" then
		localization = funcLoadText("localization/eng.json");
	end
end

loadLocalization(language); -- Подгрузка/Обновление файла локализации

-- Переходим к игре
 display.setStatusBar( display.HiddenStatusBar ); -- Скрываем статус бар
--composer.gotoScene("scenes.main_menu", "fade", 500); -- Переход на сцену "Меню"
composer.gotoScene( "scenes.location1", "fade", 500 ); -- Тестовый переход на локацию 1

-- FPS
 local fpsText = display.newText(display.fps, 50, 50, native.systemFont, 60);
 local function updateText()
    fpsText.txt = display.fps;
 end
 Runtime:addEventListener("enterFrame", updateText);