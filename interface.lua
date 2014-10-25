-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar( display.HiddenStatusBar )


local topY = display.screenOriginY --Numerical value for the top of the screen
local rightX = display.contentWidth - display.screenOriginX --Numerical value for the right of the screen
local bottomY = display.contentHeight - display.screenOriginY --Numerical value for the bottom of the screen
local leftX = display.screenOriginX --Numerical value for the left of the screen
local screenW = rightX - leftX --Numerical value for the width of the screen
local screenH = bottomY - topY --Numerical value for the height of the screen



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
			event.target:removeSelf()
		end
	end

    return true

end


function checkPositionOfImageInY ( img )

	if img.y + img.height > bar.y then
		img:removeSelf()

	else 
		-- Acomodar en el siguiente espacio disponible


	end
end



function createImage( img )

	local newImage
	print(img.x)
	if img.x == 65 then
		newImage = display.newImageRect("Imagenes/yellow.png",50,50)
	elseif img.x == 165 then
		newImage = display.newImageRect("Imagenes/blue.png",50,50)
	elseif img.x == 265 then
		newImage = display.newImageRect("Imagenes/red.png",50,50)
	elseif img.x == 365 then
		newImage = display.newImageRect("Imagenes/green.png",50,50)
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

