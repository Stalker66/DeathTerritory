-----------------------------------------------------------------------------------------
-- Главное меню
-- main_menu.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- СЦЕНЫ
local MainMenuScene = composer.newScene(); -- Создаём новую сцену

-- Функции
function MainMenuScene:create(event)
    -- ПЕРЕМЕННЫЕ
    local grpMainMenuScene = self.view; -- Группа
    local imgBackgroundMenu = display.newImage(grpMainMenuScene, "img/menu/main_menu.jpg", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
    local butEnterEng = display.newImage(grpMainMenuScene, "img/menu/eng.png", 688, 340 ); -- Кнопка переключение на английский
    local butEnterRus = display.newImage(grpMainMenuScene, "img/menu/rus.png", 688, 425 ); -- Кнопка переключение на русский
    local butVk = display.newImage(grpMainMenuScene, "img/menu/vk.png", 47, 645 ); -- Кнопка перехода в группу ВК
    local butNewGame = display.newText(grpMainMenuScene, "", 1003, 498, "font/AA-Futured", 45); -- Кнопка "Начать игру"
    local butCredits = display.newText(grpMainMenuScene, "", 1000, 614, "font/AA-Futured", 45); -- Кнопка "Титры"
    local urlLogo = "img/menu/logo_"; -- LOGO
    local imgLogoMenu =  movieclip.newAnim{urlLogo.."rus.png",  -- Лого Rus
                                        urlLogo.."eng.png"}; -- Лого Eng
    local urlSound = "img/menu/sound_"; -- Sound
    local butSoundMenu =  movieclip.newAnim{urlSound.."on.png",  -- Звук включен
                                        urlSound.."off.png"}; -- Звук выключен
    local arrQuotations = {"","","","","","","","","","",""}; -- Цитаты

    -- ПАРАМЕТРЫ/ТЕКСТ/ПЕРЕХОД
    local optQuotations = {
        parent = grpMainMenuScene,
        text = "",
        x = 435,
        y = 640,
        width = 650,
        font = "font/Arial",
        fontSize = 35,
        align = "left"
    };
    local txtQuotations = display.newText(optQuotations); -- Цитаты

    -- ФУНКЦИИ
    -- Выбор языка
    local function funcChangeLanguage(language)
        butNewGame.text = localization.new_game_text;
        butCredits.text = localization.credits_text;
        arrQuotations = { localization.quotations_text_1, localization.quotations_text_2, localization.quotations_text_3, localization.quotations_text_4, localization.quotations_text_5, localization.quotations_text_6, localization.quotations_text_7, localization.quotations_text_8, localization.quotations_text_9, localization.quotations_text_10, localization.quotations_text_11 };
        txtQuotations.text = arrQuotations[math.random(#arrQuotations)];
        if globalConfig.language == "Rus" then
            imgLogoMenu:stopAtFrame(1);
            imgLogoMenu.x = 997;
            imgLogoMenu.y = 385;
        elseif globalConfig.language == "Eng" then
            imgLogoMenu:stopAtFrame(2);
            imgLogoMenu.x = 1005;
            imgLogoMenu.y = 385;
        end
    end

    -- Музыка в меню
    local function funcPlayMusicToMenu()
        snd:play("main_menu","music");
        globalConfig.soundOnGame = true;
        butSoundMenu:stopAtFrame(1);
        butSoundMenu.x = 47;
        butSoundMenu.y = 550;
    end

    -- Функции нажатий
    local function funcEnterEng(event)
        if globalConfig.language == "Rus" then
            if event.phase == "began" then
                globalConfig.language = "Eng";
                loadLocalization(globalConfig.language);
                funcChangeLanguage(language);
            end
        end
    end

    local function funcEnterRus(event)
        if globalConfig.language == "Eng" then
            if event.phase == "began" then
                globalConfig.language = "Rus";
                loadLocalization(globalConfig.language);
                funcChangeLanguage(language);
            end
        end
    end

    local function funcChangeSound(event)
        if event.phase == "began" then
            if globalConfig.soundOnGame == true then
            	snd:stop("main_menu","music");
            	snd:off();
                globalConfig.soundOnGame = false;
                butSoundMenu:stopAtFrame(2);
            elseif globalConfig.soundOnGame == false then
            	snd:play("main_menu","music");
            	snd:on();
                globalConfig.soundOnGame = true;
                butSoundMenu:stopAtFrame(1);
            end
        end
    end

    local function funcShowAlerVk(event)
        local action = event.action;
        if "clicked" == event.action then
            if 2 == event.index then
                system.openURL("https://vk.com/metal_game");
            end
        end
    end

    local function funcGoToGroupVk(event)
        if event.phase == "began" then
            local alert = native.showAlert(localization.team_name_text, localization.show_message_vk_text, { localization.but_cancel_text, localization.but_go_vk_text }, funcShowAlerVk);
        end
    end

    local function funcStartGame(event)
        if event.phase == "began" then
           snd:stop("main_menu","music");
           grpMainMenuScene:removeSelf();
           composer.removeScene("scenes.main_menu");
           composer.gotoScene("scenes.location1", "fade", 700);
        end
    end

    -- АКТИВАТОРЫ/СЛУШАТЕЛИ
    butEnterEng:addEventListener("touch", funcEnterEng);
    butEnterRus:addEventListener("touch", funcEnterRus);
    butSoundMenu:addEventListener("touch", funcChangeSound);
    butVk:addEventListener("touch", funcGoToGroupVk);
    butNewGame:addEventListener("touch", funcStartGame);
    funcChangeLanguage(language);
    funcPlayMusicToMenu();
    grpMainMenuScene:insert(imgLogoMenu);
    grpMainMenuScene:insert(butSoundMenu);
end

MainMenuScene:addEventListener("create", MainMenuScene); -- Создание сцены
return MainMenuScene;