-----------------------------------------------------------------------------------------
-- Машина
-- location2.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- Подгрузка библиотек
local composer = require "composer"; -- Подгружаем библиотеку создания сцен
local widget = require("widget"); -- Подгружаем библиотеку виджетов
local movieclip = require("movieclip"); -- Подгружаем библиотеку мувиклипов
local tutorials = require("scenes.tutorials"); -- Подгружаем библиотеку обучения
local Location2Event1 = composer.newScene(); -- Создаём новую сцену

function Location2Event1:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpLocation2Scene = self.view; -- Группа
	local imgBackgroundLoc2 = display.newImage(grpLocation2Scene, "img/location2.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
	local butLoc2Housing = display.newRect( 700, 490, 1155, 320 ); -- Корпус
		  butLoc2Housing.alpha = alpha;
	local butLoc2Trunk = display.newRect( 480, 380, 420, 120 ); -- Багажник
		  butLoc2Trunk.alpha = alpha;
	local butLoc2Glass1 = display.newRect( 940, 240, 660, 130 ); -- Стекло
		  butLoc2Glass1.rotation = 2;
		  butLoc2Glass1.alpha = alpha;

	-- ПАРАМЕТРЫ/ТЕКСТ/ПЕРЕХОД

	-- ФУНКЦИИ
	local function funcBeganTrunk( event )
		if event.phase == "began" then
			deleteArrow();
			butLoc2Trunk:removeEventListener( "touch", funcBeganTrunk );
		end
	end

	-- АКТИВАТОРЫ/СЛУШАТЕЛИ
	createArrow(500,255,"v");
	butLoc2Trunk:addEventListener( "touch", funcBeganTrunk );
end

Location2Event1:addEventListener("create", Location2Event1); -- Создание сцены
return Location2Event1;