-----------------------------------------------------------------------------------------
--
-- pause.lua
-- Created by: Aidan Saull
-- Date: Nov. 22nd, 2014
-- Description: This is the pause overlay that comes up in a level when you select it
-----------------------------------------------------------------------------------------



-- Use Composer Library
local composer = require( "composer" )

-- Use Widget Library
local widget = require( "widget" )

-- Name the Scene
sceneName = "pause"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

-- The local variables for this scene
local bkg_image

local pauseButton

-----------------------------------------------------------------------------------------

--making the background
local background = display.newRect(display.contentWidth/8-display.contentWidth/25, display.contentCenterY, display.contentWidth/5, display.contentHeight)
background:setFillColor(0.2, 0.2, 0.8)



--closing the pause overlay
function closePause( )
    composer.hideOverlay( "slideLeft", 200 )
end

function mainMenuGoTo( )
    audio.stop(1)
    composer.hideOverlay( "slideLeft", 200 )
    composer.gotoScene( "main_menu", {time = 400, effect = slideUp})
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

function gotoLevelSelect( )
    audio.stop(1)
    composer.hideOverlay( "slideLeft", 200 )
    composer.gotoScene( "levelscreen", {time = 400, effect = slideUp})
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

--making the pause button
pauseButton = widget.newButton
{
    width = display.contentWidth/25,
    height = display.contentWidth/25,
    defaultFile = "Images/play.png",
    overFile = "Images/playpressed.png",
    onEvent = closePause
}

-- move the button
pauseButton.x = display.contentWidth/5.5
pauseButton.y = display.contentHeight/2



--making the mainmenu button
local mainmenuButton = widget.newButton
{
    width = display.contentWidth/7,
    height = display.contentWidth/7,
    defaultFile = "Images/mainmenubutton.png",
    overFile = "Images/mainmenubuttonpressed.png",
    onEvent = mainMenuGoTo
}

-- move the button
mainmenuButton.x = display.contentWidth/11
mainmenuButton.y = display.contentHeight*1/3

--making the levelselect button
local levelselectButton = widget.newButton
{
    width = display.contentWidth/7,
    height = display.contentWidth/7,
    defaultFile = "Images/levelselectbutton.png",
    overFile = "Images/levelselectbuttonpressed.png",
    onEvent = gotoLevelSelect
}

-- move the button
levelselectButton.x = display.contentWidth/11
levelselectButton.y = display.contentHeight*2/3





-- The function called when the screen doesn't exist
function scene:create( event )



    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image in the center of the screen with the screen's width and height

    -- Send the background image to the back layer so all other objects can be on top

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert(background)
    sceneGroup:insert(pauseButton)
    sceneGroup:insert(mainmenuButton)
    sceneGroup:insert(levelselectButton)
    


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

