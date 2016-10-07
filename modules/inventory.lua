-----------------------------------------------------------------------------------------
-- Инвентарь
-- inventory.lua
-- Станисла Пишевский
-----------------------------------------------------------------------------------------
Inventory = {
	stuffs = {
		review = {

		},
		find = {

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
	Inventory:setFindStuffs();
end

-- Set inventory stuff images
function Inventory:setImages()
	-- Background 
	self.stuffs.background = display.newImage( 'img/inventory/cels.png', 0, display.contentCenterY);
	self.stuffs.background.x = -self.stuffs.background.width/2;
	transition.to(self.stuffs.background, {
		time = 1000,
		x = self.stuffs.background.width/2
	});
	-- Map
	self.stuffs.map = display.newImage('img/inventory/map.png', 0, display.contentCenterY);
	self.stuffs.map:scale(0.9, 0.9);
	self.stuffs.map.x = self.stuffs.map.width/2 + 20;
	self.stuffs.map.y = self.stuffs.map.y + 108;
	self.stuffs.map.alpha = 0;
	-- Review
	self.stuffs.map.name = 'map';
	self.stuffs.map:addEventListener('tap', showStuff);
	self.stuffs.review.map = display.newImage('img/inventory/review/map.png', display.contentCenterX, display.contentCenterY);
	self.stuffs.review.map.isVisible = false;

	-- Token
	self.stuffs.token = display.newImage('img/inventory/token.png', 0, display.contentCenterY);
	self.stuffs.token:scale(0.5, 0.5);
	self.stuffs.token.x = self.stuffs.token.width/2 - 13;
	self.stuffs.token.y = self.stuffs.token.y - 3;
	self.stuffs.token.alpha = 0;
	-- Review
	self.stuffs.token.name = 'token';
	self.stuffs.token:addEventListener('tap', showStuff);
	self.stuffs.review.token = display.newImage('img/inventory/review/token.png', display.contentCenterX, display.contentCenterY);
	self.stuffs.review.token.isVisible = false;

	-- Back image
	self.images.back = display.newImage('img/common/back.png');
	self.images.back.isVisible = false;
	self.images.back:addEventListener('tap', closeStuff);
end

-- Add find stuffs
function Inventory:setFindStuffs()
	-- Map
	self.stuffs.find.token = display.newImage('img/inventory/review/token.png', 0, display.contentCenterY);
	self.stuffs.find.token:scale(0.2, 0.2);
	self.stuffs.find.token.x = display.contentWidth - 100;
	self.stuffs.find.token.y = display.contentHeight - 100;
	self.stuffs.find.token.isVisible = false;
	self.stuffs.find.token.name = 'token';
	self.stuffs.find.token.delay = 1000;

	for key, item in pairs(self.stuffs.find) do
		item:addEventListener('tap', function()
			Inventory:addFindStuff(item.name, item.delay);
		end);
	end
end

function Inventory:showFindStuff(name)
	self.stuffs.find[name].isVisible = true;
end

-- Show find stuff and animate it to inventory tollbar
function Inventory:addFindStuff(name, delay)
	transition.to(self.stuffs.find[name], {
		time = 500,
		x = display.contentCenterX,
		y = display.contentCenterY,
		xScale = 1,
		yScale = 1
	});

	timer.performWithDelay(delay, function()
		transition.to(self.stuffs.find[name], {
			time = 500,
			x = self.stuffs[name].x,
			y = self.stuffs[name].y,
			alpha = 0,
			xScale = 0.3,
			yScale = 0.3,
			width = self.stuffs[name].width,
			height = self.stuffs[name].height
		});
		Inventory:addStuff(name);
	end);
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
	closeStuff();
	
	local name = event.target.name;
	Inventory.currentOpenStuff = event.target.name;
	Inventory:showCloseBtn(Inventory.stuffs.review[name]);
	Inventory.stuffs.review[name].isVisible = true;
end

function closeStuff()
	if(Inventory.currentOpenStuff ~= nil) then
		Inventory:closeCloseBtn();
		Inventory.stuffs.review[Inventory.currentOpenStuff].isVisible = false;
	end
end

function Inventory:getCurrentStuffs()
	return self.currentStuffs;
end

function Inventory:getStuffs()
	return self.stuffs;
end

return Inventory;