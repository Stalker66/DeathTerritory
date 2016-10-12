Weapon = {
	images = {

	},
	displayGroup = display.newGroup()
};

Weapon.matatable = {};

Weapon.__index = Weapon;

function Weapon:new()
	Weapon:setImages();
end

-- Init weapon images
function Weapon:setImages()
	-- Wrench
	self.images.wrench = display.newImage('img/weapon/wrench.png');
	self.images.wrench:scale(0.3, 0.3);
	self.images.wrench.x = 900;
	self.images.wrench.y = 530;
	self.images.wrench.isVisible = false;
	-- Did pick up weapon?
	self.images.wrench.alreadyGet = false;
	self.displayGroup:insert(self.images.wrench);
end

-- Pick up weapon by name
-- @name - weapon name
function Weapon:pickUp(name)
	if Weapon:getAlreadyGet(name) then
		return;
	end

	self.images[name].isVisible = true;

	transition.to(self.images[name], {
		time = 300,
		x = display.contentCenterX,
		y = display.contentCenterY,
		onComplete = function()
			timer.performWithDelay(300, function()
				transition.to(self.images.wrench, {
					time = 500,
					xScale = 1,
					yScale = 1,
					x = self.images.wrench.x - 200,
					y = display.contentHeight,
					onComplete = function()
						self.images[name].alreadyGet = true;
					end
				});
			end);
		end
	});
end

-- Throw weapon by name
function Weapon:throw(name)
	self.images[name].isVisible = false;
end

function Weapon:getAlreadyGet(name)
	return self.images[name].alreadyGet;
end

-- Get diary weapon group
function Weapon:getDisplayGroup()
	return self.displayGroup;
end

return Weapon;