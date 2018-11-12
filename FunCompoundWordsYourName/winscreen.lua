-----------------------------------------------------------------------------------------
--
-- winscreen.lua
-- Created by: Aidan Saull
-- Date: Nov. 24th, 2014
-- Description: This is the winning screen that shows once all the levels have been completed.
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
sceneName = "winscreen"

-- Creating Scene Object
scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- DISPLAY OBJECTS
-----------------------------------------------------------------------------------------
local bkg_image_instructions_instructions

local helicopter

local winSound = audio.loadSound("Sounds/win.mp3")

-----------------------------------------------------------------------------------------
-- BUTTON WIDGETS
-----------------------------------------------------------------------------------------

local backButton

-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image_instructions = display.newImage("Images/winscreen.png")
    bkg_image_instructions.x = display.contentCenterX
    bkg_image_instructions.y = display.contentCenterY
    bkg_image_instructions.width = display.contentWidth
    bkg_image_instructions.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image_instructions )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image_instructions:toBack()


    -----------------------------------------------------------------------------------------
    -- FUNCTIONS
    -----------------------------------------------------------------------------------------

    -- Creating Transitioning Function back to main menu
    function BackTransition( )
        composer.gotoScene( "main_menu", {effect = "crossFade", time = 200})
        composer.removeScene( "level1_screen" )
        composer.removeScene( "level2_screen" )
        composer.removeScene( "level3_screen" )
        composer.removeScene( "level4_screen" )
        composer.removeScene( "beatlevelone" )
        composer.removeScene( "beatleveltwo" )
        composer.removeScene( "beatlevelthree" )
        composer.removeScene( "beatlevelfour" )
        composer.removeScene( "winscreen" )
    end

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating mainmenu Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*10/16,

        -- Setting Visual Properties
        defaultFile = "Images/mainmenubutton.png",
        overFile = "Images/mainmenubuttonpressed.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -----------------------------------------------------------------------------------------

    helicopter = display.newImage("Images/goodjob.png", display.contentCenterX, -100, 700, 157)

    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )

    sceneGroup:insert( helicopter )
    
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

        transition.to(helicopter, {y= display.contentHeight*1/4, time = 1000, transition = easing.outBack})

        audio.stop()

        local winChannel = audio.play( winSound )

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


