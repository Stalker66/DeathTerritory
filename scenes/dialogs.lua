-----------------------------------------------------------------------------------------
-- Панель для диалогов
-- dialogs.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- Подгрузка библиотек
local composer = require "composer"; -- Подгружаем библиотеку создания сцен
local widget = require("widget"); -- Подгружаем библиотеку виджетов
local movieclip = require("movieclip"); -- Подгружаем библиотеку мувиклипов
local DialogsScene = composer.newScene(); -- Создаём новую сцену

-- ПЕРЕМЕННЫЕ
local urlLogo = "img/face_"; -- Лица
local imgFace =  movieclip.newAnim{urlLogo.."lena.jpg"}; -- Лена

-- ФУНКЦИИ
-- Создать диалог
function createDialog(textNpc,textActor,nameNpc)
    txtNPC.text = textNpc;
    txtActor.text = textActor;
    txtNameNPC.text = nameNpc;
    imgFace.x = 228;
    imgFace.y = 183;
    imgFace:toBack();
    if nameNpc == "Лена:" or nameNpc == "Helen:" then
        imgFace:stopAtFrame(1);
    end
end

-- Удалить диалог
function deleteDialog()
    composer.hideOverlay( "slideDown", 400 );
end

-- ПАРАМЕТРЫ/ТЕКСТ/ПЕРЕХОД
local optNPC = {
      text = "",     
      x = 641,
      y = 235,
      width = 600,
      font = "font/AA-Futured",  
      fontSize = 35,
      align = "center" };
txtNPC = display.newText( optNPC ); -- Диалог персонажей

local optActor = {
      text = "",     
      x = 641,
      y = 500,
      width = 600,
      font = "font/AA-Futured",  
      fontSize = 35,
      align = "center" };
txtActor = display.newText( optActor ); -- Диалог героя

txtNameNPC = display.newText("", 504, 110, "font/AA-Futured", 30); -- Имена персонажей

-- Функции	
function DialogsScene:create(event)
	-- ПЕРЕМЕННЫЕ
	local grpDialogsScene = self.view; -- Группа
    local imgFaceActor = display.newImage(grpDialogsScene, "img/face_andrey.jpg", 1053, 448 ); -- Лицо Героя
	local imgBackgroundLoc1 = display.newImage(grpDialogsScene, "img/dialog.png", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок

    -- АКТИВАТОРЫ/СЛУШАТЕЛИ
    grpDialogsScene:insert(imgFace);
    grpDialogsScene:insert(txtNameNPC);
    grpDialogsScene:insert(txtActor);
    grpDialogsScene:insert(txtNPC);
    local txtNameActor = display.newText(grpDialogsScene, localization.actor_name_text, 770, 370, "font/AA-Futured", 30); -- Имя героя
    txtNPC:setTextColor( 192/255, 255/255, 62/255 );
    txtActor:setTextColor( 188/255, 238/255, 104/255 );
    txtNameNPC:setTextColor( 255/255, 165/255, 0/255 );
    txtNameActor:setTextColor( 255/255, 165/255, 0/255 );
end

DialogsScene:addEventListener("create", DialogsScene); -- Создание сцены
return DialogsScene;