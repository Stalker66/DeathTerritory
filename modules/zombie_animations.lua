local composer = require('composer');

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
	ZombieAnimations:setImagesDeadMenu();
end

function ZombieAnimations:showDeadMenu()
	self.images.deadMenu.background.isVisible = true;
	self.images.deadMenu.exit.isVisible = true;
	self.images.deadMenu.tryAdain.isVisible = true;
end

function ZombieAnimations:setImagesDeadMenu()
	self.images.deadMenu = {};

	-- Background
	self.images.deadMenu.background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight);
	self.images.deadMenu.background:setFillColor(0.6522, 0.08, 0.08, 0.75);
	self.images.deadMenu.background.isVisible = false;
	self.displayGroup:insert(self.images.deadMenu.background);

	-- Exit
	self.images.deadMenu.exit = display.newImage('img/common/exit.png');
	self.images.deadMenu.exit.x = display.contentCenterX - self.images.deadMenu.exit.width/2 - 2;
	self.images.deadMenu.exit.y = display.contentCenterY;
	self.images.deadMenu.exit.isVisible = false;
	self.displayGroup:insert(self.images.deadMenu.exit);
	self.images.deadMenu.exit:addEventListener('touch', function(event)
		if event.phase == 'began' then
			self.images.deadMenu.exit.isVisible = false;
			self.images.farm.attack.isVisible = false;
			self.images.deadMenu.tryAdain.isVisible = false;
			self.displayGroup.isVisible = false;

			Runtime:dispatchEvent({
				name = 'gotoMainMenu'
			});

			composer.gotoScene('scenes.main_menu');
		end
	end);

	-- Repeat
	self.images.deadMenu.tryAdain = display.newImage('img/common/repeat.png');
	self.images.deadMenu.tryAdain.x = display.contentCenterX + self.images.deadMenu.tryAdain.width/2 + 2;
	self.images.deadMenu.tryAdain.y = display.contentCenterY;
	self.images.deadMenu.tryAdain.isVisible = false;
	self.displayGroup:insert(self.images.deadMenu.tryAdain);
	self.images.deadMenu.tryAdain:addEventListener('touch', function(event)
		if event.phase == 'began' then
			self.images.deadMenu.background.isVisible = false;
			self.images.deadMenu.exit.isVisible = false;
			self.images.farm.attack.isVisible = false;
			self.images.deadMenu.tryAdain.isVisible = false;
			self.displayGroup.isVisible = false;

			composer.removeScene( "scenes.location_farm_inside" );
			composer.gotoScene('scenes.location_farm_outside');
		end
	end);
end

function ZombieAnimations:setImages()
	-- Farm zombie idle
	self.images.farm = {};
	self.images.farm.idle = display.newImage('img/zombie_animations/farm/idle.png');
	self.images.farm.idle.x = display.contentCenterX;
	self.images.farm.idle.y = display.contentHeight - self.images.farm.idle.height/2;
	self.images.farm.idle.isVisible = false;
	self.displayGroup:insert(self.images.farm.idle);

	-- Farm zombie 
	self.images.farm.goal = display.newCircle(0, 0, 75);
	self.images.farm.goal.x = display.contentCenterX + 30;
	self.images.farm.goal.y = display.contentCenterY - 160;
	self.images.farm.goal.alpha = 0;
	self.images.farm.goal.kill = false;
	self.images.farm.goal.clickToKill = 0;
	self.images.farm.goal.clicksToKill = 3;
	self.images.farm.goal:setFillColor(0.5);
	self.displayGroup:insert(self.images.farm.goal);
	self.displayGroup:addEventListener('touch', function(event)
		if (event.phase == 'began' and self.images.farm.goal.clickToKill >= self.images.farm.goal.clicksToKill and self.images.farm.goal.kill == false) then
			self.images.farm.goal.kill = true;
			
			transition.cancel(self.images.farm.idle);
			self.images.farm.idle.isVisible = false;
			self.images.farm.dead.isVisible = true;
		elseif self.images.farm.goal.kill == false then
			self.images.farm.goal.clickToKill = self.images.farm.goal.clickToKill + 1;
		end
	end);

	-- Farm zombie attack
	self.images.farm.attack = display.newImage('img/zombie_animations/farm/attack.png');
	self.images.farm.attack.x = display.contentCenterX;
	self.images.farm.attack.y = display.contentHeight - self.images.farm.attack.height/2;
	self.images.farm.attack.isVisible = false;
	self.displayGroup:insert(self.images.farm.attack);

	-- Farm zombie dead
	self.images.farm.dead = display.newImage('img/zombie_animations/farm/dead.png');
	self.images.farm.dead.x = display.contentCenterX;
	self.images.farm.dead.y = display.contentHeight - self.images.farm.dead.height/2;
	self.images.farm.dead.isVisible = false;
	self.displayGroup:insert(self.images.farm.dead);

	-- Basement sprit
	self.images.basement = {}
	self.images.basement.spirit = display.newImage('img/zombie_animations/basement/spririt.png');
	self.images.basement.spirit.x = display.contentCenterX + 30;
	self.images.basement.spirit.y = self.images.basement.spirit.height/2;
	self.images.basement.spirit.alpha = 0;
	self.images.basement.spirit.isVisible = true;
	self.displayGroup:insert(self.images.basement.spirit);
end

function ZombieAnimations:start(animationName, options)
	self.displayGroup.isVisible = true;
	if options == nil then
		options = {};
	end

	if options.onComplete == nil then
		options.onComplete = function() end;
	end

	if animationName == 'farm' then
		local attack = function()
			self.images.farm.idle.isVisible = false;
			self.images.farm.attack.isVisible = true;
			self.images.farm.attack.x = display.contentCenterX;
			self.images.farm.attack.y = display.contentCenterY;

			transition.to(self.images.farm.attack, {
				time = 250,
				xScale = 1.2,
				yScale = 1.2,
				onComplete = function()
					ZombieAnimations:showDeadMenu();

					transition.to(self.images.farm.attack, {
						time = 350,
						xScale = 1,
						yScale = 1
					});
				end
			});
		end

		self.images.farm.idle.isVisible = true;
		ZombieAnimations:shakeLeftToRigth(self.images.farm.idle, {
			time = 800,
			distance = 10,
			repeats = 3,
			listener = attack
		});
	elseif animationName == 'spirit' then
		local animationTime = 3500;
		local fadeInTime = 300;
		local fadeOutTime = 500;

		self.images.basement.spirit.isVisible = true;

		transition.to(self.images.basement.spirit, {
			time = fadeInTime,
			alpha = 1
		});

		timer.performWithDelay(animationTime - fadeOutTime, function()
			transition.to(self.images.basement.spirit, {
				time = fadeOutTime0,
				alpha = 0
			});
		end);

		transition.to(self.images.basement.spirit, {
			time = animationTime,
			x = 150,
			y = display.contentHeight - self.images.basement.spirit.height/2,
			onComplete = function()
				self.images.basement.spirit.isVisible = false;

				options.onComplete();
			end
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