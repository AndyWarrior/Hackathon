display.setStatusBar( display.HiddenStatusBar )

local topY = display.screenOriginY --Numerical value for the top of the screen
local rightX = display.contentWidth - display.screenOriginX --Numerical value for the right of the screen
local bottomY = display.contentHeight - display.screenOriginY --Numerical value for the bottom of the screen
local leftX = display.screenOriginX --Numerical value for the left of the screen
local screenW = rightX - leftX --Numerical value for the width of the screen
local screenH = bottomY - topY --Numerical value for the height of the screen

character = display.newImageRect("Character.png",50,50)
character:setReferencePoint(display.TopLeftReferencePoint)
character.x = leftX + screenW/20
character.y = screenH/2 - character.height/2 + topY
print(character.x)
print(character.y)

playButton = display.newImageRect("Play.png",100,50)
playButton:setReferencePoint(display.TopLeftReferencePoint)
playButton.x = rightX - playButton.width - screenW/20
playButton.y = screenH/2 - playButton.height/2 + topY

tile1 = display.newImageRect("Tile.png",50,50)
tile1:setReferencePoint(display.TopLeftReferencePoint)
tile1.x = leftX + screenW/20 + tile1.width
tile1.y = screenH/2 - tile1.height/2 + topY

tile2 = display.newImageRect("Tile.png",50,50)
tile2:setReferencePoint(display.TopLeftReferencePoint)
tile2.x = leftX + screenW/20 + tile1.width*2
tile2.y = screenH/2 - tile1.height/2 + topY

tile3 = display.newImageRect("Tile.png",50,50)
tile3:setReferencePoint(display.TopLeftReferencePoint)
tile3.x = leftX + screenW/20 + tile1.width*2
tile3.y = screenH/2 - tile1.height/2 + topY - tile3.height

tile4 = display.newImageRect("Tile.png",50,50)
tile4:setReferencePoint(display.TopLeftReferencePoint)
tile4.x = leftX + screenW/20 + tile1.width*2
tile4.y = screenH/2 - tile1.height/2 + topY - tile3.height*2

tile5 = display.newImageRect("Tile.png",50,50)
tile5:setReferencePoint(display.TopLeftReferencePoint)
tile5.x = leftX + screenW/20 + tile1.width*3
tile5.y = screenH/2 - tile1.height/2 + topY - tile3.height*2

tile6 = display.newImageRect("Tile.png",50,50)
tile6:setReferencePoint(display.TopLeftReferencePoint)
tile6.x = leftX + screenW/20 + tile1.width*4
tile6.y = screenH/2 - tile1.height/2 + topY - tile3.height*2

tile7 = display.newImageRect("Tile.png",50,50)
tile7:setReferencePoint(display.TopLeftReferencePoint)
tile7.x = leftX + screenW/20 + tile1.width*5
tile7.y = screenH/2 - tile1.height/2 + topY - tile3.height*2

tile8 = display.newImageRect("Tile.png",50,50)
tile8:setReferencePoint(display.TopLeftReferencePoint)
tile8.x = leftX + screenW/20 + tile1.width*6
tile8.y = screenH/2 - tile1.height/2 + topY - tile3.height*2

tile9 = display.newImageRect("Tile.png",50,50)
tile9:setReferencePoint(display.TopLeftReferencePoint)
tile9.x = leftX + screenW/20 + tile1.width*6
tile9.y = screenH/2 - tile1.height/2 + topY - tile3.height

character:toFront()

counter = 1

local instructions = {
        [1] = 1,
        [2] = 1,
        [3] = 3,
        [4] = 2,
        [5] = 1,
		[6] = 1,
        [7] = 1,
        [8] = 1,
        [9] = 4
    }
	
local answers = {
    [1] = 1,
    [2] = 1,
    [3] = 3,
    [4] = 3,
    [5] = 1,
	[6] = 1,
    [7] = 1,
    [8] = 1,
    [9] = 4
    }


function moveCharacter()
	local x = instructions[counter]
	local y = answers[counter]
	print("counter "..counter)
	if x==1 then
		movement = transition.to(character, {time=500, x=character.x + character.width})
	elseif x==2 then
		movement = transition.to(character, {time=500, x=character.x - character.width})
	elseif x==3 then
		movement = transition.to(character, {time=500, y=character.y - character.width})
	elseif x==4 then
		movement = transition.to(character, {time=500, y=character.y + character.width})
	end
	
	if(x~=y) then
		print("no es igual "..counter)
		restartGame()
	else
		print("si es igual "..counter)
		counter = counter + 1
		
		if counter > #instructions then
			timer.cancel(timerCongelacion)
		end
	
	end
	
end

function startGame(event)
	playButton.alpha = 1
	counter = 1
	print(character.x)
		print(character.y)
	if(event.phase == "ended") then
		timerCongelacion = timer.performWithDelay( 550, moveCharacter, 0 )
		playButton:removeEventListener("touch",startGame)
	end
	
	if(event.phase == "began") then
		playButton.alpha = 0.5
	end
end

function restartGame()
	timer.cancel(timerCongelacion)
	timer.performWithDelay(600, function()
	character.x = leftX + screenW/20
	character.y = screenH/2 - character.height/2 + topY
	end,1)
	playButton:addEventListener("touch",startGame)
end

playButton:addEventListener("touch",startGame)