-----------------------------------------------------------------------------------------
-- Первая локация
-- location1.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- Подгрузка библиотек
local composer = require "composer"; -- Подгружаем библиотеку создания сцен
local widget = require("widget"); -- Подгружаем библиотеку виджетов
local movieclip = require("movieclip"); -- Подгружаем библиотеку мувиклипов
local tutorials = require("scenes.tutorials"); -- Подгружаем библиотеку обучения
local Location1Scene = composer.newScene(); -- Создаём новую сцену

function Location1Scene:create(event)
    -- ПЕРЕМЕННЫЕ
    local grpLocation1Scene = self.view; -- Группа
    local imgBackgroundLoc1 = display.newImage(grpLocation1Scene, "img/location1.png", display.contentCenterX, display.contentCenterY); -- Фоновый рисунок
    local butLoc1Car = display.newImage(grpLocation1Scene, "img/loc1_car.jpg", 420.5, 369.5); -- Машина
    local butLoc1House = display.newImage(grpLocation1Scene, "img/loc1_house.jpg", 1065.50, 252); -- Дом
    local imgCharacterLena = display.newImage(grpLocation1Scene, "img/lena.png", display.contentCenterX, 600); -- Лена

    -- ПАРАМЕТРЫ/ТЕКСТ/ПЕРЕХОД
    local optionsShowDialog = {
        effect = "fromBottom",
        time = 400
    };

    -- ФУНКЦИИ
    local function funcBeganCar(event)
        if event.phase == "began" then
            deleteArrow();
            butLoc1Car:removeEventListener("touch", funcBeganCar);
        end
    end

    local function funcEventOne(obj)
        butLoc1Car:addEventListener("touch", funcBeganCar);
    end

    local function funcDialogPhrase(event)
        if event.phase == "began" then
            if txtActor.text == localization.next_text then
                createDialog(localization.dialog1_say2_text, localization.dialog1_say3_text, localization.lena_name_text);
                deleteArrow();
            elseif txtActor.text == localization.dialog1_say3_text then
                createDialog(localization.dialog1_say7_text, localization.dialog1_say4_text, localization.lena_name_text);
            elseif txtActor.text == localization.dialog1_say4_text then
                createDialog(localization.ellipsis_text, localization.dialog1_say5_text, localization.lena_name_text);
            elseif txtActor.text == localization.dialog1_say5_text then
                createDialog(localization.dialog1_say6_text, localization.dialog1_say8_text, localization.lena_name_text);
            elseif txtActor.text == localization.dialog1_say8_text then
                txtActor:removeEventListener("touch", funcDialogPhrase);
                deleteDialog();
                createArrow(490, 180, "v");
                transition.to(imgCharacterLena, { time = 800, x = 1150, y = 460, width = 220, height = 622, onComplete = funcEventOne });
            end
        end
    end

    local function funcStartDialog(event)
        composer.showOverlay("scenes.dialogs", optionsShowDialog); -- Показать диалог
        createDialog(localization.dialog1_say1_text, localization.next_text, localization.lena_name_text); -- Заполняем диалог текстом с файла
        txtActor:addEventListener("touch", funcDialogPhrase); -- Создаём управление диалогом
        createArrow(525, 495, "h"); -- Создаём стрелку
    end

    -- АКТИВАТОРЫ/СЛУШАТЕЛИ
    timer.performWithDelay(1000, funcStartDialog)
end

Location1Scene:addEventListener("create", Location1Scene); -- Создание сцены
return Location1Scene;