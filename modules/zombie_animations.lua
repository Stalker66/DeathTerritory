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

-- Hide all elements
function ZombieAnimations:showDeadMenu()
	self.images.deadMenu.background.isVisible = true;
	self.images.deadMenu.exit.isVisible = true;
	self.images.deadMenu.tryAdain.isVisible = true;

	diary:hideDiaryIcon();
	inventory:hideInventoryIcon();

	-- Hide all current visible stuffs
	Runtime:dispatchEvent({
		name = 'KillPlayer'
	});
end

-- Hide all items in display object group
function ZombieAnimations:hideAllDisplayObjects()
	for i = 1, self.displayGroup.numChildren do
		self.displayGroup[i].isVisible = false;
	end
end

-- Init images for dead menu
function ZombieAnimations:setImagesDeadMenu()
	self.images.deadMenu = {};

	-- Background
	self.images.deadMenu.background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight);
	self.images.deadMenu.background:setFillColor(0.6522, 0.08, 0.08, 0.75);
	self.images.deadMenu.background.isVisible = false;
	self.images.deadMenu.background:addEventListener('tap', function() return true; end);
	self.images.deadMenu.background:addEventListener('touch', function() return true; end);
	self.displayGroup:insert(self.images.deadMenu.background);

	-- Exit
	self.images.deadMenu.exit = display.newImage('img/common/exit.png');
	self.images.deadMenu.exit.x = display.contentCenterX - self.images.deadMenu.exit.width/2 - 2;
	self.images.deadMenu.exit.y = display.contentCenterY;
	self.images.deadMenu.exit.isVisible = false;
	self.displayGroup:insert(self.images.deadMenu.exit);
	self.images.deadMenu.exit:addEventListener('touch', function(event)
		if event.phase == 'began' then
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
			ZombieAnimations:hideAllDisplayObjects();

			composer.removeScene(composer.getSceneName('current'));
			composer.gotoScene(self.images.deadMenu.tryAdain.path);
		end
	end);
end

function ZombieAnimations:setTryAgainScene(name)
	self.images.deadMenu.tryAdain.path = name;
end

-- Init images for zombies
function ZombieAnimations:setImages()
	-- Background
	self.images.background = display.newRect(0, 0, display.contentWidth, display.contentHeight);
	self.images.background.x = self.images.background.width/2;
	self.images.background.y = self.images.background.height/2;
	self.images.background.alpha = globalConfig.alpha;
	self.images.background.isVisible = false;
	self.images.background:addEventListener('tap', function() return true; end);
	self.images.background:addEventListener('touch', function() return true; end);
	self.displayGroup:insert(self.images.background);

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
	self.images.farm.goal.alpha = globalConfig.alpha;
	self.images.farm.goal.kill = false;
	self.images.farm.goal.clickToKill = 0;
	self.images.farm.goal.clicksToKill = 3;
	self.images.farm.goal:setFillColor(0.5);
	self.images.farm.goal.isVisible = false;
	self.displayGroup:insert(self.images.farm.goal);
	self.images.farm.goal:addEventListener('touch', function(event)
		if (event.phase == 'began' and self.images.farm.goal.clickToKill >= self.images.farm.goal.clicksToKill and self.images.farm.goal.kill == false
			and weapon:getAlreadyGet('wrench') == true) then
			self.images.farm.goal.kill = true;
			
			transition.cancel(self.images.farm.idle);

			-- Throw weapon
			weapon:attack('wrench', {
				onComplete = function()
					self.images.farm.idle.isVisible = false;

					--	Add animation kill zombie
					self.images.farm.dead.isVisible = true;
					local deadTime = 500;

					transition.to(self.images.farm.dead.path, {
						time = deadTime,
						x1 = 100,
						y1 = 300,
						x4 = -100,
						y4 = 300
					});

					transition.to(self.images.farm.dead, {
						time = deadTime,
						y = self.images.farm.dead.y + 150, 
						onComplete = function()
							transition.fadeOut(self.images.farm.dead, {
								time = 10,
								onComplete = function()
									self.images.farm.dead.isVisible = false;
									self.images.background.isVisible = false;
									self.images.farm.goal.alpha = false;
								end
							});
						end
					});
				end
			});
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
	self.images.basement.spirit.x = 450;
	self.images.basement.spirit.y = 320;
	self.images.basement.spirit.alpha = 0;
	self.images.basement.spirit.isVisible = false;
	self.displayGroup:insert(self.images.basement.spirit);

	-- Basement sprit goal
	self.images.basement.goal = {};
	self.images.basement.goal.kill = false;

	-- Tunel zombie
	self.images.tunelEnter = {}
	self.images.tunelEnter.zombie = display.newImage('img/zombie_animations/tunelEnter/zombie.png');
	self.images.tunelEnter.zombie.x = display.contentCenterX;
	self.images.tunelEnter.zombie.y = display.contentHeight - 120;
	self.images.tunelEnter.zombie.isVisible = false;
	self.displayGroup:insert(self.images.tunelEnter.zombie);

	-- Tunel zombie goal
	self.images.tunelEnter.goal = {};
	self.images.tunelEnter.goal.kill = false;

	self.images.tunelEnter.goal = display.newCircle(0, 0, 50);
	self.images.tunelEnter.goal.x = display.contentCenterX + 30;
	self.images.tunelEnter.goal.y = display.contentCenterY - 80;
	self.images.tunelEnter.goal.alpha = globalConfig.alpha;
	self.images.tunelEnter.goal.kill = false;
	self.images.tunelEnter.goal.clickToKill = 0;
	self.images.tunelEnter.goal.clicksToKill = 3;
	self.images.tunelEnter.goal:setFillColor(0.5);
	self.images.tunelEnter.goal.isVisible = false;
	self.displayGroup:insert(self.images.tunelEnter.goal);
	self.images.tunelEnter.goal:addEventListener('touch', function(event)
		if (event.phase == 'began' and self.images.tunelEnter.goal.clickToKill >= self.images.tunelEnter.goal.clicksToKill and self.images.tunelEnter.goal.kill == false
			and weapon:getAlreadyGet('basementAx') == true) then
			self.images.tunelEnter.goal.kill = true;
			
			transition.cancel(self.images.tunelEnter.zombie);

			-- Throw weapon
			weapon:attack('tunelEnter', {
				onComplete = function()
					transition.to(self.images.tunelEnter.zombie.path, {
						time = 400,
						y1 = 100,
						y4 = 100
					});

					transition.to(self.images.tunelEnter.zombie, {
						time = 400,
						y = self.images.tunelEnter.zombie.y + 100,
						onComplete = function()
							self.images.tunelEnter.zombie.isVisible = false;
							transition.fadeOut(self.images.tunelEnter.zombie, {
								time = 10,
								onComplete = function()
									self.images.tunelEnter.zombie.isVisible = false;
									self.images.background.isVisible = false;
									self.images.tunelEnter.goal.alpha = false;
								end
							});
						end
					});
				end
			});
		elseif self.images.tunelEnter.goal.kill == false then
			print('this')
			self.images.tunelEnter.goal.clickToKill = self.images.tunelEnter.goal.clickToKill + 1;
		end
	end);
end

-- Start animation by name
function ZombieAnimations:start(animationName, options)
	if self.images[animationName].goal.kill then
		return;
	end

	if options == nil then
		options = {};
	end

	if options.onComplete == nil then
		options.onComplete = function() end;
	end

	self.images.background.isVisible = true;

	if animationName == 'farm' then
		self.images.farm.goal.isVisible = true;
		self.images.farm.idle.isVisible = true;

		ZombieAnimations:shakeLeftToRigth(self.images.farm.idle, {
			time = 800,
			distance = 10,
			repeats = 3,
			listener = function()
				self.images.farm.idle.isVisible = false;
				self.images.farm.attack.isVisible = true;
				self.images.farm.attack.x = display.contentCenterX;
				self.images.farm.attack.y = display.contentCenterY;

				weapon:resetWeapon('wrench');
				ZombieAnimations:setTryAgainScene('scenes.location_farm_outside');
				ZombieAnimations:attack(self.images.tunelEnter.zombie);
			end
		});
	elseif animationName == 'basement' then
		local animationTime = 2000;
		local fadeInTime = 300;
		local fadeOutTime = 500;
		local fadeInOutFastTime = 50;
		local fadeInOutTimeDelay = 300;

		self.images.basement.spirit.isVisible = true;

		transition.to(self.images.basement.spirit, {
			time = fadeInTime,
			alpha = 1
		});

		timer.performWithDelay(350, function()
			transition.to(self.images.basement.spirit, {
				time = fadeInOutFastTime,
				alpha = 0
			});
		end);

		timer.performWithDelay(410, function()
			transition.to(self.images.basement.spirit, {
				time = fadeInOutFastTime,
				alpha = 1
			});
		end);

		timer.performWithDelay(470, function()
			transition.to(self.images.basement.spirit, {
				time = fadeInOutFastTime,
				alpha = 0
			});
		end);

		timer.performWithDelay(450, function()
			transition.to(self.images.basement.spirit, {
				time = fadeInOutFastTime,
				alpha = 1
			});
		end);

		timer.performWithDelay(900, function()
			transition.to(self.images.basement.spirit, {
				time = fadeInOutFastTime,
				alpha = 0
			});
		end);

		timer.performWithDelay(1300, function()
			transition.to(self.images.basement.spirit, {
				time = fadeInOutFastTime,
				alpha = 1
			});
		end);

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
				self.images.basement.goal.kill = true;
				self.images.background.isVisible = false;

				options.onComplete();
			end
		});
	elseif animationName == 'tunelEnter' then
		self.images.tunelEnter.goal.isVisible = true;
		self.images.tunelEnter.zombie.isVisible = true;

		ZombieAnimations:shakeLeftToRigth(self.images.tunelEnter.zombie, {
			time = 800,
			distance = 10,
			repeats = 3,
			listener = function()
				weapon:resetWeapon('basementAx');

				ZombieAnimations:setTryAgainScene('scenes.location_basement');
				ZombieAnimations:attack(self.images.tunelEnter.zombie);
			end
		});
	end
end

-- Shake Left->Right animation for zombie
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

function ZombieAnimations:attack(zombie, name)
	if name == nil then
		name = 'default';
	end

	if name == 'default' then
		transition.to(zombie, {
			time = 250,
			xScale = 1.2,
			yScale = 1.2,
			onComplete = function()
				ZombieAnimations:showDeadMenu();

				transition.to(zombie, {
					time = 350,
					xScale = 1,
					yScale = 1
				});
			end
		});
	end
end

-- Get diary display group
function ZombieAnimations:getDisplayGroup()
	return self.displayGroup;
end

return ZombieAnimations;