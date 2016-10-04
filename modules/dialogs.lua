-----------------------------------------------------------------------------------------
-- Диалоги
-- dialogs.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------
Dialogs = {
}

Dialogs.metatable = {}
Dialogs.metatable.__index = Dialogs;

local dialogOn = false;

-- Create dialog
function Dialogs:createDialog()
	self.grpDialogs = display.newGroup();
	self.imgBgrDialog = display.newImage(self.grpDialogs, "img/dialogs/dialog.png", display.contentCenterX, display.contentCenterY );
	self.urlFace = "img/dialogs/face_";
	self.imgFace =  movieclip.newAnim{self.urlFace.."no_data.jpg", -- No Data
								      self.urlFace.."lena.jpg"};   -- Helen
	self.imgFace.x = 228;
   	self.imgFace.y = 183;

	self.optNPC = {
			parent = self.grpDialogs,
		    text = "---",     
		    x = 641,
		    y = 235,
		    width = 600,
		    font = "font/AA-Futured",  
		    fontSize = 35,
		    align = "center" 
	};

	self.optActor = {
		parent = self.grpDialogs,
		text = "---",     
		x = 641,
		y = 500,
		width = 600,
		font = "font/AA-Futured",  
		fontSize = 35,
		align = "center" 
	};

	self.butChangeDialog = display.newRect(self.grpDialogs, 640, 504, 645, 200 );
	self.butChangeDialog.alpha = globalConfig.alpha;
	self.sayNPC = display.newText( self.optNPC );
	self.sayNPC:setTextColor( 192/255, 255/255, 62/255 );
	self.sayACTOR = display.newText( self.optActor );
	self.sayACTOR:setTextColor( 188/255, 238/255, 104/255 ); 
	self.nameNPC = display.newText(self.grpDialogs, "---", 504, 110, "font/AA-Futured", 30);
	self.nameNPC:setTextColor( 255/255, 165/255, 0/255 );
	self.nameActor = display.newText(self.grpDialogs, localization.actor_name_text, 770, 370, "font/AA-Futured", 30);
	self.nameActor:setTextColor( 255/255, 165/255, 0/255 );
	self.imgFaceActor = display.newImage(self.grpDialogs, "img/dialogs/face_andrey.jpg", 1053, 448 );
	self.imgFaceActor:toBack();
	self.grpDialogs:insert(self.imgFace);
	self.grpDialogs.alpha = 0;

    transition.fadeIn( self.grpDialogs, { time=200 } );
    dialogOn = true;
end

-- Show dialog
function Dialogs:showDialog(sayNpc,sayActor,nameNpc)
	if(globalConfig.openedWindow == true) then
		return;
	end
	
	if dialogOn == false then
		Dialogs:createDialog();
	end

	if nameNpc == localization.lena_name_text then
		self.imgFace:stopAtFrame(2);
	end

	self.sayNPC.text = sayNpc;
    self.sayACTOR.text = sayActor;
    self.nameNPC.text = nameNpc;
    self.imgFace:toBack();
end

-- Remove dialog
function Dialogs:removeDialog()
	local function removeDialog( obj )
		dialogOn = false;
		display.remove(self.grpDialogs);
		self.grpDialogs = nil;
	end

	transition.fadeOut( self.grpDialogs, { time=200, onComplete=removeDialog } );
end

function Dialogs:startDialogs()
	globalConfig.openedWindow = true;
end

function Dialogs:endDialogs()
	globalConfig.openedWindow = false;
end

return Dialogs;