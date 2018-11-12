-----------------------------------------------------------------------------------------
--
-- levelscreen.lua
-- Created by: Aidan Saull
-- Date: Nov. 24th, 2014
-- Description: This is the level selection screen that displays levels only as you unlock them
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
sceneName = "levelscreen"

-- Creating Scene Object
scene = composer.newScene( credits_screen ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- DISPLAY OBJECTS
-----------------------------------------------------------------------------------------
local bgk_image_credits

local backButton

local title

local level1
local level2
local level3
local level4



-----------------------------------------------------------------------------------------

function level1Transition( )
    composer.gotoScene( "level1_screen", {effect = "fromTop", time = 200})
end

function level2Transition( )
    composer.gotoScene( "level2_screen", {effect = "fromTop", time = 200})
end

function level3Transition( )
    composer.gotoScene( "level3_screen", {effect = "fromTop", time = 200})
end

function level4Transition( )
    composer.gotoScene( "level4_screen", {effect = "fromTop", time = 200})
end

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
   bkg_image_credits = display.newImage("Images/levelselect.png")
   bkg_image_credits.x = display.contentCenterX
   bkg_image_credits.y = display.contentCenterY
   bkg_image_credits.width = display.contentWidth
   bkg_image_credits.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert(bkg_image_credits )

    -- Send the background image to the back layer so all other objects can be on top
   bkg_image_credits:toBack()

    --insert the cats
    catImage = display.newImage("Images/cats.png")
    catImage.x = display.contentCenterX
    catImage.y = display.contentHeight*3.8/5
    catImage.width = display.contentWidth
    catImage.height = display.contentHeight/3.8


    -----------------------------------------------------------------------------------------
    -- FUNCTIONS
    -----------------------------------------------------------------------------------------

    -- Creating Transitioning Function back to main menu
    function BackTransition( )
        composer.gotoScene( "main_menu", {effect = "crossFade", time = 300})
    end

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*15/16,

        --making a label
        label = "Back",
        fontSize = 30,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        labelYOffset = 20,
        labelXOffset = 20,

        -- Setting Visual Properties
        defaultFile = "Images/backpressed.png",
        overFile = "Images/back.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )


    --creating the title
    title = display.newText("Choose a Level", display.contentCenterX, -300, Arial, 50)


    --moving the fourth level button in
    function four( )
        transition.to( level4button, { time=500, x=(display.contentWidth*7/8), y=(display.contentHeight/2), transition=easing.outBack})
    end

    --moving the third level button in
    function three( )
        transition.to( level3button, { time=500, x=(display.contentWidth*5/8), y=(display.contentHeight/2), transition=easing.outBack})
    end

    --moving the second level button in
    function two( )
        transition.to( level2button, { time=500, x=(display.contentWidth*3/8), y=(display.contentHeight/2), transition=easing.outBack})
    end

    --moving the first level button in
    function one( )
        print("inone")
        transition.to( level1button, { time=500, x=(display.contentWidth*1/8), y=(display.contentHeight/2), transition=easing.outBack})
    end


    --moving the title in
    function moveTitle( )
        transition.to( title, { time=1000, x=(display.contentWidth/2), y=(display.contentHeight/5), transition=easing.outElastic})
    end








    --creating level1 button
    level1button = widget.newButton( 
    {

        --setting size
        height = 153.6,
        width = 204.8,

        -- Setting Position
        x = -200,
        y = display.contentHeight/2,

        --making a label
        label = "Level 1",
        fontSize = 30,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        labelYOffset = 0,
        labelXOffset = 0,

        -- Setting Visual Properties
        defaultFile = "Images/Level_1.png",
        overFile = "Images/Level_1.png",

        -- Setting Functional Properties
        onRelease = level1Transition

    } )

    --creating level2 button
    level2button = widget.newButton( 
    {

        --setting size
        height = 153.6,
        width = 204.8,

        -- Setting Position
        x = -200,
        y = display.contentHeight/2,

        --making a label
        label = "Level 2",
        fontSize = 30,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        labelYOffset = 0,
        labelXOffset = 0,

        -- Setting Visual Properties
        defaultFile = "Images/Level_2.png",
        overFile = "Images/Level_2.png",

        -- Setting Functional Properties
        onRelease = level2Transition

    } )

    --creating level3 button
    level3button = widget.newButton( 
    {

        --setting size
        height = 153.6,
        width = 204.8,

        -- Setting Position
        x = -200,
        y = display.contentHeight/2,

        --making a label
        label = "Level 3",
        fontSize = 30,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        labelYOffset = 0,
        labelXOffset = 0,

        -- Setting Visual Properties
        defaultFile = "Images/Level_3.png",
        overFile = "Images/Level_3.png",

        -- Setting Functional Properties
        onRelease = level3Transition

    } )

    --creating level4 button
    level4button = widget.newButton( 
    {

        --setting size
        height = 153.6,
        width = 204.8,

        -- Setting Position
        x = -200,
        y = display.contentHeight/2,

        --making a label
        label = "Level 4",
        fontSize = 30,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        labelYOffset = 0,
        labelXOffset = 0,

        -- Setting Visual Properties
        defaultFile = "Images/Level_4.png",
        overFile = "Images/Level_4.png",

        -- Setting Functional Properties
        onRelease = level4Transition

    } )

    -----------------------------------------------------------------------------------------

    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
    sceneGroup:insert( title )
    sceneGroup:insert( level1button )
    sceneGroup:insert( level2button )
    sceneGroup:insert( level3button )
    sceneGroup:insert( level4button )
    sceneGroup:insert( catImage )
    
end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event, title )




    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

        print("sceneentering")

        audio.stop(2)



        local path = system.pathForFile( "currentlevel.txt", system.DocumentsDirectory )

        local file = io.open( path, "r" )
        local savedData = file:read( "*a" )

        savedData = tonumber(savedData)

        io.close( file )
        file = nil

        print("hereiam " .. savedData)

        if savedData == 1 then
            print("gotinsidefirstif")
            one( )
        end

        if savedData == 2 then
            one( )
            two( )
        end

        if savedData == 3 then
            one( )
            two( )
            three( )
        end

        if savedData == 4 then
            one( )
            two( )
            three( )
            four( )
        end


        

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        moveTitle( )



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
        print("played")
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


