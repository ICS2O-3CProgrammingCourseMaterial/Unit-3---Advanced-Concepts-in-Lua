-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Gil Robern
-- Modified by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
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
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg

-- determine the range for the numbers to add
local MIN_NUM = 1
local MAX_NUM = 10

local NUM_CORRECT_ANSWERS = 8

-- the variables containing the first and second numbers to add for the equation
local firstNumber
local secondNumber

-- the global variables that will hold the answer and the wrong answers
local answer 
local wrongAnswer1
local wrongAnswer2

-- the text object that will hold the addition equation
local addEquationTextObject 


-- the text objects that will hold the correct answer and the wrong answers
local answerTextObject 
local wrongAnswer1TextObject
local wrongAnswer2TextObject

-- displays the number correct
local numberCorrectText 

-- displays the number of lives
local livesText 

-- the text displaying congratulations
local congratulationText 

-- Displays text that says correct.
local correct 

-- Displays text that says wrong.
local wrong 

-- Displays the out of time text
local outOfTimeText 

-- Displays the level text of time text
local level1Text 


--*** ADD BACKGROUND SOUND

--*** ADD CORRECT SOUND

--*** ADD INCORRECT SOUND


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- This function makes all objects on the scene invisible
local function MakeSceneObjectsInvisible()
    addEquationTextObject.isVisible = false
    answerTextObject.isVisible = false
    wrongAnswer1TextObject.isVisible = false
    wrongAnswer2TextObject.isVisible = false
    congratulationText.isVisible = false
end

-- This function makes all objects on the scene visible, except for Correct, Wrong and Out of Time
local function MakeSceneObjectsVisible()
    addEquationTextObject.isVisible = true
    answerTextObject.isVisible = true
    wrongAnswer1TextObject.isVisible = true
    wrongAnswer2TextObject.isVisible = true
    livesText.isVisible = true
    numberCorrectText.isVisible = true
    outOfTimeText.isVisible = false
    wrong.isVisible = false
    correct.isVisible = false
end

local function YouWinTransition()
    composer.gotoScene( "you_win", {effect = "zoomInOutFade", time = 1000})
end

local function DeternmineAnswers()
    -- determine the answer as well as the wrong answers
    answer = firstNumber + secondNumber
    wrongAnswer1 = answer + math.random(1,4)
    wrongAnswer2 = answer + math.random(5,8)
end

-- Function that changes the answers for a new questions and places them randomly
local function DisplayAnswers( )

    local answerPosition = math.random(1,3)
    answerTextObject.text = tostring( answer )
    wrongAnswer1TextObject.text = tostring( wrongAnswer1 )
    wrongAnswer2TextObject.text = tostring( wrongAnswer2 )

    if (answerPosition == 1) then                
        
        answerTextObject.x = display.contentWidth*.3        
        wrongAnswer1TextObject.x = display.contentWidth*.2
        wrongAnswer2TextObject.x = display.contentWidth*.1 

    elseif (answerPosition == 2) then
       
        answerTextObject.x = display.contentWidth*.2        
        wrongAnswer1TextObject.x = display.contentWidth*.1
        wrongAnswer2TextObject.x = display.contentWidth*.3 

    else
       
        answerTextObject.x = display.contentWidth*.1        
        wrongAnswer1TextObject.x = display.contentWidth*.2
        wrongAnswer2TextObject.x = display.contentWidth*.3
    end

end

-- Creating Transition to Lose Screen
local function LoseScreenTransition( )        
    MakeSceneObjectsInvisible()
    RemoveTextObjectListeners()
    composer.gotoScene( "you_lose", {effect = "zoomInOutFade", time = 1000})
end 

-- The function that displays the equation and determines the answer and the wrong answers
local function DisplayAddEquation()
    -- local variables to this function
    local addEquationString

    -- choose the numbers to add randomly
    firstNumber = math.random(MIN_NUM, MAX_NUM)
    secondNumber = math.random(MIN_NUM, MAX_NUM)

    -- create the addition equation to display
    addEquationString = firstNumber .. " + " .. secondNumber .. " = " 

    -- displays text on text object
    addEquationTextObject.text = addEquationString

    
end

-- Functions that checks if the buttons have been clicked.
local function TouchListenerAnswer(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = answerTextObject.text

    if (touch.phase == "ended") then
        
        -- set boolean
        alreadyClickedAnAnswer = true

        if (answer == tonumber(userAnswer)) then     
            correct.isVisible = true
            timer.performWithDelay( 1000, RestartSceneRight )

        else
            print ("***WRONG")
        end        

    end
end

local function TouchListenerWrongAnswer1(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = wrongAnswer1TextObject.text

    if (touch.phase == "ended") then

        -- set boolean
        alreadyClickedAnAnswer = true
        
        if (answer == tonumber(userAnswer)) then
        else
            wrong.isVisible = true
            timer.performWithDelay( 1000, RestartSceneWrong )            
        end        

    end
end

local function TouchListenerWrongAnswer2(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = wrongAnswer2TextObject.text

      
        if (touch.phase == "ended") then

            -- set boolean
            alreadyClickedAnAnswer = true

            if (answer == tonumber(userAnswer)) then
            else
                wrong.isVisible = true
                timer.performWithDelay( 1000, RestartSceneWrong )            
            end        
    
        end
end
    

local function AddTextObjectListeners()

    answerTextObject:addEventListener("touch", TouchListenerAnswer)
    wrongAnswer1TextObject:addEventListener("touch", TouchListenerWrongAnswer1)
    wrongAnswer2TextObject:addEventListener("touch", TouchListenerWrongAnswer2)

end

local function RemoveTextObjectListeners()

    answerTextObject:removeEventListener("touch", TouchListenerAnswer)
    wrongAnswer1TextObject:removeEventListener("touch", TouchListenerWrongAnswer1)
    wrongAnswer2TextObject:removeEventListener("touch", TouchListenerWrongAnswer2)

end

local function CheckLives()
-- if they lose all their lives, go to you lose screen
    if (lives == 0) then
        timer.performWithDelay( 1000, LoseScreenTransition )     
    end
end

local function HideOutOfTimeText()
    outOfTimeText.isVisible = false
    CheckLives()
end

-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

function RestartScene()

    livesText.text = "Number of lives = " .. tostring(lives)
    numberCorrectText.text = "Number correct = " .. tostring(numberCorrect)

    MakeSceneObjectsVisible()
    DisplayAddEquation()
    DeternmineAnswers()
    DisplayAnswers()
end

-- Function that restarts the scene when the answer is wrong.
function RestartSceneWrong()

    wrong.isVisible = false
    -- decrease the number of lives by 1  
    lives = lives - 1
    livesText.text = "Number of lives = " .. tostring(lives)

    MakeSceneObjectsInvisible()

    -- if the number of lives reaches 0, show the you lose scene
    if (lives == 0) then        
        RemoveTextObjectListeners()
        composer.gotoScene( "you_lose" )
    -- otherwise, restart the scene
    else        
        RestartScene() 
    end
end

function RestartSceneRight()

    correct.isVisible = false
    numberCorrect = numberCorrect + 1
    numberCorrectText.text = "Number correct = " .. tostring(numberCorrect)

    MakeSceneObjectsInvisible()

    -- if they answer 8 questions right, go to the next level
    if (numberCorrect == 2) then        
        -- Displays congratulations text        
        congratulationText.isVisible = true   
        RemoveTextObjectListeners()  
        timer.performWithDelay(1000, MakeSceneObjectsInvisible)  
        timer.performWithDelay(1000, YouWinTransition)
    -- otherwise, restart the scene
    else
        RestartScene()
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg = display.newImageRect("Images/Level 1 Screen.png", display.contentWidth, display.contentHeight)
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight

    addEquationTextObject = display.newText( "", display.contentWidth*1/4, display.contentHeight*2/5, nil, 50 )
    -- sets the color of the text
    addEquationTextObject:setTextColor(155/255, 42/255, 198/255)


    answerTextObject = display.newText("", display.contentWidth*.4, display.contentHeight/2, nil, 50 )
    wrongAnswer1TextObject = display.newText("", display.contentWidth*.3, display.contentHeight/2, nil, 50 )
    wrongAnswer2TextObject = display.newText("", display.contentWidth*.2, display.contentHeight/2, nil, 50 )
    numberCorrectText = display.newText("", display.contentWidth*4/5, display.contentHeight*6/7, nil, 25)

    livesText = display.newText("", display.contentWidth*4/5, display.contentHeight*8/9, nil, 25) 

    -- the text displaying congratulations
    congratulationText = display.newText("Good job!", display.contentWidth/2, display.contentHeight*2/5, nil, 50 )

    -- Sets text colour
    congratulationText:setTextColor(57/255, 230/255, 0)
    congratulationText.isVisible = false

    -- Displays text that says correct.
    correct = display.newText("Correct", display.contentWidth/2, display.contentHeight*1/3, nil, 50 )
    correct:setTextColor(100/255, 47/255, 210/255)
    correct.isVisible = false

    -- Displays text that says wrong.
    wrong = display.newText("Wrong", display.contentWidth/2, display.contentHeight*1/3, nil, 50 )
    wrong:setTextColor(100/255, 47/255, 210/255)
    wrong.isVisible = false 

    -- Displays the out of time text
    outOfTimeText = display.newText("Out of Time!", display.contentWidth*2/5, display.contentHeight*1/3, nil, 50)
    outOfTimeText:setTextColor(100/255, 47/255, 210/255)
    outOfTimeText.isVisible = false

    -- Displays the level text of time text
    level1Text = display.newText("Level 1", display.contentWidth*2/12, display.contentHeight*2/12, nil, 50)
    level1Text:setTextColor(0, 0, 0)

-----------------------------------------------------------------------------------------
-- WIDGETS
-----------------------------------------------------------------------------------------

    
    -- Insert objects into scene group
    sceneGroup:insert( bkg )  
    sceneGroup:insert( numberCorrectText )
    sceneGroup:insert( livesText )
    sceneGroup:insert( addEquationTextObject )
    sceneGroup:insert( answerTextObject )
    sceneGroup:insert( wrongAnswer1TextObject )
    sceneGroup:insert( wrongAnswer2TextObject )
    sceneGroup:insert( outOfTimeText )
    sceneGroup:insert( congratulationText )
    sceneGroup:insert( wrong )
    sceneGroup:insert( correct )
    sceneGroup:insert( level1Text )
end

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    --local sceneGroup = self.view
    local phase = event.phase


    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        lives = 3
        numberCorrect = 0

        AddTextObjectListeners()        

        -- Restart the scene
        RestartScene()
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then


        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        RemoveTextObjectListeners()

    -----------------------------------------------------------------------------------------

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

-- Adding Event Listeners for Scene
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene