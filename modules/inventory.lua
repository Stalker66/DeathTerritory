Inventory = {
	stuffs = {
		review = {

		}
	},
	images = {

	},
	currentStuffs = {},
	currentOpenStuff = nil
}

Inventory.metatable = {}

Inventory.metatable.__index = Inventory;

function Inventory:new(event)
	Inventory:setImages();
end

-- Set inventory stuff images
function Inventory:setImages()
	-- Background 
	self.stuffs.background = display.newImage( 'img/modules/inventory/cels.png', 0, display.contentCenterY);
	self.stuffs.background.x = -self.stuffs.background.width/2;
	transition.to(self.stuffs.background, {
		time = 1000,
		x = self.stuffs.background.width/2
	});
	-- Map
	self.stuffs.map = display.newImage('img/modules/inventory/map.png', 0, display.contentCenterY);
	self.stuffs.map.x = self.stuffs.map.width/2 + 20;
	self.stuffs.map.y = self.stuffs.map.y + 108;
	self.stuffs.map.alpha = 0;
	self.stuffs.map.name = 'map';
	self.stuffs.map:addEventListener('tap', showStuff);
	-- Review
	self.stuffs.review.map = display.newImage('img/modules/inventory/review/map.png', display.contentCenterX, display.contentCenterY);
	self.stuffs.review.map.isVisible = false;

	-- Token
	self.stuffs.token = display.newImage('img/modules/inventory/token.png', 0, display.contentCenterY);
	self.stuffs.token:scale(0.5, 0.5);
	self.stuffs.token.x = self.stuffs.token.width/2 - 10;
	self.stuffs.token.y = self.stuffs.token.y + 0;
	self.stuffs.token.alpha = 0;

	-- Back image
	self.images.back = display.newImage('img/modules/common/back.png');
	self.images.back.isVisible = false;
	self.images.back:addEventListener('tap', closeStuff);
end

-- Add stuff to inventory
function Inventory:addStuff(name)
	transition.fadeIn(self.stuffs[name], {time = 1000});
	self.currentStuffs[#self.currentStuffs+1] = name;
end

function Inventory:showCloseBtn(stuff)
	self.images.back.x = (display.contentWidth - stuff.width)/2 + stuff.width + self.images.back.width/2;
	self.images.back.y = (display.contentHeight - stuff.height)/2 + stuff.height - self.images.back.height/2 - 30;
	self.images.back.isVisible = true;
end

function Inventory:closeCloseBtn()
	self.images.back.isVisible = false;
end

function showStuff(event)
	local name = event.target.name;
	Debug:print_r(event);
	Inventory.currentOpenStuff = event.target.name;
	Inventory:showCloseBtn(Inventory.stuffs.review[name]);
	Inventory.stuffs.review[name].isVisible = true;
end

function closeStuff()
	Inventory:closeCloseBtn();
	Inventory.stuffs.review[Inventory.currentOpenStuff].isVisible = false;
end

function Inventory:getCurrentStuffs()
	return self.currentStuffs;
end

function Inventory:getStuffs()
	return self.stuffs;
end

return Inventory;