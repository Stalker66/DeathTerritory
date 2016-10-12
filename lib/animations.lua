Animations = {};

Animations.metatable = {};

Animations.__index = Animations;

function Animations:toCenter(options)
	if options == nil then
		options = {};
	end

	if options.xScale == nil then
		options.xScale = 1;
	end

	if options.yScale == nil then
		options.yScale = 1;
	end

	transition.to();
end

return Animations;