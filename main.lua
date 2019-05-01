display.setDefault ( "background", 53/255, 235/255, 242/255)



local physics = require( "physics" )



physics.start()

physics.setGravity( 0, 25 ) -- ( x, y )



local theGround = display.newImage( "assets/images/land.png" )

theGround.x = display.contentCenterX

theGround.y = display.contentHeight

theGround.id = "the ground"

physics.addBody( theGround, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )



scrollSpeed = 3



display.setStatusBar(display.HiddenStatusBar)

 

centerX = 120

centerY = 360



local sheetOptionsIdle =

{

    width = 587,

    height = 707,

    numFrames = 10

}

local sheetIdleKnight = graphics.newImageSheet( "assets/images/knightIdle.png", sheetOptionsIdle )



local sheetOptionsWalk =

{

    width = 587,

    height = 707,

    numFrames = 10

}

local sheetWalkingKnight = graphics.newImageSheet( "assets/images/knightWalking.png", sheetOptionsWalk )



-- sequences table

local sequence_data = {

    -- consecutive frames sequence

    {

        name = "idle",

        start = 1,

        count = 10,

        time = 800,

        loopCount = 0,

        sheet = sheetIdleKnight

    },

    {

        name = "walk",

        start = 1,

        count = 10,

        time = 800,

        loopCount = 0,

        sheet = sheetWalkingKnight

    }

}



local knight = display.newSprite( sheetIdleKnight, sequence_data )

knight.x = centerX

knight.y = centerY

knight.xScale = 117.4/587

knight.yScale = 141.4/707



knight:play()



-- After a short time, swap the sequence to 'seq2' which uses the second image sheet

local function swapSheet()

    knight:setSequence( "walk" )

    knight:play()

    print("walk")

end



local function MoveImage1 ( event )

	timer.performWithDelay( 2000, function ()

	knight.x = knight.x + scrollSpeed

	knight.y = 350

end

)

end



timer.performWithDelay( 2000, swapSheet )



display.setStatusBar(display.HiddenStatusBar)

 

centerX = 180

centerY = 360



local sheetOptionsIdle =

{

    width = 232,

    height = 439,

    numFrames = 10

}

local sheetIdleNinja = graphics.newImageSheet( "assets/images/ninjaBoyIdle.png", sheetOptionsIdle )



local sheetOptionsWalk =

{

    width = 363,

    height = 458,

    numFrames = 10

}

local sheetWalkingNinja = graphics.newImageSheet( "assets/images/ninjaBoyRun.png", sheetOptionsWalk )



-- sequences table

local sequence_data = {

    -- consecutive frames sequence

    {

        name = "idle",

        start = 1,

        count = 10,

        time = 800,

        loopCount = 0,

        sheet = sheetIdleninja

    },

    {

        name = "walk",

        start = 1,

        count = 10,

        time = 800,

        loopCount = 0,

        sheet = sheetWalkingNinja

    }

}



local ninja = display.newSprite( sheetIdleNinja, sequence_data )

ninja.xScale = 117.4/363

ninja.yScale = 141.4/458

ninja.x = 180

ninja.y = 350



ninja:play()



-- After a short time, swap the sequence to 'seq2' which uses the second image sheet

local function swapSheet()

    ninja:setSequence( "walk" )

    ninja:play()

    print("walk")

end



timer.performWithDelay( 2000, swapSheet )



local function MoveImage2 ( event )

	timer.performWithDelay( 2000, function ()

	ninja.x = ninja.x + scrollSpeed

	ninja.y = 350

end

)

end



Runtime:addEventListener("enterFrame", MoveImage1)



Runtime:addEventListener("enterFrame", MoveImage2)