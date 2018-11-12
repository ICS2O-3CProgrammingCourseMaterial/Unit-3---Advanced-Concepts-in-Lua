-----------------------------------------------------------------------------------------
--
-- flappy.lua
-- Created by: Aidan Saull
-- Special thanks to Wal Wal for helping in the design of this framework.
-- Date: Nov. 24th, 2014
-- Description: This is the flappy bird page, it was a quick frill I added in for fun.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

--use physics
local physics = require("physics")

physics.start()

physics.setGravity( 0, 50 )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "flappy"

-- Creating Scene Object
scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- DISPLAY OBJECTS
-----------------------------------------------------------------------------------------
local bkg_image_instructions
local catImage
local topPipe
local bottomPipe
local topPipe2
local bottomPipe2

local beenOnce = false

local dead = false

local score = -1


-----------------------------------------------------------------------------------------
-- BUTTON WIDGETS
-----------------------------------------------------------------------------------------

local backButton

-----------------------------------------------------------------------------------------

--insert the cat
catImage = display.newImage("Images/Cat.png")
catImage.x = display.contentCenterX
catImage.y = display.contentCenterY
catImage.width = display.contentWidth/8
catImage.height = display.contentWidth/8
catImage.id = "cat"

--insert the score counter
scoreText = display.newText("" .. score, display.contentWidth/2, display.contentHeight*1/5, system.nativeFont, 75)

physics.addBody( catImage, "dynamic", { density=3.0, friction=0.5, bounce=0.3 } )

--insert the top pipe
topPipe = display.newImage("Images/pipe.png")
topPipe.x = display.contentWidth
topPipe.y = 0
--topPipe.width = 120
--topPipe.height = 900

physics.addBody( topPipe, "static", { density=3.0, friction=0.5, bounce=0.3 } )

--insert the bottom pipe
bottomPipe = display.newImage("Images/pipe.png")
bottomPipe.x = display.contentWidth
bottomPipe.y = display.contentHeight
--bottomPipe.width = 120
--bottomPipe.height = 900

physics.addBody( bottomPipe, "static", { density=3.0, friction=0.5, bounce=0.3 } ) 

--insert the top pipe 2 
topPipe2 = display.newImage("Images/pipe.png")
topPipe2.x = display.contentWidth+display.contentWidth/8
topPipe2.y = 0
--topPipe2.width = 120
--topPipe2.height = 900

physics.addBody( topPipe2, "static", { density=3.0, friction=0.5, bounce=0.3 } )

--insert the bottom pipe 2 
bottomPipe2 = display.newImage("Images/pipe.png")
bottomPipe2.x = display.contentWidth+display.contentWidth/8
bottomPipe2.y = display.contentHeight
--bottomPipe2.width = 120
--bottomPipe2.height = 900

physics.addBody( bottomPipe2, "static", { density=3.0, friction=0.5, bounce=0.3 } ) 

-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------

function counting( event )
    if dead == false then
        print("counting")
        timer.performWithDelay(1500, counting)
        score = score + 1
        scoreText.isVisible = false
        scoreText = display.newText("" .. score, display.contentWidth/2, display.contentHeight*1/5, system.nativeFont, 75)
        scoreText.isVisible = true
        print(score)
            if catImage.y > display.contentHeight then
        onCollision()
    end
    else
        scoreText.isVisible = false
    end
end

function fadeCat( )
    transition.to( catImage, {time=300, alpha = 0})
end


function onCollision( event )
    if beenOnce == false then
        beenOnce = true
        dead = true
        transition.cancel( pipes )
        --composer.showOverlay
        timer.performWithDelay(500, fadeCat)
        composer.showOverlay("flappywin", {effect = "fromBottom", time = 500})

        local path = system.pathForFile( "highscore.txt", system.DocumentsDirectory )

        local file = io.open( path, "r" )
        local oldScore = file:read( "*a" )

        oldScore = tonumber(oldScore)

        io.close( file )
        file = nil

        if oldScore < score then
            local saveData = score

            print(saveData)

            local path = system.pathForFile( "highscore.txt", system.DocumentsDirectory )

            local file = io.open( path, "w" )
            file:write( saveData )

            io.close( file )
            file = nil
        end
    end
end

function startMovement( )
    if dead == false then
        topPipe.x = display.contentWidth+display.contentWidth/8
        bottomPipe.x = display.contentWidth+display.contentWidth/8
        local pipeHeight = math.random(-display.contentHeight/8, display.contentHeight/8)
        topPipe.y = -display.contentHeight/4 + pipeHeight
        bottomPipe.y = display.contentHeight+display.contentHeight/4 + pipeHeight
        transition.to( topPipe, { time=3000, x=-display.contentWidth/8, tag = pipes})
        transition.to( bottomPipe, { time=3000, x=-display.contentWidth/8, onComplete = startMovement, tag = pipes})
    end
end

function startMovement2( )
    if dead == false then
        topPipe2.x = display.contentWidth+display.contentWidth/8
        bottomPipe2.x = display.contentWidth+display.contentWidth/8
        local pipeHeight = math.random(-display.contentHeight/8, display.contentHeight/8)
        topPipe2.y = -display.contentHeight/4 + pipeHeight
        bottomPipe2.y = display.contentHeight+display.contentHeight/4 + pipeHeight
        transition.to( topPipe2, { time=3000, x=-display.contentWidth/8, tag = pipes})
        transition.to( bottomPipe2, { time=3000, x=-display.contentWidth/8, onComplete = startMovement2, tag = pipes})
    end
end


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image_instructions = display.newImage("Images/levelselect.png")
    bkg_image_instructions.x = display.contentCenterX
    bkg_image_instructions.y = display.contentCenterY
    bkg_image_instructions.width = display.contentWidth
    bkg_image_instructions.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image_instructions )
    sceneGroup:insert( topPipe2 )
    sceneGroup:insert( topPipe )
    sceneGroup:insert( bottomPipe2 )
    sceneGroup:insert( bottomPipe )
    sceneGroup:insert( catImage )
    sceneGroup:insert( scoreText )
    -- Send the background image to the back layer so all other objects can be on top
    bkg_image_instructions:toBack()

end


local function onTouch( event )
    if event.phase == "began" then
        print("touched")
        if dead == false then
            catImage:setLinearVelocity(0, -550)
        end
    end
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

        counting()

        startMovement()

        timer.performWithDelay(1500, startMovement2)

        --[[if isChannel3Playing == false then
            local backgroundMusic = audio.loadSound( "Sounds/moveit.mp3" )
            audio.play(backgroundMusic, 3)
        end]]

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


        sceneGroup:insert(scoreText)
        scoreText.isVisible = false

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        scoreText.isVisible = false
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
Runtime:addEventListener( "touch", onTouch )
Runtime:addEventListener( "collision", onCollision )

-----------------------------------------------------------------------------------------



return scene

