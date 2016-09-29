local composer = require('composer');
local Location2Scene = composer.newScene();

function Location2Scene:create(event)
	local grpLocation1Scene = self.view; -- Группа
	local background = display.newImage( grpLocation1Scene, 'img/location1.png', display.contentCenterX, display.contentCenterY );
end

Location2Scene:addEventListener( 'create', Location2Scene )
return Location2Scene;