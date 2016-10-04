----------
-- @author: Sergey Pomorin
-- @skype: j0xflash
----------
module(..., package.seeall);

function new()
	local grpDialogs = display.newGroup();
	grpDialogs.txtNameActor = nil;
	
	local function showDialog()
		-- ПЕРЕМЕННЫЕ
		local imgBgrDialog = display.newImage(grpDialogs, "img/dialog.png", display.contentCenterX, display.contentCenterY ); -- Фоновый рисунок
		local urlFace = "img/face_"; -- Лица
		local imgFace =  movieclip.newAnim{urlFace.."no_data.jpg", -- No Data
											urlFace.."lena.jpg"}; -- Лена
			imgFace.x = 228;
	   		imgFace.y = 183;
	   		imgFace:toBack();

		local optNPC = {
		    text = "---",     
		    x = 641,
		    y = 235,
		    width = 600,
		    font = "font/AA-Futured",  
		    fontSize = 35,
		    align = "center" };
		

		local optActor = {
			text = "---",     
			x = 641,
			y = 500,
			width = 600,
			font = "font/AA-Futured",  
			fontSize = 35,
			align = "center" };
		

		local txtNameNPC = display.newText(grpDialogs, "", 504, 110, "font/AA-Futured", 30); -- Имена персонажей
			txtNameNPC:setTextColor( 255/255, 165/255, 0/255 );
		local txtNPC = display.newText( optNPC ); -- Диалог персонажей
			txtNPC:setTextColor( 192/255, 255/255, 62/255 );
		grpDialogs.txtNameActor = display.newText(grpDialogs, localization.actor_name_text, 770, 370, "font/AA-Futured", 30); -- Имя героя
		 	txtNameActor:setTextColor( 255/255, 165/255, 0/255 );
		local txtActor = display.newText( optActor ); -- Диалог героя
			txtActor:setTextColor( 188/255, 238/255, 104/255 );  
		grpDialogs:insert(imgFace);
	    grpDialogs:insert(txtNameNPC);
	    grpDialogs:insert(txtActor);
	    grpDialogs:insert(txtNPC); 
	end

	function grpDialogs:showDialog()
		print(grpDialogs.txtNameActor);
	end

	return grpDialogs;
end