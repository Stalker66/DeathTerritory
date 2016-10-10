ZombieAnimations = {
	images = {

	},
	shakeLeftToRigthData = {
		toLeft = false
	},
	displayGroup = display.newGroup()
};

ZombieAnimations.metatable = {};

ZombieAnimations.__index = ZombieAnimations;

function ZombieAnimations:new()
	ZombieAnimations:setImages();
end

function ZombieAnimations:setImages()
	-- Farm zombie idle
	self.images.farm = {};
	self.images.farm.idle = display.newImage('img/zombie_animations/farm/idle.png');
	self.images.farm.idle.x = display.contentCenterX;
	self.images.farm.idle.y = display.contentHeight - self.images.farm.idle.height/2;
	self.images.farm.idle.isVisible = false;
	self.displayGroup:insert(self.images.farm.idle);

	-- Farm zombie attack
	self.images.farm.attack = display.newImage('img/zombie_animations/farm/attack.png');
	self.images.farm.attack.isVisible = false;
	self.displayGroup:insert(self.images.farm.attack);
end

function ZombieAnimations:start(animationName, options)
	if options == nil then
		options = {};
	end

	if animationName == 'farm' then
		local attack = function()
			print('Hello');
			self.images.farm.idle.isVisible = false;
			self.images.farm.attack.isVisible = true;
			self.images.farm.attack.x = display.contentCenterX;
			self.images.farm.attack.y = display.contentCenterY;
		end

		self.images.farm.idle.isVisible = true;
		ZombieAnimations:shakeLeftToRigth(self.images.farm.idle, {
			time = 800,
			distance = 10,
			repeats = 3,
			listener = attack
		});
	end
end

function ZombieAnimations:shakeLeftToRigth(element, options)
	if options.repeats <= 0 then
		if options.listener ~= nil then
			options.listener();
		end

		return;
	end

	local toX;

	if self.shakeLeftToRigthData.toLeft then
		toX = element.x - options.distance; 
	else
		toX = element.x + options.distance;
	end

	self.shakeLeftToRigthData.toLeft = not self.shakeLeftToRigthData.toLeft;

	-- delay, repeats, distance
	element.trasition = transition.to(element, {
		time = options.time,
		x = toX,
		onComplete = function()
			options.repeats = options.repeats - 1;
			ZombieAnimations:shakeLeftToRigth(element, options);
		end
	});
end

-- Get diary display group
function ZombieAnimations:getDisplayGroup()
	return self.displayGroup;
end

return ZombieAnimations;