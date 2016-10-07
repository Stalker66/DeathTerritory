-----------------------------------------------------------------------------------------
-- Таймер
-- timer.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------
Timer = {
}

Timer.metatable = {}
Timer.metatable.__index = Timer;

-- Add timer
function Timer:showTimer(func)
	self.timer = display.newImage( 'img/timer/clock.png', display.contentCenterX, display.contentCenterY);
	self.hand = display.newImage( 'img/timer/hand.png', 618, 350);
	self.center_clock = display.newImage( 'img/timer/center_clock.png', 618, 350);
	self.hand.rotation = 43;
	self.timer.alpha = 0;
	self.hand.alpha = 0;
	self.center_clock.alpha = 0;
	snd:play("timer","snd1");
	transition.fadeIn(self.hand, {time = 1000});
	transition.fadeIn(self.center_clock, {time = 1000});
	transition.fadeIn(self.timer, {time = 1000});
	local function animateTimer()
		local function endAnim()
			transition.fadeOut(self.hand, {time = 1000});
			transition.fadeOut(self.center_clock, {time = 1000, onComplete=func});
			transition.fadeOut(self.timer, {time = 1000});
			snd:stop("timer","snd1");
		end
		transition.to( self.hand, { time=6500, rotation=402, onComplete=endAnim } );
		transition.to( self.center_clock, { time=6500, rotation=-180} );
	end
	animateTimer();
end

return Timer;