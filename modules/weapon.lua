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
	self.images.wrench.x = 810;
	self.images.wrench.y = 480;
	self.images.wrench.isVisible = false;
	self.images.wrench.options = { }
	-- Did pick up weapon?
	self.images.wrench.alreadyGet = false;
	self.displayGroup:insert(self.images.wrench);

	-- Ax
	self.images.basementAx = display.newImage('img/weapon/ax.png');
	self.images.basementAx:scale(0.3, 0.3);
	self.images.basementAx.x = 1168;
	self.images.basementAx.y = 570;
	self.images.basementAx.rotation = -90;
	self.images.basementAx.isVisible = false;
	-- Did pick up weapon?
	self.images.basementAx.alreadyGet = false;
	self.images.basementAx.options = {
		idleRotation = -45,
		middleXScale = 0.7,
		middleYScale = 0.7,
		xOffset = -120,
		yOffset = 80
	}
	self.displayGroup:insert(self.images.basementAx);

	-- Blood
	self.images.blood = display.newImage('img/common/blood.png');
	self.images.blood:scale(0.5, 0.5);
	self.images.blood.y = 280;
	self.images.blood.x = display.contentWidth - 300;
	self.images.blood.isVisible = false;
	self.displayGroup:insert(self.images.blood);
end

-- Pick up weapon by name
-- @name - weapon name
function Weapon:pickUp(name, func)
	if(Weapon:getAlreadyGet(name) or globalConfig.openedWindow == true)then
		return;
	end

	if func == nil then
		func = function() end;
	end

	if self.images[name].options == nil then
		self.images[name].options = {};
	end

	if self.images[name].options.idleRotation == nil then
		self.images[name].options.idleRotation = 0;
	end

	if self.images[name].options.middleXScale == nil then
		self.images[name].options.middleXScale = self.images[name].xScale;
	end

	if self.images[name].options.middleXScale == nil then
		self.images[name].options.middleXScale = self.images[name].yScale;
	end

	if self.images[name].options.xOffset == nil then
		self.images[name].options.xOffset = 0;
	end

	if self.images[name].options.yOffset == nil then
		self.images[name].options.yOffset = 0;
	end

	globalConfig.openedWindow = true
	self.images[name].isVisible = true;
	globalConfig.canGo = false;

	transition.to(self.images[name], {
		time = 300,
		rotation = 0,
		x = display.contentCenterX,
		y = display.contentCenterY,
		xScale = self.images[name].options.middleXScale,
		yScale = self.images[name].options.middleYScale,
		onComplete = function()
			timer.performWithDelay(300, function()
				Weapon:pickUpFromCenter(name, func);
			end);
		end
	});
end

function Weapon:pickUpFromCenter(name, func)
	if func == nil then
		func = function() end;
	end
	
	transition.to(self.images[name], {
		time = 500,
		rotation = self.images[name].options.idleRotation,
		xScale = 1,
		yScale = 1,
		x = self.images[name].x - 200 + self.images[name].options.xOffset,
		y = display.contentHeight + self.images[name].options.yOffset,
		onComplete = function()
			globalConfig.openedWindow = false;
			globalConfig.canGo = true;
			self.images[name].alreadyGet = true;

			func();
		end
	});
end

function Weapon:attack(name, options)
	if (name == 'wrench') then
		transition.to(self.images[name], {
			time = 300,
			x = display.contentCenterX - 95,
			y = display.contentCenterY - 160,
			xScale = 0.22,
			yScale = 0.22,
			onComplete = function()
				self.images[name].isVisible = false;
				Weapon:showBlood();

				options.onComplete();
			end
		});
	elseif name == 'tunelEnter' then
		local time = 300;
		
		transition.to(self.images.basementAx, {
			time = time,
			x = 364,
			y = 330,
			xScale = 0.85,
			yScale = 0.85,
			rotation = -110,
			onComplete = function()
				transition.to(self.images.basementAx, {
					time = time,
					y = self.images.basementAx.y + 70,
					x = self.images.basementAx.x + 60,
					xScale = 0.7,
					yScale = 0.7,
					rotation = -45,
					onComplete = function()
						Weapon:showBlood();
						options.onComplete();

						Weapon:pickUpFromCenter('basementAx');
					end
				});
			end
		});
	end
end

-- Throw weapon by name
function Weapon:throw(name)
	self.images[name].isVisible = false;
end

function Weapon:resetWeapon(name)
	self.images[name].isVisible = false;
	self.images[name].alreadyGet = false;

	if name == 'wrench' then
		self.images.wrench:scale(0.3, 0.3);
		self.images.wrench.x = 810;
		self.images.wrench.y = 480;
	elseif name == 'basementAx' then
		self.images.basementAx:scale(0.3, 0.3);
		self.images.basementAx.x = 1168;
		self.images.basementAx.y = 570;
		self.images.basementAx.rotation = -90;
	end
end

function Weapon:getAlreadyGet(name)
	return self.images[name].alreadyGet;
end

-- Show blood
function Weapon:showBlood()
	self.images.blood.isVisible = true;
	self.images.blood.alpha = 0;

	transition.to(self.images.blood, {
		time = 250,
		alpha = 1,
		onComplete = function()
			transition.to(self.images.blood, {
				time = 2000,
				alpha = 0,
				onComplete = function()
					self.images.blood.isVisible = false;
				end
			});
		end
	});
end

-- Get diary weapon group
function Weapon:getDisplayGroup()
	return self.displayGroup;
end

return Weapon;