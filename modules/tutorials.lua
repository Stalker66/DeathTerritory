-----------------------------------------------------------------------------------------
-- Стрелка(Обучение)
-- tutorials.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------
Tutorials = {
}

Tutorials.metatable = {}
Tutorials.metatable.__index = Tutorials;

-- Animation arrow
function Tutorials:animateArrow(rotation)
	local function leftH()
		local function rightH()
			transition.to( self.name, { time=700, x=self.name.x+30, onComplete=leftH } );
		end
		transition.to( self.name, { time=700, x=self.name.x-30, onComplete=rightH } );
	end
	local function leftV()
		local function rightV()
			transition.to( self.name, { time=700, y=self.name.y+30, onComplete=leftV } );
		end
		transition.to( self.name, { time=700, y=self.name.y-30, onComplete=rightV } );
	end
	if rotation == "vertical" then
		self.name.rotation = 90;
		leftV();
	else
		leftH();
	end
end

-- Add arrow
function Tutorials:showArrow(name,x,y,rotation)
	self.name = display.newImage( 'img/tutorials/arrow.png', 0, 0);
	self.name.alpha = 0;
	self.name.x = x;
	self.name.y = y;
	transition.fadeIn(self.name, {time = 1000});
	Tutorials:animateArrow(rotation);
end

-- Remove arrow
function Tutorials:removeArrow(name)
	self.name:removeSelf();
	transition.cancel();
end

return Tutorials;