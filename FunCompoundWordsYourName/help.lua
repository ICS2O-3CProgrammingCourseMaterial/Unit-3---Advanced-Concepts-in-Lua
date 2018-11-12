-----------------------------------------------------------------------------------------
--
-- intro_screen.lua
-- Created by: Ms Raffin
-- Date: Nov. 22nd, 2014
-- Description: This is a help overlay that comes up in the levels
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Use Widget Library
local widget = require( "widget" )

-- Name the Scene
sceneName = "help"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

-- The local variables for this scene
local bkg_image

local helpButton

-----------------------------------------------------------------------------------------

--making the background
local background = display.newRect(display.contentWidth/8*7+display.contentWidth/40, display.contentCenterY, display.contentWidth/5, display.contentHeight)
background:setFillColor(0.2, 0.2, 0.8)

--making the help text
local helpText = display.newText( "Remember, to complete the level you have to match the word from the left cloud to the word from the right cloud that make a compound word.", display.contentWidth/8*7+display.contentWidth/40, display.contentCenterY, display.contentWidth/5-10, display.contentHeight, native.systemFont, 25 )
helpText:setFillColor( 1, 1, 1 )



--closing the help overlay
function closehelp( )
    composer.hideOverlay( "slideRight", 200 )
end

function mainMenuGoTo( )
    audio.stop(1)
    composer.hideOverlay( "slideRight", 2000 )
    composer.gotoScene( "main_menu", {time = 400, effect = slideUp})
    composer.removeScene( "level1_screen" )
    composer.removeScene( "level2_screen" )
    composer.removeScene( "level3_screen" )
    composer.removeScene( "level4_screen" )
end

function gotoLevelSelect( )
    audio.stop(1)
    composer.hideOverlay( "slideRight", 2000 )
    composer.gotoScene( "levelscreen", {time = 400, effect = slideUp})
    composer.removeScene( "level1_screen" )
    composer.removeScene( "level2_screen" )
    composer.removeScene( "level3_screen" )
    composer.removeScene( "level4_screen" )
end

--making the help button
helpButton = widget.newButton
{
    width = display.contentWidth/25,
    height = display.contentWidth/25,
    defaultFile = "Images/play.png",
    overFile = "Images/playpressed.png",
    onEvent = closehelp
}

-- move the button
helpButton.x = display.contentWidth - display.contentWidth/5.5
helpButton.y = display.contentHeight/2







-- The function called when the screen doesn't exist
function scene:create( event )



    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image in the center of the screen with the screen's width and height

    -- Send the background image to the back layer so all other objects can be on top

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert(background)
    sceneGroup:insert(helpButton)
    sceneGroup:insert(helpText)
    


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
    -- Insert code here to "help" the scene.
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