--[[
 ________ ___  ___  ________           ________  ________  _____ ______   ________  ________  ___  ___  ________   ________          ___       __   ________  ________  ________  ________      
|\  _____\\  \|\  \|\   ___  \        |\   ____\|\   __  \|\   _ \  _   \|\   __  \|\   __  \|\  \|\  \|\   ___  \|\   ___ \        |\  \     |\  \|\   __  \|\   __  \|\   ___ \|\   ____\     
\ \  \__/\ \  \\\  \ \  \\ \  \       \ \  \___|\ \  \|\  \ \  \\\__\ \  \ \  \|\  \ \  \|\  \ \  \\\  \ \  \\ \  \ \  \_|\ \       \ \  \    \ \  \ \  \|\  \ \  \|\  \ \  \_|\ \ \  \___|_    
 \ \   __\\ \  \\\  \ \  \\ \  \       \ \  \    \ \  \\\  \ \  \\|__| \  \ \   ____\ \  \\\  \ \  \\\  \ \  \\ \  \ \  \ \\ \       \ \  \  __\ \  \ \  \\\  \ \   _  _\ \  \ \\ \ \_____  \   
  \ \  \_| \ \  \\\  \ \  \\ \  \       \ \  \____\ \  \\\  \ \  \    \ \  \ \  \___|\ \  \\\  \ \  \\\  \ \  \\ \  \ \  \_\\ \       \ \  \|\__\_\  \ \  \\\  \ \  \\  \\ \  \_\\ \|____|\  \  
   \ \__\   \ \_______\ \__\\ \__\       \ \_______\ \_______\ \__\    \ \__\ \__\    \ \_______\ \_______\ \__\\ \__\ \_______\       \ \____________\ \_______\ \__\\ _\\ \_______\____\_\  \ 
    \|__|    \|_______|\|__| \|__|        \|_______|\|_______|\|__|     \|__|\|__|     \|_______|\|_______|\|__| \|__|\|_______|        \|____________|\|_______|\|__|\|__|\|_______|\_________\
                                                                                                                                                                                    \|_________|
      --WHY?   Because Raisans                                                                                                                                                                       ]]                

---------------------------------------------------------------------------------------------
--Course code: ICS2O
-- level1_screenV2.lua
-- Created by: Dustyn.M-H, Aidan Saull
-- Date: Nov. 22nd, 2014
-- Description: This is the level 1 screen of the game.
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
-- INITIALIZATIONS                                                                         --
---------------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

---------------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

---------------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level3_screen"

---------------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- Adding music                                                                        --
-----------------------------------------------------------------------------------------
local isChannel2Playing = audio.isChannelPlaying( 2 )

local wrongSound = audio.loadSound("Sounds/wrong.mp3")
local correctSound = audio.loadSound("Sounds/correct.mp3")

if isChannel2Playing == false then
    local backgroundMusic = audio.loadSound( "Sounds/Funk Game Loop.mp3" )
    local backgroundMusicChannel = audio.play(backgroundMusic, {loops = -1, channel = 2})
end

--bringing in pause overlay
function gotoPause( )
    composer.removeScene("pause")
    composer.showOverlay( "pause", {effect = "fromLeft", time = 200, isModal = true} )
end

--making the pause button
local pauseButton = widget.newButton
{
    width = display.contentWidth/25,
    height = display.contentWidth/25,
    defaultFile = "Images/pause.png",
    overFile = "Images/pausepressed.png",
    onEvent = gotoPause
}

-- move the button
pauseButton.x = display.contentWidth/20
pauseButton.y = display.contentHeight/20

--bringing in help overlay
function gotoHelp( )
    composer.removeScene("help")
    composer.showOverlay( "help", {effect = "fromRight", time = 200, isModal = true} )
end

--making the help button
local helpButton = widget.newButton
{
    width = display.contentWidth/25,
    height = display.contentWidth/25,
    defaultFile = "Images/help.png",
    overFile = "Images/helppressed.png",
    onEvent = gotoHelp
}

-- move the button
helpButton.x = display.contentWidth - display.contentWidth*1/20
helpButton.y = display.contentHeight/20




-- this should contain at least 20-30 different words
local wordBankLevel1 = { {"Card", "Board"}, {"Draw", "Bridge"}, {"Note", "Book"}, {"After", "Life"}, {"Fire", "Cracker"}, {"Door", "Knob"}, {"Rail", "Road"}, {"House", "Boat"}, {"Bell", "Hop"}, {"Shoe", "Lace"} }

-- this word list contains 4 randomly chosen word groups from the word bank
local wordListLevel1 = {}

-- these two arrays containing the words in each cloud
local wordListLevel1SetA = {}
local wordListLevel1SetB = {} 

-- currently you are only putting 4 words per cloud
local WORD_LIST_SIZE = 4

-- the words the user clicks on
local userWordSetA = ""
local userWordSetB = ""

-- boolean variables set depending on which group user clicks on
local clickedWordSetA = false
local clickedWordSetB = false

-- initialize text objects and their location
local word1 = display.newText( "" , display.contentWidth*2/9, display.contentHeight*5/16, native.systemFont, 32 )
local word2 = display.newText( "", display.contentWidth*7/9, display.contentHeight*11/32, native.systemFont, 32 )

local word3 = display.newText( "", display.contentWidth*3/9, display.contentHeight*6/16, native.systemFont, 32 )
local word4 = display.newText( "", display.contentWidth*6/9, display.contentHeight*13/32, native.systemFont, 32 )

local word5 = display.newText("", display.contentWidth*1/9, display.contentHeight*6/16, native.systemFont, 32 )
local word6 = display.newText( "", display.contentWidth*16/18, display.contentHeight*13/32, native.systemFont, 32 )

local word7 = display.newText( "", display.contentWidth*2/9, display.contentHeight*7/16, native.systemFont, 32 )
local word8 = display.newText( "", display.contentWidth*14/18, display.contentHeight*15/32, native.systemFont, 32 )


-- these are arrays of the text objects above, one for each cloud
local textObjectSetA = {word1, word3, word5, word7}
local textObjectSetB = {word2, word4, word6, word8}


-- initialize colour of words to black
word1:setFillColor( 0, 0, 0 )
word2:setFillColor( 0, 0, 0 )
word3:setFillColor( 0, 0, 0 )
word4:setFillColor( 0, 0, 0 )
word5:setFillColor( 0, 0, 0 )
word6:setFillColor( 0, 0, 0 )
word7:setFillColor( 0, 0, 0 )
word8:setFillColor( 0, 0, 0 )

---------------------------------------------------------------------------------------------

--LOGIC--------------------------------------------------------------------------------------

function CreateWordListAndSets()
    local wordListLength
    local randomIndex
    local numWordsInserted = 1
    local aWordSet = {}

    -- create a random word list, with its corresponding sets, for the WORD_LIST_SIZE
    while ( numWordsInserted <= WORD_LIST_SIZE )  do

        -- get the size of the original word list
        wordListLength = table.getn(wordBankLevel1)

        -- get a random index to find a word from the word list
        randomIndex = math.random(1, wordListLength)
        print ("***randomIndex = " .. randomIndex)

        -- remove a word set from the random location in the original word bank
        aWordSet = table.remove(wordBankLevel1, randomIndex)
        print ("***aWordSet[1] = " .. aWordSet[1] )
        print ("***aWordSet[2] = " .. aWordSet[2] )

        -- insert the word set into the word list we will use for this game
        table.insert(wordListLevel1, aWordSet)

        -- create the different arrays of word lists 
        table.insert(wordListLevel1SetA, aWordSet[1])
        table.insert(wordListLevel1SetB, aWordSet[2])

        -- increase the number of words inserted into the word list for this game
        numWordsInserted = numWordsInserted + 1
        
    end
    print ("*** wordBankLength = " .. table.getn(wordBankLevel1))
    print ("*** wordListLength = " .. table.getn(wordListLevel1))

    -- for error checking only.
    PrintWordSetA()
    PrintWordSetB()
        
end

function CreateTextObjectSets()
    textObjectSetA = {word1, word3, word5, word7}
    textObjectSetB = {word2, word4, word6, word8}
end

-- For testing purposes
function PrintWordSetA()
    local i = 1
    local wordListLength = table.getn(wordListLevel1SetA)

    while (i <= wordListLength) do
        print ("*** wordListLevel1SetA[" .. i .. "] = " .. wordListLevel1SetA[i])
        i = i+1
    end

end

-- For testing purposes
function PrintWordSetB()
    local i = 1
    local wordListLength = table.getn(wordListLevel1SetB)

    while (i <= wordListLength) do
        print ("*** wordListLevel1SetB[" .. i .. "] = " .. wordListLevel1SetB[i])
        i = i+1
    end

end

-- For testing purposes
function PrintTextObjectSetA()
    local i = 1
    local wordListLength = table.getn(textObjectSetA)

    while (i <= wordListLength) do
        print ("*** textObjectSetA[" .. i .. "] = " .. textObjectSetA[i].text)
        i = i+1
    end

end

-- For testing purposes
function PrintTextObjectSetB()
    local i = 1
    local wordListLength = table.getn(textObjectSetB)

    while (i <= wordListLength) do
        print ("*** textObjectSetA[" .. i .. "] = " .. textObjectSetB[i].text)
        i = i+1
    end

end

-- This function will just display the words randomly in cloud A
function DisplayRandomWordSetA()

    local wordListLengthSetA = table.getn(wordListLevel1SetA)
    local wordListLevel1SetACopy = {}
    local randomIndex
    local aWord 
    local i = 1

    while (wordListLengthSetA > 0) do
        randomIndex = math.random(1, wordListLengthSetA)
        aWord = table.remove(wordListLevel1SetA, randomIndex)
        textObjectSetA[i].text = aWord
        i = i+1
        wordListLengthSetA = table.getn(wordListLevel1SetA)
        table.insert (wordListLevel1SetACopy, aWord)
    end

    -- recreate the word list so that it is not modified
    wordListLevel1SetA = wordListLevel1SetACopy

end

function DisplayRandomWordSetB()

    local wordListLengthSetB = table.getn(wordListLevel1SetB)
    local wordListLevel1SetBCopy = {}
    local randomIndex
    local aWord 
    local i = 1

    while (wordListLengthSetB > 0) do
        randomIndex = math.random(1, wordListLengthSetB)
        aWord = table.remove(wordListLevel1SetB, randomIndex)
        textObjectSetB[i].text = aWord
        i = i+1
        wordListLengthSetB = table.getn(wordListLevel1SetB)
        table.insert (wordListLevel1SetBCopy, aWord)
    end

    -- recreate the word list so that it is not modified
    wordListLevel1SetB = wordListLevel1SetBCopy

end

function Level1Start()
    -- reset boolean variables
    clickedWordSetA = false
    clickedWordSetB = false

    ResetWordColourSetA()
    ResetWordColourSetB()

    -- display random words on clouds for each word set
    DisplayRandomWordSetA()
    DisplayRandomWordSetB()

    
end

function RemoveWordFromSetA()
    local i = 1
    local wordFound = false
    local wordListLength = table.getn(wordListLevel1SetA)

    while ( (i <= wordListLength) and (wordFound == false) ) do
        if (userWordSetA == wordListLevel1SetA[i]) then
            table.remove(wordListLevel1SetA, i)
            wordFound = true
        end
        i = i+1
    end
end

function RemoveWordFromSetB()
    local i = 1
    local wordFound = false
    local wordListLength = table.getn(wordListLevel1SetB)

    while ( (i <= wordListLength) and (wordFound == false) ) do        
        if (userWordSetB == wordListLevel1SetB[i]) then        
            table.remove(wordListLevel1SetB, i)            
            wordFound = true
        end
        i = i+11    
    end
end

local function hide( aTextObject)
    transition.scaleTo( aTextObject, { xScale=0.01, yScale=0.01, time=300, alpha=0} )
end

function RemoveWordFromTextObjectSetA()
    local i = 1
    local wordFound = false
    local textObjectListLength = table.getn(textObjectSetA)
    local aTextObject


    while ( (i <= textObjectListLength) and (wordFound == false) ) do
        aTextObject = textObjectSetA[i]
        
        if (userWordSetA == aTextObject.text) then
            aTextObject:setFillColor(0, 0, 0)            
            transition.to( aTextObject, { time=2000, x=(display.contentWidth*3/7), y=(display.contentHeight*2/3), transition=easing.outElastic, onComplete=hide})
            table.remove(textObjectSetA, i)
            wordFound = true
        end
        i = i+1
    end
end

function RemoveWordFromTextObjectSetB()
    local i = 1
    local wordFound = false
    local textObjectListLength = table.getn(textObjectSetB)
    local aTextObject


    while ( (i <= textObjectListLength) and (wordFound == false) ) do
        aTextObject = textObjectSetB[i]
        
        if (userWordSetB == aTextObject.text) then
            aTextObject:setFillColor(0, 0, 0)          
            transition.to( aTextObject, { time=2000, x=(display.contentWidth*4/7), y=(display.contentHeight*2/3), transition=easing.outElastic, onComplete=hide})
            table.remove(textObjectSetB, i)
            wordFound = true
        end
        i = i+1
    end
end

function VerifyWordGroup()    

    print ("***userWordSetA = " .. userWordSetA)
    print ("***userWordSetB = " .. userWordSetB)

    -- find the index of the word in the word list
    --FindWordIndex()

    PrintWordSetA()
    PrintWordSetB()

    local i = 1
    local wordListLength = table.getn(wordListLevel1)
    local wordFound = false
    local aWordGroup



    while ( (i <= wordListLength) and (wordFound == false) ) do
        aWordGroup = wordListLevel1[i]
        -- match the user's first word with the first word in a word group
        if (aWordGroup[1] == userWordSetA) then

            wordFound = true
            -- check if the user's second word is the same as the second word in the word group
            if (aWordGroup[2] == userWordSetB) then
                print ("CONGRATULATIONS")

                clickedWordSetA = false
                clickedWordSetB = false

                audio.play(correctSound)


                -- increment number of words matched correctly
                numWordsCorrect = numWordsCorrect + 1

                print ("*** aWordGroup[1] = " .. aWordGroup[1])
                print ("*** aWordGroup[2] = " .. aWordGroup[2])

                -- remove the word from the word list
                table.remove(wordListLevel1, i)
                print ("***NEW wordListLength = " .. table.getn(wordListLevel1) )
                RemoveWordFromSetA()
                print ("***NEW wordListLengthSetA = " .. table.getn(wordListLevel1SetA) )
                RemoveWordFromSetB()
                print ("***NEW wordListLengthSetB = " .. table.getn(wordListLevel1SetB) )
                RemoveWordFromTextObjectSetA()
                print ("***NEW textObjectLengthSetA = " .. table.getn(textObjectSetA) )
                RemoveWordFromTextObjectSetB()
                print ("***NEW textObjectLengthSetB = " .. table.getn(textObjectSetB) )
                
                -- error checking only... delete later
                PrintWordSetA()
                PrintWordSetB()
                
            else
                print ("WRONG")

                function scaleX()
                    transition.scaleTo( xImage, { xScale=0.001, yScale=0.001, time=500, alpha=0, transition=easing.inBack, onComplete = hideX})
                    function hideX( )
                        xImage.isVisible = false
                    end
                end

                clickedWordSetA = false
                clickedWordSetB = false

                ResetWordColourSetA( )
                ResetWordColourSetB( )


                xImage.isVisible = true
                transition.scaleTo( xImage, { xScale=1, yScale=1, time=2000, alpha=1, transition=easing.outElastic, onComplete = scaleX})

                audio.play(wrongSound)

            end
        end
        i = i + 1
    end

    if (numWordsCorrect == WORD_LIST_SIZE) then
        RemoveWordEventListeners( )
        scene:removeEventListener( "create", scene )
        scene:removeEventListener( "show", scene )
        scene:removeEventListener( "hide", scene )
        scene:removeEventListener( "destroy", scene )
        local function nextScene()
            print("enteredscene")
            composer.gotoScene( "beatlevelthree" )
        end
        timer.performWithDelay(3000, nextScene)
        pauseButton.isVisible = false

    else
        --Level1Start()
    end

    

end



-----------------------------------------------------------------------------------------
    --   ADDING FIRST WORD                                                                 --
    -----------------------------------------------------------------------------------------
    function TouchListenerWord1( event )

        if ( "ended" == event.phase ) then
            -- set all words to black
            ResetWordColourSetA()

            -- set word1 to red
            word1:setFillColor( 1, 0, 0 )

            -- set this word to user word selected for set A
            userWordSetA = word1.text

            -- set boolean to true
            clickedWordSetA = true            
            
            -- only call verify word if a word from both sets has been clicked
            if ( (clickedWordSetA == true) and (clickedWordSetB == true) ) then

                VerifyWordGroup()
            end

        end
    end

-----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------
    --   ADDING SECOND WORD                                                                --
    -----------------------------------------------------------------------------------------
    function TouchListenerWord2( event )

        if ( "ended" == event.phase ) then
            -- set all words to black
            ResetWordColourSetB()

            -- set word1 to red
            word2:setFillColor( 1, 0, 0 )

            -- set this word to user word selected for set A
            userWordSetB = word2.text

            -- set boolean to true
            clickedWordSetB = true            
            
            -- only call verify word if a word from both sets has been clicked
            if ( (clickedWordSetA == true) and (clickedWordSetB == true) ) then
                VerifyWordGroup()
            end

        end
    end
    -----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------
    --   ADDING THIRD WORD                                                                 --
    -----------------------------------------------------------------------------------------
    function TouchListenerWord3( event )

        if ( "ended" == event.phase ) then
            -- set all words to black
            ResetWordColourSetA()

            -- set word1 to red
            word3:setFillColor( 1, 0, 0 )

            -- set this word to user word selected for set A
            userWordSetA = word3.text

            -- set boolean to true
            clickedWordSetA = true            
            
            -- only call verify word if a word from both sets has been clicked
            if ( (clickedWordSetA == true) and (clickedWordSetB == true) ) then
                VerifyWordGroup()
            end
        end
    end
    -----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------
    --   ADDING FOURTH WORD                                                                --
    -----------------------------------------------------------------------------------------
    function TouchListenerWord4( event )

        if ( "ended" == event.phase ) then
            -- set all words to black
            ResetWordColourSetB()

            -- set word1 to red
            word4:setFillColor( 1, 0, 0 )

            -- set this word to user word selected for set A
            userWordSetB = word4.text

            -- set boolean to true
            clickedWordSetB = true            
            
            -- only call verify word if a word from both sets has been clicked
            if ( (clickedWordSetA == true) and (clickedWordSetB == true) ) then
                VerifyWordGroup()
            end
        end
    end
    -----------------------------------------------------------------------------------------

    -----------------------------------------------------------------------------------------
    --   ADDING FIFTH WORD                                                                 --
    -----------------------------------------------------------------------------------------
    function TouchListenerWord5( event )

        if ( "ended" == event.phase ) then
            -- set all words to black
            ResetWordColourSetA()

            -- set word1 to red
            word5:setFillColor( 1, 0, 0 )

            -- set this word to user word selected for set A
            userWordSetA = word5.text

            -- set boolean to true
            clickedWordSetA = true            
            
            -- only call verify word if a word from both sets has been clicked
            if ( (clickedWordSetA == true) and (clickedWordSetB == true) ) then
                VerifyWordGroup()
            end
        end
    end
    -----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------
    --   ADDING SIXTH WORD                                                                --
    -----------------------------------------------------------------------------------------
    function TouchListenerWord6( event )

        if ( "ended" == event.phase ) then
            -- set all words to black
            ResetWordColourSetB()

            -- set word1 to red
            word6:setFillColor( 1, 0, 0 )

            -- set this word to user word selected for set A
            userWordSetB = word6.text

            -- set boolean to true
            clickedWordSetB = true            
            
            -- only call verify word if a word from both sets has been clicked
            if ( (clickedWordSetA == true) and (clickedWordSetB == true) ) then
                VerifyWordGroup()
            end
        end
    end
    -----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------
    --   ADDING SEVENTH WORD                                                                 --
    -----------------------------------------------------------------------------------------
    function TouchListenerWord7( event )

        if ( "ended" == event.phase ) then
            -- set all words to black
            ResetWordColourSetA()

            -- set word1 to red
            word7:setFillColor( 1, 0, 0 )

            -- set this word to user word selected for set A
            userWordSetA = word7.text

            -- set boolean to true
            clickedWordSetA = true            
            
            -- only call verify word if a word from both sets has been clicked
            if ( (clickedWordSetA == true) and (clickedWordSetB == true) ) then
                VerifyWordGroup()
            end
        end
    end
    -----------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------
    --   ADDING EIGHTH WORD                                                                --
    -----------------------------------------------------------------------------------------
    function TouchListenerWord8( event )

        if ( "ended" == event.phase ) then
            -- set all words to black
            ResetWordColourSetB()

            -- set word1 to red
            word8:setFillColor( 1, 0, 0 )

            -- set this word to user word selected for set A
            userWordSetB = word8.text

            -- set boolean to true
            clickedWordSetB = true            
            
            -- only call verify word if a word from both sets has been clicked
            if ( (clickedWordSetA == true) and (clickedWordSetB == true) ) then
                VerifyWordGroup()
            end
        end
    end
    ----------------------------------------------------------------------------------------

function AddWordEventListeners()

    word1:addEventListener("touch", TouchListenerWord1)
    word2:addEventListener("touch", TouchListenerWord2)
    word3:addEventListener("touch", TouchListenerWord3)
    word4:addEventListener("touch", TouchListenerWord4)
    word5:addEventListener("touch", TouchListenerWord5)
    word6:addEventListener("touch", TouchListenerWord6)
    word7:addEventListener("touch", TouchListenerWord7)
    word8:addEventListener("touch", TouchListenerWord8)
end

function RemoveWordEventListeners()
    word1:removeEventListener("touch", TouchListenerWord1)
    word2:removeEventListener("touch", TouchListenerWord2)
    word3:removeEventListener("touch", TouchListenerWord3)
    word4:removeEventListener("touch", TouchListenerWord4)
    word5:removeEventListener("touch", TouchListenerWord5)
    word6:removeEventListener("touch", TouchListenerWord6)
    word7:removeEventListener("touch", TouchListenerWord7)
    word8:removeEventListener("touch", TouchListenerWord8)
end

function ResetWordColourSetA()
    word1:setFillColor(0, 0, 0 )
    word3:setFillColor(0, 0, 0 )
    word5:setFillColor(0, 0, 0 )
    word7:setFillColor(0, 0, 0 )
end

function ResetWordColourSetB()
    word2:setFillColor(0, 0, 0 )
    word4:setFillColor(0, 0, 0 )
    word6:setFillColor(0, 0, 0 )
    word8:setFillColor(0, 0, 0 )
end

function MakeAllWordsVisible()
    word1.isVisible = true
    word2.isVisible = true
    word3.isVisible = true
    word4.isVisible = true
    word5.isVisible = true
    word6.isVisible = true
    word7.isVisible = true
    word8.isVisible = true
end

-- The function called when the screen doesn't existd
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    --insert the red x
    xImage = display.newImageRect("Images/X Button.png", display.contentWidth/7, display.contentWidth/7)
    xImage.x = display.contentWidth/2
    xImage.y = display.contentHeight*1/6
    xImage.isVisible = false
    transition.scaleTo( xImage, { xScale=0.01, yScale=0.01, time=0, alpha=0})

    -- Insert the background image
    local bkg_image = display.newImageRect("Images/Level_3.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY

    -----------------------------------------------------------------------------------------
    --  INITIAL CLOUD POSITION                                                             --
    -----------------------------------------------------------------------------------------
    local CloudImage = display.newImageRect("Images/Cloudsfinished.png", display.contentWidth/1, display.contentHeight/3)
    CloudImage.x = display.contentCenterX
    CloudImage.y = 300 
    -----------------------------------------------------------------------------------------
  

    bkg_image:toBack()

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )    
    sceneGroup:insert( CloudImage )    
    sceneGroup:insert( word1 )
    sceneGroup:insert( word2 )  
    sceneGroup:insert( word3 ) 
    sceneGroup:insert( word4 )
    sceneGroup:insert( word5 )
    sceneGroup:insert( word6 )
    sceneGroup:insert( word7 )
    sceneGroup:insert( word8 ) 
    sceneGroup:insert(pauseButton)
    sceneGroup:insert(helpButton)
    sceneGroup:insert(xImage)

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    --transition.to( soundButton, { time=500, x=(display.contentWidth*1/20), y=(display.contentHeight*19/20), transition=easing.outElastic})

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        backgroundMusicChannel = audio.stop(1)

        -- Called when the scene is still off screen (but is about to come on screen).
        -- stop the music when leaving this scene
        --backgroundMusicChannel = audio.stop()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        -- play the background music for this scene
        CreateWordListAndSets()
        CreateTextObjectSets()
        print ("************************* Inside: Show DID")
        PrintTextObjectSetA()
        PrintTextObjectSetB()
        -- initialize the number of words correct
        numWordsCorrect = 0
        -- start level 1
        Level1Start()
        -- add event listeners to words
        AddWordEventListeners()
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

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
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
-- EVENT LISTENERS FOR SCENE                                                                     --
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene