local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

display.setStatusBar( display.HiddenStatusBar )

local storyboard = require "storyboard"

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

counter = 0

instructionType = 0;

local images = {
        [1] = tile1,
        [2] = tile2,
        [3] = tile3,
        [4] = tile4,
        [5] = tile5,
		[6] = tile6,
        [7] = tile7,
        [8] = tile8,
        [9] = tile9
    }
	
local positions = {
	[1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
	[6] = false,
    [7] = false,
    [8] = false,
    [9] = false
}

local instructions = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
		[6] = 0,
        [7] = 0,
        [8] = 0,
        [9] = 0
    }
	
local answers = {
    [1] = 1,
    [2] = 3,
    [3] = 3,
    [4] = 1,
    [5] = 1,
	[6] = 1,
    [7] = 1,
    [8] = 4,
    [9] = 4
    }
	


function moveCharacter()
	if counter == 0 then
		movement = transition.to(character, {time=500, x=character.x + character.width})
		counter = counter + 1
	
	else
	
		local x = instructions[counter]
		local y = answers[counter]
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
			restartGame()
		else
			counter = counter + 1
			
			if counter > #instructions then
				timer.cancel(timerCongelacion)
				nextLevel()
			end
		
		end
	end
	
end

function startGame(event)
	playButton.alpha = 1
	counter = 0
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

function nextLevel()
	timer.performWithDelay( 2000, function()
		local options =
		{
		effect = "fade",
		time = 500,
		}
		storyboard.gotoScene("level2", options)
		storyboard.removeScene("level1")
	end, 1)
end

function updateArray(img)
	for i=1, #images do
		if images[i].x == img.x and images[i].y == img.y then
			positions[i] = false
			instructions[i] = 0
		end
	end
end

function checkArray()
	for i=1, #positions do
		if positions[i]==false then
			positions[i] = true
			return i
		end
	end
	return #positions + 1
end

function createInterface()
	barGroup = display.newGroup()
	bar = display.newImageRect("Imagenes/barra.png",screenW,80)
	bar.name = "bar"
	bar:setReferencePoint(display.TopLeftReferencePoint)
	bar:toBack()
	bar.x = leftX
	bar.y = bottomY - bar.height
	barGroup:insert( bar )
	barGroup:toBack()


	imagesGroup = display.newGroup()
	imagesGroup:toFront()


	spaceX = 50
	leftImage = display.newImageRect("Imagenes/yellow.png",50,50)
	leftImage.name = "leftImage"
	leftImage:setReferencePoint(display.TopLeftReferencePoint)
	leftImage.x = leftX + leftImage.width/2 + spaceX - 10
	leftImage.y = bottomY - leftImage.height - leftImage.height/2
	imagesGroup:insert( leftImage )
	 
	rightImage = display.newImageRect("Imagenes/blue.png",50,50)
	rightImage.name = "rightImage"
	rightImage:setReferencePoint(display.TopLeftReferencePoint)
	rightImage.x = leftX + leftImage.x + leftImage.width + spaceX
	rightImage.y = bottomY - leftImage.height - leftImage.height/2 
	imagesGroup:insert( rightImage )

	 
	upImage = display.newImageRect("Imagenes/red.png",50,50)
	upImage.name = "upImage"
	upImage:setReferencePoint(display.TopLeftReferencePoint)
	upImage.x = leftX + rightImage.x + leftImage.width + spaceX
	upImage.y = bottomY - upImage.height - upImage.height/2 
	imagesGroup:insert( upImage )

	downImage = display.newImageRect("Imagenes/green.png",50,50)
	downImage.name = "downImage"
	downImage:setReferencePoint(display.TopLeftReferencePoint)
	downImage.x = leftX + upImage.x + leftImage.width + spaceX
	downImage.y = bottomY - upImage.height - upImage.height/2 
	imagesGroup:insert( downImage )




	function myTouchListener( event )


		if event.target.name ~= "DraggingEnded" then  -- Will enter if the image is new or it is being dragged


			if event.target.name == "newImage" then
		
				event.target.x0 = event.x - event.target.x
				event.target.y0 = event.y - event.target.y

				event.target.name = "imageDragging"
				createImage( event.target )

				return 
			end


			if event.phase == "began" then


				createImage( event.target )
				event.target.name = "imageDragging"

				display.getCurrentStage():setFocus( event.target )
				event.target.isFocus = true

				event.target.x0 = event.x - event.target.x
				event.target.y0 = event.y - event.target.y

			elseif event.target.isFocus then


				if event.phase == "moved" then
				
				event.target:toFront()

				event.target.x = event.x - event.target.x0
				event.target.y = event.y - event.target.y0

				elseif event.phase == "ended" or event.phase == "cancelled" then

					display.getCurrentStage():setFocus( nil )
					event.target.isFocus = false
					event.target.name = "DraggingEnded"
					-- Revisar posición de imagen. 
					checkPositionOfImageInY(event.target)

				end


			end

		else  -- Image is inside the grid, if the user touches it, it will be deleted from the screen. 

			if event.phase == "began" then
				updateArray(event.target)
				event.target:removeSelf()
			end
		end

		return true

	end


	function checkPositionOfImageInY ( img )

		if img.y + img.height > bar.y then
			img:removeSelf()

		else
			local p = checkArray()
			if p <= #answers then
				img.x = images[p].x
				img.y = images[p].y
				instructions[p] = instructionType
			else img:removeSelf() end

		end
	end



	function createImage( img )

		local newImage
		if img.x == 65 then
			newImage = display.newImageRect("Imagenes/yellow.png",50,50)
			instructionType = 1
		elseif img.x == 165 then
			newImage = display.newImageRect("Imagenes/blue.png",50,50)
			instructionType = 2
		elseif img.x == 265 then
			newImage = display.newImageRect("Imagenes/red.png",50,50)
			instructionType = 3
		elseif img.x == 365 then
			newImage = display.newImageRect("Imagenes/green.png",50,50)
			instructionType = 4
		end


		newImage:toBack()
		newImage.name = "newImage"
		newImage:setReferencePoint(display.TopLeftReferencePoint)
		newImage.x = img.x
		newImage.y = img.y
		imagesGroup:insert( newImage )


		newImage:addEventListener( "touch", myTouchListener )
	end


	leftImage:addEventListener( "touch", myTouchListener )
	rightImage:addEventListener( "touch", myTouchListener )
	upImage:addEventListener( "touch", myTouchListener )
	downImage:addEventListener( "touch", myTouchListener )
end

playButton:addEventListener("touch",startGame)
createInterface()
character:toFront()

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

return scene