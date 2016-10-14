FoundStuff = {
	images = {},
	displayGroup = display.newGroup()
};

FoundStuff.metable = {};

FoundStuff.__index = FoundStuff;

function FoundStuff:new()
	FoundStuff:setImages();

	-- Add runtime error "KillPlayer" when playes was killed
	Runtime:addEventListener('KillPlayer', function()
		FoundStuff:hideStuffs();
	end);
end

function FoundStuff:setImages()
	-- Farm key
	self.images.farmKey = display.newImage('img/stuffs/key.png');
	self.images.farmKey:scale(0.1, 0.1);
	self.images.farmKey.x = 300;
	self.images.farmKey.y = 100;
	self.images.farmKey.rotation = 90;
	self.images.farmKey.isVisible = false;
	-- Pick uped element
	self.images.farmKey.pickUped = false;
	self.images.farmKey.used = false;
	self.displayGroup:insert(self.images.farmKey);

	for key, item in pairs(self.images) do
		item:addEventListener('touch', function(event)
			FoundStuff:pickUp(key);
		end);
	end
end

function FoundStuff:showStuff(name)
	self.images[name].isVisible = true;
end

function FoundStuff:hideStuff(name)
	if not self.images[name].pickUped then
		self.images[name].isVisible = false;
	end
end

function FoundStuff:throwStuff(name)
	FoundStuff:usedStuff(name);
end

function FoundStuff:pickUp(name)
	-- Pick up stuff only once
	if (self.images[name].pickUped or globalConfig.openedWindow == true) then
		return;
	end

	self.images[name].pickUped = true;

	transition.to(self.images[name], {
		time = 300,
		x = display.contentCenterX,
		y = display.contentCenterY,
		xScale = 1,
		yScale = 1,
		rotation = 0,
		onComplete = function()
			local width = 220;
			local height = 100;

			timer.performWithDelay(1000, function()
				transition.to(self.images[name], {
					time = 300,
					x = width/2 + 20,
					y = display.contentHeight - height/2 - 20,
					width = width,
					height = height
				});
			end);
		end
	});
end

-- Want to use stuff, after this, hide stuff and set that element was used
function FoundStuff:usedStuff(name)
	-- Set that stuff was used
	self.images[name].used = true;

	transition.fadeOut(self.images[name], {
		time = 150,
		onComplete = function()
			self.images[name].isVisible = false
		end
	})
end

function FoundStuff:getPickedUp(name)
	return self.images[name].pickUped;
end

-- Hide all stuffs
function FoundStuff:hideStuffs()
	for key, item in pairs(self.images) do
		item.isVisible = false;
	end
end

-- Get diary weapon group
function FoundStuff:getDisplayGroup()
	return self.displayGroup;
end

return FoundStuff;