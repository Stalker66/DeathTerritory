local composer = require('composer');

Diary = {
	images = {
		diaryIcon = nil,
		diary = nil,
		back = nil
	},
	text = {
		pages = {

		}
	},
	diaryState = false,
	displayGroup = display.newGroup()
};

Diary.metatable = {};
Diary.metatable.__index = Diary;

function Diary:new()
	Diary:setImages();
	Diary:initText();
end

--Toggle diary module
local function toggleDiary()
	if(globalConfig.openedWindow == false) then
		globalConfig.openedWindow = true;
		
		Diary.images.diaryIcon.isVisible = Diary.diaryState;
		Diary.diaryState = not Diary.diaryState;
		Diary.images.diary.isVisible = Diary.diaryState;
		Diary.images.menu.isVisible = Diary.diaryState;
		Diary.images.back.isVisible = Diary.diaryState;
		Diary:toggleDiaryTitle(Diary.diaryState);
		Diary:toggleDiaryBody(false);

		local eventData = {
			name = 'toggleDiary',
			diaryState = Diary.diaryState
		}

		Runtime:dispatchEvent(eventData);
	end
end

-- Listener go to main menu
local function gotoMainMenu()
	local function gotoMainMenu_(event)
		if(event.index == 2) then
			Diary:toggleDiaryTitle(false);
			Diary:toggleDiaryBody(false);
			Diary.images.diary.isVisible = false;
			Diary.images.menu.isVisible = false;
			Diary.images.back.isVisible = false;

			-- Dispatch event go to main menu
			local eventData = {
				name = 'gotoMainMenu',
				diaryState = Diary.diaryState
			}

			Runtime:dispatchEvent(eventData);

			composer.gotoScene('scenes.main_menu');
		end
	end
	alert = native.showAlert(localization.alert.goToMainMenu.title, localization.alert.goToMainMenu.body, { localization.alert.no, localization.alert.yes }, gotoMainMenu_);
end

function Diary:setImages()
	-- Diary icon
	self.images.diaryIcon = display.newImage('img/modules/diary/diary-icon.png');
	self.images.diaryIcon:scale(0.7, 0.7);
	self.images.diaryIcon.x = display.contentWidth + self.images.diaryIcon.contentWidth/2;
	self.images.diaryIcon.y = 100;
	self.images.diaryIcon:addEventListener('tap', toggleDiary);
	transition.to(self.images.diaryIcon, {
		time = 1000,
		x = (display.contentWidth - self.images.diaryIcon.contentWidth/2)
	});
	self.displayGroup:insert(1, self.images.diaryIcon);

	-- Diary image
	self.images.diary = display.newImage('img/modules/diary/diary.png', display.contentCenterX, display.contentCenterY);
	self.images.diary.isVisible = false;
	self.displayGroup:insert(2, self.images.diary);

	-- Menu image
	self.images.menu = display.newImage('img/modules/diary/menu.png');
	self.images.menu.x = display.contentWidth - (display.contentWidth - self.images.diary.contentWidth)/2 + self.images.menu.contentWidth/2;
	self.images.menu.y = 180;
	self.images.menu.isVisible = false;
	self.displayGroup:insert(3, self.images.menu);
	self.images.menu:addEventListener('tap', gotoMainMenu);

	-- Back image
	self.images.back = display.newImage('img/modules/common/back.png');
	self.images.back.width = self.images.menu.width;
	self.images.back.height = self.images.menu.height;
	self.images.back.x = display.contentWidth - (display.contentWidth - self.images.diary.contentWidth)/2 + self.images.back.contentWidth/2;
	self.images.back.y = self.images.menu.y + self.images.menu.height + 20;
	self.images.back.isVisible = false;
	self.displayGroup:insert(4, self.images.back);
	self.images.back:addEventListener('tap', toggleDiary);
end

-- Init diary text
function Diary:initText()
	local currTitleOffsetTop = 0;
	local titleFontSize = 50;
	local bodyFontSize = 30;

	for key, val in pairs(localization['diary']) do
		Diary:addDiaryText(localization['diary'][1]['title'], localization['diary'][1]['body'], {
			title = {
				text = val.title,
				offsetTop = currTitleOffsetTop,
				offsetLeft = 0,
				fontSize = titleFontSize,
				color = {
					r = 0.1,
					g = 0.1,
					b = 0.1,
					a = 0.5
				},
				activeColor = {
					r = 0,
					g = 0,
					b = 0,
					a = 1
				}
			},
			body = {
				text = val.body,
				offsetTop = 0,
				offsetLeft = 50,
				fontSize = bodyFontSize,
				color = {
					r = 0,
					g = 0,
					b = 0
				}
			}
		});

		currTitleOffsetTop = currTitleOffsetTop + titleFontSize + 15;
	end
end

-- Create diary text(title, body)
function Diary:addDiaryText(title, body, options)
	local titleWidth = self.images.diary.width/2 - 40*2;
	local titleHeight = options.title.fontSize;
	local bodyWidth = self.images.diary.width/2 - 60*2;
	local bodyHeight = self.images.diary.height - 40*2;
	options.title.offsetLeft = options.title.offsetLeft + self.images.diary.width/2 - titleWidth;
	options.title.offsetTop = options.title.offsetTop + 50;

	options.body.offsetLeft = options.body.offsetLeft + self.images.diary.width/2;
	options.body.offsetTop = options.body.offsetTop + 50;
	local last = #self.text.pages + 1;

	-- Title
	self.text.pages[last] = {};
	self.text.pages[last].title = display.newText(options.title.text, titleWidth, titleHeight, native.systemFont, options.title.fontSize);
	self.text.pages[last].title:setFillColor(options.title.color.r, options.title.color.g, options.title.color.b, options.title.color.a);
	self.text.pages[last].title.x = (display.contentWidth - self.images.diary.width)/2 + self.text.pages[last].title.width/2 + options.title.offsetLeft;
	self.text.pages[last].title.y = (display.contentHeight - self.images.diary.height)/2 + self.text.pages[last].title.height/2 + options.title.offsetTop;
	self.text.pages[last].title.isVisible = false;
	self.text.pages[last].title.active = false;
	self.text.pages[last].title.activeColor = options.title.activeColor;
	self.displayGroup:insert(5, self.text.pages[last].title);
	self.text.pages[last].title:addEventListener('tap', function()
		if(self.text.pages[last].title.active) then
			Diary:toggleDiaryBody(false);
			self.text.pages[last].body.isVisible = true;
		end
	end);

	-- Body
	self.text.pages[last].body = display.newText(options.body.text, 350, 350, bodyWidth, bodyHeight, nil, options.body.fontSize);
	self.text.pages[last].body:setFillColor(options.body.color.r, options.body.color.g, options.body.color.b);
	self.text.pages[last].body.x = (display.contentWidth - self.images.diary.width)/2 + self.text.pages[last].body.width/2 + options.body.offsetLeft;
	self.text.pages[last].body.y = (display.contentHeight - self.images.diary.height)/2 + self.text.pages[last].body.height/2 + options.body.offsetTop;
	self.text.pages[last].body.isVisible = false;
	self.displayGroup:insert(5, self.text.pages[last].body);
end

-- Toggle diary titles
function Diary:toggleDiaryTitle(visibleState)
	for key, val in pairs(self.text.pages) do
		val.title.isVisible = visibleState;
	end
end

-- Toggle diary body
function Diary:toggleDiaryBody(visibleState)
	for key, val in pairs(self.text.pages) do
		val.body.isVisible = visibleState;
	end
end

-- Set available diary page
function Diary:toggleDiaryItem(index)
	self.text.pages[index].title.active = true;
	self.text.pages[index].title:setFillColor(
		self.text.pages[index].title.activeColor.r,
		self.text.pages[index].title.activeColor.g,
		self.text.pages[index].title.activeColor.b,
		self.text.pages[index].title.activeColor.a
	);
end

-- Get diary display group
function Diary:getDisplayGroup()
	return self.displayGroup;
end

return Diary;