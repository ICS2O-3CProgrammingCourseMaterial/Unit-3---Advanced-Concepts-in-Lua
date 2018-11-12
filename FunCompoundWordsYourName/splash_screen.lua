-----------------------------------------------------------------------------------------
--
-- intro_screen.lua
-- Created by: Aidan Saull
-- Date: Nov. 22nd, 2014
-- Description: This is the splash screen of the game. It shows  a cat jumping onto the company logo.
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

-- The local variables for this scene
local bkg_image
local number = 1
local numberAsString
local imageNameAsString
local animationGroup
local MAX_NUM_ANIMATIONS = 50
local cat
local i = 0

-----------------------------------------------------------------------------------------






-- The function called when the screen doesn't exist
function scene:create( event )



    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------



    -- Insert the animation image
    animation = display.newImageRect("Images/Finalcompanylogonocat.png", display.contentWidth, display.contentHeight)


    cat = display.newImageRect("Images/Cat.png", display.contentWidth/6, display.contentHeight/4.5)
    cat.x = display.contentWidth*4/5
    cat.y = display.contentHeight*2/3



    -- set the initial x and y position of the animation
    animation.x = display.contentCenterX
    animation.y = display.contentCenterY

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    
    sceneGroup:insert( animation )
    sceneGroup:insert( cat )

end

--------------------------------------------------------------------------------------------


-- The function that will go to the main menu 
function gotoMainMenu1()
    composer.gotoScene( "main_menu" )
    print(test)
end

--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Call the startAnimation function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", frame1)

        function startFrame2( )
            Runtime:addEventListener("enterFrame", frame2)
        end

        timer.performWithDelay(900, startFrame2)

        function startFrame3( )
            Runtime:addEventListener("enterFrame", frame3)
        end

        timer.performWithDelay(1800, startFrame3)

        timer.performWithDelay(3000, gotoMainMenu1)

        
        
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  
     
    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

function moveUp( )
    cat.y = cat.y -1
end



function frame1( event )
    if (i < 30) then
        print(i)
        cat.y = cat.y -8
        i = i+1
    end
end

function frame2( event )
    if (i < 60) then
        print(i)
        cat.y = cat.y -3
        cat.x = cat.x -3.5
        i = i+1
    end
end

function frame3( event )
    if (i < 100) then
        print(i)
        cat.y = cat.y + 1.1
        cat.x = cat.x -3
        i = i+1
    end
end




-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------





-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
--scene:addEventListener( "enterFrame", frame )



-----------------------------------------------------------------------------------------

return scene