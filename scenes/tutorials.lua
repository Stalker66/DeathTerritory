-----------------------------------------------------------------------------------------
-- Стрелка(Обучение)
-- tutorials.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

-- ФУНКЦИИ
function createArrow(tutorialX,tutorialY,tutorialR)
--Vlad 11
  imgArrow = display.newImage( "img/arrow.png", tutorialX, tutorialY );
  animateChange = false;
  --  Hello
  local function animationArrowHorizontal()
    if animateChange == true then
      transition.to( imgArrow, { time=500, x=tutorialX } );
      tmrAnimArr = timer.performWithDelay( 500, animationArrowHorizontal );
      animateChange = false;
    elseif animateChange == false then
      transition.to( imgArrow, { time=500, x=tutorialX-70 } );
      tmrAnimArr = timer.performWithDelay( 500, animationArrowHorizontal );
      animateChange = true;
    end
  end

  local function animationArrowVetrical()
    if animateChange == true then
      transition.to( imgArrow, { time=500, y=tutorialY } );
      tmrAnimArr = timer.performWithDelay( 500, animationArrowVetrical );
      animateChange = false;
    elseif animateChange == false then
      transition.to( imgArrow, { time=500, y=tutorialY-70 } );
      tmrAnimArr = timer.performWithDelay( 500, animationArrowVetrical );
      animateChange = true;
    end
  end

  imgArrow.alpha = 0;
  transition.fadeIn( imgArrow, { time=600 } );

  if tutorialR == "h" then
    imgArrow.rotation = 0;
    animationArrowHorizontal();
  elseif tutorialR == "v" then
    imgArrow.rotation = 90;
    animationArrowVetrical();
  end

end

function deleteArrow()
  imgArrow:removeSelf();
  timer.cancel( tmrAnimArr );
end