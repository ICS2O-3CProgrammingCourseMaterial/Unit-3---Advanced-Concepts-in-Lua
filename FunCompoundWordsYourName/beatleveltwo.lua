-----------------------------------------------------------------------------------------
--
-- beatleveltwo.lua
-- Created by: Aidan Saull
-- Special thanks to Wal Wal for helping in the design of this framework.
-- Date: Nov. 24th, 2014
-- Description: This is the page that shows after beating the second level
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "beatleveltwo"

-- Creating Scene Object
scene = composer.newScene( credits_screen ) -- This function doesn't accept a string, only a variable containing a string

local background_image

local cloudImage

local startScaling = false

local i = 100

local applauseSound = audio.loadSound("Sounds/applause.mp3")

-----------------------------------------------------------------------------------------
-- BUTTON WIDGETS
-----------------------------------------------------------------------------------------

local nextButton

-----------------------------------------------------------------------------------------

local path = system.pathForFile( "currentlevel.txt", system.DocumentsDirectory  )

local file = io.open( path, "r" )
local savedData = file:read( "*a" )

savedData = tonumber(savedData)

io.close( file )
file = nil

if savedData < 3 then
    local saveData = "3"

    local path = system.pathForFile( "currentlevel.txt", system.DocumentsDirectory  )

    local file = io.open( path, "w" )
    file:write( saveData )

    io.close( file )
    file = nil
end



-- The function called when the screen doesn't exist
function scene:create( event )

    audio.play(applauseSound)

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/Level_2.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert(bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
   bkg_image:toBack()


    -----------------------------------------------------------------------------------------
    -- FUNCTIONS
    -----------------------------------------------------------------------------------------

    -- Creating Transitioning Function back to main menu
    function level2Transition( )
        composer.gotoScene( "level3_screen", {effect = "crossFade", time = 300})
    end

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating Next Button
    nextButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*7/8,
        y = display.contentHeight*15/16,

        -- Setting Visual Properties
        defaultFile = "Images/nextbutton.png",
        overFile = "Images/nextbuttonpressed.png",

        -- Setting Functional Properties
        onRelease = level2Transition

    } )

    -----------------------------------------------------------------------------------------
    --  INITIAL CLOUD POSITION                                                             --
    -----------------------------------------------------------------------------------------
    cloudImage = display.newImage("Images/minerals.png")
    cloudImage.x = display.contentCenterX
    cloudImage.y = display.contentHeight/2.5
    cloudImage.width = display.contentWidth
    cloudImage.height = display.contentHeight/2.6
    -----------------------------------------------------------------------------------------

    -----------------------------------------------------------------------------------------
    --  INITIAL TEXT POSITION                                                             --
    -----------------------------------------------------------------------------------------
    text = display.newText( "Congratulations! You beat the second level.", display.contentWidth/2, -100, native.systemFont, 30 )
    text:setFillColor(1, 1, 1)
    function move( )
        transition.to( text, { time=2000, x=(display.contentWidth/2), y=(display.contentHeight/2), transition=easing.outElastic})
    end
    timer.performWithDelay(500, move)
    sceneGroup:insert(text)
    -----------------------------------------------------------------------------------------



  

    -----------------------------------------------------------------------------------------

    -- Associating Buttons with this scene
    sceneGroup:insert( nextButton )
    sceneGroup:insert( cloudImage )
    
end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )




    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        print("starting")
        startScaling = true

        function complete( )
            cloudImage.isVisible = false
        end 

        transition.scaleTo( cloudImage, { xScale=0.01, yScale=0.01, time=500, onComplete = complete, alpha=0, transition=easing.inBack} )


        
        
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end --function scene:destroy( event )




-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


-----------------------------------------------------------------------------------------

return scene


