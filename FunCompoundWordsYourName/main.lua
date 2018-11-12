-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Ms Raffin
-- Date: Nov. 22nd, 2014
-- Description: This calls the splash screen of the app to load itself.  It also creates
--the current level file, the flappy bird high score file, and a number for total words
--matched that has yet to be implemented
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "level1_screen" )
