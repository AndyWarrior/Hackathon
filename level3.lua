display.setStatusBar( display.HiddenStatusBar )


local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local topY = display.screenOriginY --Numerical value for the top of the screen
local rightX = display.contentWidth - display.screenOriginX --Numerical value for the right of the screen
local bottomY = display.contentHeight - display.screenOriginY --Numerical value for the bottom of the screen
local leftX = display.screenOriginX --Numerical value for the left of the screen
local screenW = rightX - leftX --Numerical value for the width of the screen
local screenH = bottomY - topY --Numerical value for the height of the screen





-- Crea bg y remplace level 1 y poner 6 botones abajo, cuando haga eso lo paso y hace los nieveles. 
levelTwoBackground = display.newImageRect("Background.png",screenW,screenH)
levelTwoBackground:setReferencePoint(display.TopLeftReferencePoint)
levelTwoBackground.x = leftX
levelTwoBackground.y = topY

character = display.newImageRect("Character.png",50,50)
character:setReferencePoint(display.TopLeftReferencePoint)
character.x = leftX + screenW/20
character.y = screenH/2 - character.height/2 + topY

playButton = display.newImageRect("Play.png",100,50)
playButton:setReferencePoint(display.TopLeftReferencePoint)
playButton.x = rightX - playButton.width - screenW/20
playButton.y = screenH/5 - playButton.height/2 + topY

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
tile3.x = leftX + screenW/20 + tile1.width*3
tile3.y = screenH/2 - tile1.height/2 + topY

tile4 = display.newImageRect("Tile.png",50,50)
tile4:setReferencePoint(display.TopLeftReferencePoint)
tile4.x = leftX + screenW/20 + tile1.width*4
tile4.y = screenH/2 - tile1.height/2 + topY

tile5 = display.newImageRect("Tile.png",50,50)
tile5:setReferencePoint(display.TopLeftReferencePoint)
tile5.x = leftX + screenW/20 + tile1.width*5
tile5.y = screenH/2 - tile1.height/2 + topY

tile6 = display.newImageRect("Tile.png",50,50)
tile6:setReferencePoint(display.TopLeftReferencePoint)
tile6.x = leftX + screenW/20 + tile1.width*6
tile6.y = screenH/2 - tile1.height/2 + topY




tile7 = display.newImageRect("Tile.png",50,50)
tile7:setReferencePoint(display.TopLeftReferencePoint)
tile7.x = leftX + screenW/20 + tile1.width
tile7.y = screenH/2 - tile1.height/2 + topY

tile8 = display.newImageRect("Tile.png",50,50)
tile8:setReferencePoint(display.TopLeftReferencePoint)
tile8.x = leftX + screenW/20 + tile1.width*2
tile8.y = screenH/2 - tile1.height/2 + topY

tile9 = display.newImageRect("Tile.png",50,50)
tile9:setReferencePoint(display.TopLeftReferencePoint)
tile9.x = leftX + screenW/20 + tile1.width*3
tile9.y = screenH/2 - tile1.height/2 + topY

tile10 = display.newImageRect("Tile.png",50,50)
tile10:setReferencePoint(display.TopLeftReferencePoint)
tile10.x = leftX + screenW/20 + tile1.width*4
tile10.y = screenH/2 - tile1.height/2 + topY

tile11 = display.newImageRect("Tile.png",50,50)
tile11:setReferencePoint(display.TopLeftReferencePoint)
tile11.x = leftX + screenW/20 + tile1.width*5
tile11.y = screenH/2 - tile1.height/2 + topY

tile12 = display.newImageRect("Tile.png",50,50)
tile12:setReferencePoint(display.TopLeftReferencePoint)
tile12.x = leftX + screenW/20 + tile1.width*6
tile12.y = screenH/2 - tile1.height/2 + topY



tile13 = display.newImageRect("Tile.png",50,50)
tile13:setReferencePoint(display.TopLeftReferencePoint)
tile13.x = leftX + screenW/20 + tile1.width
tile13.y = screenH/2 - tile1.height/2 + topY

tile14 = display.newImageRect("Tile.png",50,50)
tile14:setReferencePoint(display.TopLeftReferencePoint)
tile14.x = leftX + screenW/20 + tile1.width*2
tile14.y = screenH/2 - tile1.height/2 + topY

tile15 = display.newImageRect("Tile.png",50,50)
tile15:setReferencePoint(display.TopLeftReferencePoint)
tile15.x = leftX + screenW/20 + tile1.width*3
tile15.y = screenH/2 - tile1.height/2 + topY

tile16 = display.newImageRect("Tile.png",50,50)
tile16:setReferencePoint(display.TopLeftReferencePoint)
tile16.x = leftX + screenW/20 + tile1.width*4
tile16.y = screenH/2 - tile1.height/2 + topY

tile17 = display.newImageRect("Tile.png",50,50)
tile17:setReferencePoint(display.TopLeftReferencePoint)
tile17.x = leftX + screenW/20 + tile1.width*5
tile17.y = screenH/2 - tile1.height/2 + topY

tile18 = display.newImageRect("Tile.png",50,50)
tile18:setReferencePoint(display.TopLeftReferencePoint)
tile18.x = leftX + screenW/20 + tile1.width*6
tile18.y = screenH/2 - tile1.height/2 + topY


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
        [9] = tile9,
		[10] = tile10,
        [11] = tile11,
        [12] = tile12,
        [13] = tile13,
		[14] = tile14,
        [15] = tile15,
        [16] = tile16,
        [17] = tile17,
		[18] = tile18
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
    [9] = false,
	[10] = false,
    [11] = false,
    [12] = false,
    [13] = false,
	[14] = false,
    [15] = false,
    [16] = false,
    [17] = false,
	[18] = false
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
        [9] = 0,
		[10] = 0,
        [11] = 0,
        [12] = 0,
        [13] = 0,
		[14] = 0,
        [15] = 0,
        [16] = 0,
        [17] = 0,
		[18] = 0
    }
	
local answers = {
    [1] = 1,
    [2] = 1,
    [3] = 1,
    [4] = 1,
    [5] = 1,
	[6] = 5,
    [7] = 1,
    [8] = 1,
    [9] = 1,
	[10] = 1,
    [11] = 1,
    [12] = 5,
    [13] = 1,
	[14] = 1,
    [15] = 1,
    [16] = 1,
    [17] = 1,
	[18] = 5
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
		elseif x==5 then
			movement = transition.to(character, {time=500, x=images[1].x, y=images[1].y})
		elseif x==6 then
			movement = transition.to(character, {time=500, x=images[1].x, y=images[1].y})
		end
		
		if(x~=y) then
			restartGame()
		else
			counter = counter + 1
			
			if counter > #instructions then
				timer.cancel(timerCongelacion)
			end
		
		end
	end
	
end

function startGame(event)
	playButton.alpha = 1
	counter = 0
	if(event.phase == "ended") then
		for i=1, 6 do
			instructions[i+6] = instructions[i]
			instructions[i+12] = instructions[i]
		end
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
	character.y = screenH/5 - character.height/2 + topY
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
		storyboard.gotoScene("level3", options)
		storyboard.removeScene("level2")
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
	barGroup:toFront()

	imagesGroup = display.newGroup()
	imagesGroup:toFront()



-- 																BOTONES JOAQUIN RAMIREZ
	spaceX = 20
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


	function1Image = display.newImageRect("Imagenes/function1.png",50,50)
	function1Image.name = "function1Image"
	function1Image:setReferencePoint(display.TopLeftReferencePoint)
	function1Image.x = leftX + downImage.x + leftImage.width + spaceX
	function1Image.y = bottomY - upImage.height - upImage.height/2 
	imagesGroup:insert( function1Image )

	function2Image = display.newImageRect("Imagenes/function2.png",50,50)
	function2Image.name = "function2Image"
	function2Image:setReferencePoint(display.TopLeftReferencePoint)
	function2Image.x = leftX + function1Image.x + leftImage.width + spaceX
	function2Image.y = bottomY - upImage.height - upImage.height/2 
	imagesGroup:insert( function2Image )



	local instructionsPositions = {
        [1] = leftImage.x,
        [2] = rightImage.x,
        [3] = upImage.x,
        [4] = downImage.x,
        [5] = function1Image.x,
		[6] = function2Image.x
		
    }




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
		if img.x == instructionsPositions[1] then
			newImage = display.newImageRect("Imagenes/yellow.png",50,50)
			instructionType = 1
			newImage:toBack()
		newImage.name = "newImage"
		newImage:setReferencePoint(display.TopLeftReferencePoint)
		newImage.x = img.x
		newImage.y = img.y
		imagesGroup:insert( newImage )


		newImage:addEventListener( "touch", myTouchListener )
		elseif img.x == instructionsPositions[2] then
			newImage = display.newImageRect("Imagenes/blue.png",50,50)
			instructionType = 2
			newImage:toBack()
		newImage.name = "newImage"
		newImage:setReferencePoint(display.TopLeftReferencePoint)
		newImage.x = img.x
		newImage.y = img.y
		imagesGroup:insert( newImage )


		newImage:addEventListener( "touch", myTouchListener )
		elseif img.x == instructionsPositions[3] then
			newImage = display.newImageRect("Imagenes/red.png",50,50)
			instructionType = 3
			newImage:toBack()
		newImage.name = "newImage"
		newImage:setReferencePoint(display.TopLeftReferencePoint)
		newImage.x = img.x
		newImage.y = img.y
		imagesGroup:insert( newImage )


		newImage:addEventListener( "touch", myTouchListener )
		elseif img.x == instructionsPositions[4] then
			newImage = display.newImageRect("Imagenes/green.png",50,50)
			instructionType = 4
			newImage:toBack()
		newImage.name = "newImage"
		newImage:setReferencePoint(display.TopLeftReferencePoint)
		newImage.x = img.x
		newImage.y = img.y
		imagesGroup:insert( newImage )


		newImage:addEventListener( "touch", myTouchListener )
		elseif img.x == instructionsPositions[5] then
			newImage = display.newImageRect("Imagenes/function1.png",50,50)
			instructionType = 5
			newImage:toBack()
		newImage.name = "newImage"
		newImage:setReferencePoint(display.TopLeftReferencePoint)
		newImage.x = img.x
		newImage.y = img.y
		imagesGroup:insert( newImage )


		newImage:addEventListener( "touch", myTouchListener )
		elseif img.x == instructionsPositions[6] then
			newImage = display.newImageRect("Imagenes/function2.png",50,50)
			instructionType = 6
			newImage:toBack()
		newImage.name = "newImage"
		newImage:setReferencePoint(display.TopLeftReferencePoint)
		newImage.x = img.x
		newImage.y = img.y
		imagesGroup:insert( newImage )


		newImage:addEventListener( "touch", myTouchListener )
		end


		
	end


	leftImage:addEventListener( "touch", myTouchListener )
	rightImage:addEventListener( "touch", myTouchListener )
	upImage:addEventListener( "touch", myTouchListener )
	downImage:addEventListener( "touch", myTouchListener )

	function1Image:addEventListener( "touch", myTouchListener )
	function2Image:addEventListener( "touch", myTouchListener )

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