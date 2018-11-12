-----------------------------------------------------------------------------------------
--
-- flappywin.lua
-- Created by: Aidan Saull
-- Date: Nov. 22nd, 2014
-- Description: This is the overlay that comes up when you die in the flappy bird clone.
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Use Widget Library
local widget = require( "widget" )

-- Name the Scene
sceneName = "flappywin"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

-- The local variables for this scene
local bkg_image

local playButton

local highScore = 0

-----------------------------------------------------------------------------------------


--making the background
local background = display.newRect(display.contentWidth/2, display.contentCenterY, display.contentWidth/5, display.contentHeight/5)
background:setFillColor(1, 1, 1)

local highScoreText = display.newText("High Score = " .. highScore, display.contentWidth/2, display.contentHeight/2.2, system.nativeFont, 15)
highScoreText:setFillColor(0, 0, 0)

--closing the pause overlay
function closePause( )
    composer.hideOverlay( "slideDown", 200 )
    composer.removeScene( "flappy" )
    composer.gotoScene( "main_menu" )
end

function mainMenuGoTo( )
    audio.stop(1)
    composer.hideOverlay( "slideDown", 200 )
    composer.gotoScene( "main_menu", {time = 400, effect = slideUp})
    composer.removeScene( "level1_screen" )
    composer.removeScene( "level2_screen" )
    composer.removeScene( "level3_screen" )
    composer.removeScene( "level4_screen" )
    composer.removeScene( "beatlevelone" )
    composer.removeScene( "beatleveltwo" )
    composer.removeScene( "beatlevelthree" )
    composer.removeScene( "beatlevelfour" )
    composer.removeScene( "flappy" )
end

function gotoLevelSelect( )
    audio.stop(1)
    composer.hideOverlay( "slideLeft", 2000 )
    composer.gotoScene( "levelscreen", {time = 400, effect = slideUp})
    composer.removeScene( "level1_screen" )
    composer.removeScene( "level2_screen" )
    composer.removeScene( "level3_screen" )
    composer.removeScene( "level4_screen" )
    composer.removeScene( "beatlevelone" )
    composer.removeScene( "beatleveltwo" )
    composer.removeScene( "beatlevelthree" )
    composer.removeScene( "beatlevelfour" )
    composer.removeScene( "flappy" )
end

--making the mainmenu button
local mainmenuButton = widget.newButton
{
    width = display.contentWidth/25,
    height = display.contentWidth/25,
    defaultFile = "Images/mainmenubutton.png",
    overFile = "Images/mainmenubuttonpressed.png",
    onEvent = mainMenuGoTo
}

-- move the button
mainmenuButton.x = display.contentWidth/2
mainmenuButton.y = display.contentHeight/1.85






-- The function called when the screen doesn't exist
function scene:create( event )



    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image in the center of the screen with the screen's width and height

    -- Send the background image to the back layer so all other objects can be on top

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert(background)
    sceneGroup:insert(mainmenuButton)
    sceneGroup:insert(highScoreText)

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
        --loading highscore into highScore var.
        local path = system.pathForFile( "highscore.txt", system.DocumentsDirectory )

        local file = io.open( path, "r" )
        local savedData = file:read( "*a" )

        highScore = tonumber(savedData)

        io.close( file )
        file = nil

        highScoreText.isVisible = false
        local highScoreText = display.newText("High Score = " .. highScore, display.contentWidth/2, display.contentHeight/2.2, system.nativeFont, 15)
        highScoreText:setFillColor(0, 0, 0)
        highScoreText.isVisible = true
        sceneGroup:insert(highScoreText)
        
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