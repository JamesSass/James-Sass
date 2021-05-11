-- device display height and width
_H = display.contentHeight;
_W = display.contentWidth;
--creating chessboard from image file
local background = display.newImage("images/chessboard.jpg",_W/2,_H/2);
background:scale(0.63, 0.64)
--adds background to create redwood side
local side = display.newImage("images/red wood.jpg",_W/2.41,_H/2);
--assures that the chessboard is in front of redwood background
background:toFront();
-- Hiding the status bar
display.setStatusBar(display.HiddenStatusBar);
--adding physics
local physics = require("physics");
-- adding drawing mode for testing
physics.setDrawMode("normal")
--total piece tap
local tapCountW1 = 0
local tapCountW2 = 0
local tapCountW3 = 0
local tapCountW4 = 0
local tapCountW5 = 0
local tapCountW6 = 0
local tapCountW7 = 0
local tapCountW8 = 0
local tapCountB1 = 0
local tapCountB2 = 0
local tapCountB3 = 0
local tapCountB4 = 0
local tapCountB5 = 0
local tapCountB6 = 0
local tapCountB7 = 0
local tapCountB8 = 0
--turn
local whiteTurn = true
local blackTurn = false
-- add background music
local BackgroundMusic = audio.loadStream("sounds/Background Music.mp3");
-- add balloon pop sound effect
local PieceSound = audio.loadSound("sounds/BoardCreak.mp3");
-- adding text 
local screenTextW = display.newText("White", 0, 0, "MASQUE.ttf", 9*2);
screenTextW.xScale = 0.5
screenTextW.yScale = 0.5;

screenTextW.x = 20;
screenTextW.y = 10;

local screenTextB = display.newText("Black", 0, 0, "MASQUE.ttf", 9*2);
screenTextB.xScale = 0.5
screenTextB.yScale = 0.5;

screenTextB.x = _W-22;
screenTextB.y = 10;

--start physics
physics.start()
physics.setGravity(0, 0)	

--create walls
local leftWall = display.newRect (0, 0, 1, _H*2);
local rightWall = display.newRect (_W, 0, 1, _H*2);
local ceiling = display.newRect (_W/2, 0, _W, 1);
local floor = display.newRect (_W/2, _W/1.53, _W, 1);

-- Add physics to the walls
physics.addBody (leftWall, "static",  { bounce = 100.5 } );
physics.addBody (rightWall, "static", { bounce = 100.5 } );
physics.addBody (ceiling, "static",   { bounce = 100.5 } );
physics.addBody (floor, "static",   { bounce = 100.5 } );

-- start game
local function startGame()
	-- generate pieces, 25 pixels by 25 pixels
	local wPawn1 = display.newImageRect("images/w_pawn.png", 25, 25);
	local wPawn2 = display.newImageRect("images/w_pawn.png", 25, 25);
	local wPawn3 = display.newImageRect("images/w_pawn.png", 25, 25);
	local wPawn4 = display.newImageRect("images/w_pawn.png", 25, 25);
	local wPawn5 = display.newImageRect("images/w_pawn.png", 25, 25);
	local wPawn6 = display.newImageRect("images/w_pawn.png", 25, 25);
	local wPawn7 = display.newImageRect("images/w_pawn.png", 25, 25);
	local wPawn8 = display.newImageRect("images/w_pawn.png", 25, 25);
	local wKing = display.newImageRect("images/w_king.png", 25, 25);
	local wQueen = display.newImageRect("images/w_queen.png", 25, 25);
	local wBishop1 = display.newImageRect("images/w_bishop.png", 25, 25);
	local wBishop2 = display.newImageRect("images/w_bishop.png", 25, 25);
	local wKnight1 = display.newImageRect("images/w_knight.png", 25, 25);
	local wKnight2 = display.newImageRect("images/w_knight.png", 25, 25);
	local wRook1 = display.newImageRect("images/w_rook.png", 25, 25);
	local wRook2 = display.newImageRect("images/w_rook.png", 25, 25);
	local bRook1 = display.newImageRect("images/b_rook.png", 25, 25);
	local bRook2 = display.newImageRect("images/b_rook.png", 25, 25)
	local bKnight1 = display.newImageRect("images/b_knight.png", 25, 25);
	local bKnight2 = display.newImageRect("images/b_knight.png", 25, 25);
	local bBishop1 = display.newImageRect("images/b_bishop.png", 25, 25);
	local bBishop2 = display.newImageRect("images/b_bishop.png", 25, 25);
	local bQueen = display.newImageRect("images/b_queen.png", 25, 25);
	local bKing = display.newImageRect("images/b_king.png", 25, 25);
	local bPawn1 = display.newImageRect("images/b_pawn.png", 25, 25);
	local bPawn2 = display.newImageRect("images/b_pawn.png", 25, 25);
	local bPawn3 = display.newImageRect("images/b_pawn.png", 25, 25);
	local bPawn4 = display.newImageRect("images/b_pawn.png", 25, 25);
	local bPawn5 = display.newImageRect("images/b_pawn.png", 25, 25);
	local bPawn6 = display.newImageRect("images/b_pawn.png", 25, 25);
	local bPawn7 = display.newImageRect("images/b_pawn.png", 25, 25);
	local bPawn8 = display.newImageRect("images/b_pawn.png", 25, 25);
	--add physics to pieces, including "myName" properties for collision later
	physics.addBody(wPawn1, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wPawn2, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wPawn3, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wPawn4, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wPawn5, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wPawn6, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wPawn7, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wPawn8, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wKing, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wQueen, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wBishop1, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wBishop2, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wKnight1, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wKnight2, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wRook1, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(wRook2, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bRook1, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bRook2, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bKnight1, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bKnight2, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bBishop1, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bBishop2, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bQueen, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bKing, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bPawn1, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bPawn2, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bPawn3, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bPawn4, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bPawn5, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bPawn6, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bPawn7, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	physics.addBody(bPawn8, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=10});
	wPawn1.myName = "wPawn1"
	wPawn2.myName = "wPawn2"
	wPawn3.myName = "wPawn3"
	wPawn4.myName = "wPawn4"
	wPawn5.myName = "wPawn5"
	wPawn6.myName = "wPawn6"
	wPawn7.myName = "wPawn7"
	wPawn8.myName = "wPawn8"
	bPawn1.myName = "bPawn1"
	bPawn2.myName = "bPawn2"
	bPawn3.myName = "bPawn3"
	bPawn4.myName = "bPawn4"
	bPawn5.myName = "bPawn5"
	bPawn6.myName = "bPawn6"
	bPawn7.myName = "bPawn7"
	bPawn8.myName = "bPawn8"
	bKing.myName = "bKing"
	wKing.myName = "wKing"
	bQueen.myName = "bQueen"
	wQueen.myName = "wQueen"
	bRook1.myName = "bRook1"
	wRook1.myName = "wRook1"
	bRook2.myName = "bRook2"
	wRook2.myName = "wRook2"
	bBishop1.myName = "bBishop1"
	wBishop1.myName = "wBishop1"
	bBishop2.myName = "bBishop2"
	wBishop2.myName = "wBishop2"
	bKnight1.myName = "bKnight1"
	wKnight1.myName = "wKnight1"
	bKnight2.myName = "bKnight2"
	wKnight2.myName = "wKnight2"
--create grid
lineA = 27.5
lineB = 65
lineC = 102
lineD = 141
lineE = 179
lineF = 218
lineG = 255
lineH = 295
line1 = 108.5
line2 = 146.5
line3 = 183.5
line4 = 221.5
line5 = 259
line6 = 296
line7 = 333
line8 = 370
--top left x-102 y-20
--bottom left x-102 y-299.5
--bottom right x-377 y-299.5
--top right x-377 y-20
--board length x-275
--board length y-279.5
boardC = 275/8
boardR = 279.5/8

	-- Generate pieces onto the board

	wPawn1.x =108.5;
	wPawn1.y =255;
	wPawn2.x =146.5;
	wPawn2.y =255;
	wPawn3.x =183.5;
	wPawn3.y =255;
	wPawn4.x =221.5;
	wPawn4.y =255;
	wPawn5.x =259;
	wPawn5.y =255;
	wPawn6.x =296;
	wPawn6.y =255;
	wPawn7.x =333;
	wPawn7.y =255;
	wPawn8.x =370;
	wPawn8.y =255;
	bPawn1.x =108.5;
	bPawn1.y =65;
	bPawn2.x =146.5;
	bPawn2.y =65;
	bPawn3.x =183.5;
	bPawn3.y =65;
	bPawn4.x =221.5;
	bPawn4.y =65;
	bPawn5.x =259;
	bPawn5.y =65;
	bPawn6.x =296;
	bPawn6.y =65;
	bPawn7.x =333;
	bPawn7.y =65;
	bPawn8.x =370;
	bPawn8.y =65;
	wRook1.x = 108.5;
	wRook1.y = 295;
	wRook2.x = 370;
	wRook2.y = 295;
	bRook1.x = 108.5;
	bRook1.y = 27.5;
	bRook2.x = 370;
	bRook2.y = 27.5;
	wKnight1.x =146.5;
	wKnight1.y =295;
	wKnight2.x =333;
	wKnight2.y =295;
	bKnight1.x =146.5;
	bKnight1.y =27.5;
	bKnight2.x =333;
	bKnight2.y =27.5;
	wBishop1.x =183.5;
	wBishop1.y =295;
	wBishop2.x =296;
	wBishop2.y =295;
	bBishop1.x =183.5;
	bBishop1.y =27.5;
	bBishop2.x =296;
	bBishop2.y =27.5;
	wQueen.x =221.5;
	wQueen.y =295;
	bQueen.x =221.5;
	bQueen.y =27.5;
	wKing.x =259;
	wKing.y =296;
	bKing.x =259;
	bKing.y =27.5;
	--function to move piece when dead
	function pieceCollision(event)
		local moveBack = false
		local reset = false
		function resetPosition(e)
			obj2.x = markX
			obj2.y = markY
		end

		if (event.phase == "began") then
			if currentColour == "black" then
	        	obj1 = event.object1
	        	obj2 = event.object2
	        else
	        	obj1 = event.object2
	        	obj2 = event.object1
	        end
			
        	 if (currentColour == "black" and (obj1.myName == "wPawn1" and obj2.myName == "bPawn1") or (obj1.myName == "wPawn1" and obj2.myName == "bPawn2") or (obj1.myName == "wPawn1" and obj2.myName == "bPawn3") or (obj1.myName == "wPawn1" and obj2.myName == "bPawn4") or (obj1.myName == "wPawn1" and obj2.myName == "bPawn5") or (obj1.myName == "wPawn1" and obj2.myName == "bPawn6") or (obj1.myName == "wPawn1" and obj2.myName == "bPawn7") or (obj1.myName == "wPawn1" and obj2.myName == "bPawn8")  or (obj1.myName == "wPawn1" and obj2.myName == "bQueen") or (obj1.myName == "wPawn1" and obj2.myName == "bRook1") or (obj1.myName == "wPawn1" and obj2.myName == "bRook2") or (obj1.myName == "wPawn1" and obj2.myName == "bKnight1") or (obj1.myName == "wPawn1" and obj2.myName == "bKnight2") or (obj1.myName == "wPawn1" and obj2.myName == "bBishop1") or (obj1.myName == "wPawn1" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wPawn2" and obj2.myName == "bPawn1") or (obj1.myName == "wPawn2" and obj2.myName == "bPawn2") or (obj1.myName == "wPawn2" and obj2.myName == "bPawn3") or (obj1.myName == "wPawn2" and obj2.myName == "bPawn4") or (obj1.myName == "wPawn2" and obj2.myName == "bPawn5") or (obj1.myName == "wPawn2" and obj2.myName == "bPawn6") or (obj1.myName == "wPawn2" and obj2.myName == "bPawn7") or (obj1.myName == "wPawn2" and obj2.myName == "bPawn8")  or (obj1.myName == "wPawn2" and obj2.myName == "bQueen") or (obj1.myName == "wPawn2" and obj2.myName == "bRook1") or (obj1.myName == "wPawn2" and obj2.myName == "bRook2") or (obj1.myName == "wPawn2" and obj2.myName == "bKnight1") or (obj1.myName == "wPawn2" and obj2.myName == "bKnight2") or (obj1.myName == "wPawn2" and obj2.myName == "bBishop1") or (obj1.myName == "wPawn2" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wPawn3" and obj2.myName == "bPawn1") or (obj1.myName == "wPawn3" and obj2.myName == "bPawn2") or (obj1.myName == "wPawn3" and obj2.myName == "bPawn3") or (obj1.myName == "wPawn3" and obj2.myName == "bPawn4") or (obj1.myName == "wPawn3" and obj2.myName == "bPawn5") or (obj1.myName == "wPawn3" and obj2.myName == "bPawn6") or (obj1.myName == "wPawn3" and obj2.myName == "bPawn7") or (obj1.myName == "wPawn3" and obj2.myName == "bPawn8")  or (obj1.myName == "wPawn3" and obj2.myName == "bQueen") or (obj1.myName == "wPawn3" and obj2.myName == "bRook1") or (obj1.myName == "wPawn3" and obj2.myName == "bRook2") or (obj1.myName == "wPawn3" and obj2.myName == "bKnight1") or (obj1.myName == "wPawn3" and obj2.myName == "bKnight2") or (obj1.myName == "wPawn3" and obj2.myName == "bBishop1") or (obj1.myName == "wPawn3" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wPawn4" and obj2.myName == "bPawn1") or (obj1.myName == "wPawn4" and obj2.myName == "bPawn2") or (obj1.myName == "wPawn4" and obj2.myName == "bPawn3") or (obj1.myName == "wPawn4" and obj2.myName == "bPawn4") or (obj1.myName == "wPawn4" and obj2.myName == "bPawn5") or (obj1.myName == "wPawn4" and obj2.myName == "bPawn6") or (obj1.myName == "wPawn4" and obj2.myName == "bPawn7") or (obj1.myName == "wPawn4" and obj2.myName == "bPawn8")  or (obj1.myName == "wPawn4" and obj2.myName == "bQueen") or (obj1.myName == "wPawn4" and obj2.myName == "bRook1") or (obj1.myName == "wPawn4" and obj2.myName == "bRook2") or (obj1.myName == "wPawn4" and obj2.myName == "bKnight1") or (obj1.myName == "wPawn4" and obj2.myName == "bKnight2") or (obj1.myName == "wPawn4" and obj2.myName == "bBishop1") or (obj1.myName == "wPawn4" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wPawn5" and obj2.myName == "bPawn1") or (obj1.myName == "wPawn5" and obj2.myName == "bPawn2") or (obj1.myName == "wPawn5" and obj2.myName == "bPawn3") or (obj1.myName == "wPawn5" and obj2.myName == "bPawn4") or (obj1.myName == "wPawn5" and obj2.myName == "bPawn5") or (obj1.myName == "wPawn5" and obj2.myName == "bPawn6") or (obj1.myName == "wPawn5" and obj2.myName == "bPawn7") or (obj1.myName == "wPawn5" and obj2.myName == "bPawn8")  or (obj1.myName == "wPawn5" and obj2.myName == "bQueen") or (obj1.myName == "wPawn5" and obj2.myName == "bRook1") or (obj1.myName == "wPawn5" and obj2.myName == "bRook2") or (obj1.myName == "wPawn5" and obj2.myName == "bKnight1") or (obj1.myName == "wPawn5" and obj2.myName == "bKnight2") or (obj1.myName == "wPawn5" and obj2.myName == "bBishop1") or (obj1.myName == "wPawn5" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wPawn6" and obj2.myName == "bPawn1") or (obj1.myName == "wPawn6" and obj2.myName == "bPawn2") or (obj1.myName == "wPawn6" and obj2.myName == "bPawn3") or (obj1.myName == "wPawn6" and obj2.myName == "bPawn4") or (obj1.myName == "wPawn6" and obj2.myName == "bPawn5") or (obj1.myName == "wPawn6" and obj2.myName == "bPawn6") or (obj1.myName == "wPawn6" and obj2.myName == "bPawn7") or (obj1.myName == "wPawn6" and obj2.myName == "bPawn8")  or (obj1.myName == "wPawn6" and obj2.myName == "bQueen") or (obj1.myName == "wPawn6" and obj2.myName == "bRook1") or (obj1.myName == "wPawn6" and obj2.myName == "bRook2") or (obj1.myName == "wPawn6" and obj2.myName == "bKnight1") or (obj1.myName == "wPawn6" and obj2.myName == "bKnight2") or (obj1.myName == "wPawn6" and obj2.myName == "bBishop1") or (obj1.myName == "wPawn6" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wPawn7" and obj2.myName == "bPawn1") or (obj1.myName == "wPawn7" and obj2.myName == "bPawn2") or (obj1.myName == "wPawn7" and obj2.myName == "bPawn3") or (obj1.myName == "wPawn7" and obj2.myName == "bPawn4") or (obj1.myName == "wPawn7" and obj2.myName == "bPawn5") or (obj1.myName == "wPawn7" and obj2.myName == "bPawn6") or (obj1.myName == "wPawn7" and obj2.myName == "bPawn7") or (obj1.myName == "wPawn7" and obj2.myName == "bPawn8")  or (obj1.myName == "wPawn7" and obj2.myName == "bQueen") or (obj1.myName == "wPawn7" and obj2.myName == "bRook1") or (obj1.myName == "wPawn7" and obj2.myName == "bRook2") or (obj1.myName == "wPawn7" and obj2.myName == "bKnight1") or (obj1.myName == "wPawn7" and obj2.myName == "bKnight2") or (obj1.myName == "wPawn7" and obj2.myName == "bBishop1") or (obj1.myName == "wPawn7" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wPawn8" and obj2.myName == "bPawn1") or (obj1.myName == "wPawn8" and obj2.myName == "bPawn2") or (obj1.myName == "wPawn8" and obj2.myName == "bPawn3") or (obj1.myName == "wPawn8" and obj2.myName == "bPawn4") or (obj1.myName == "wPawn8" and obj2.myName == "bPawn5") or (obj1.myName == "wPawn8" and obj2.myName == "bPawn6") or (obj1.myName == "wPawn8" and obj2.myName == "bPawn7") or (obj1.myName == "wPawn8" and obj2.myName == "bPawn8")  or (obj1.myName == "wPawn8" and obj2.myName == "bQueen") or (obj1.myName == "wPawn8" and obj2.myName == "bRook1") or (obj1.myName == "wPawn8" and obj2.myName == "bRook2") or (obj1.myName == "wPawn8" and obj2.myName == "bKnight1") or (obj1.myName == "wPawn8" and obj2.myName == "bKnight2") or (obj1.myName == "wPawn8" and obj2.myName == "bBishop1") or (obj1.myName == "wPawn8" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wKing" and obj2.myName == "bPawn1") or (obj1.myName == "wKing" and obj2.myName == "bPawn2") or (obj1.myName == "wKing" and obj2.myName == "bPawn3") or (obj1.myName == "wKing" and obj2.myName == "bPawn4") or (obj1.myName == "wKing" and obj2.myName == "bPawn5") or (obj1.myName == "wKing" and obj2.myName == "bPawn6") or (obj1.myName == "wKing" and obj2.myName == "bPawn7") or (obj1.myName == "wKing" and obj2.myName == "bPawn8") or (obj1.myName == "wKing" and obj2.myName == "bQueen") or (obj1.myName == "wKing" and obj2.myName == "bRook1") or (obj1.myName == "wKing" and obj2.myName == "bRook2") or (obj1.myName == "wKing" and obj2.myName == "bKnight1") or (obj1.myName == "wKing" and obj2.myName == "bKnight2") or (obj1.myName == "wKing" and obj2.myName == "bBishop1") or (obj1.myName == "wKing" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wRook1" and obj2.myName == "bPawn1") or (obj1.myName == "wRook1" and obj2.myName == "bPawn2") or (obj1.myName == "wRook1" and obj2.myName == "bPawn3") or (obj1.myName == "wRook1" and obj2.myName == "bPawn4") or (obj1.myName == "wRook1" and obj2.myName == "bPawn5") or (obj1.myName == "wRook1" and obj2.myName == "bPawn6") or (obj1.myName == "wRook1" and obj2.myName == "bPawn7") or (obj1.myName == "wRook1" and obj2.myName == "bPawn8")  or (obj1.myName == "wRook1" and obj2.myName == "bQueen") or (obj1.myName == "wRook1" and obj2.myName == "bRook1") or (obj1.myName == "wRook1" and obj2.myName == "bRook2") or (obj1.myName == "wRook1" and obj2.myName == "bKnight1") or (obj1.myName == "wRook1" and obj2.myName == "bKnight2") or (obj1.myName == "wRook1" and obj2.myName == "bBishop1") or (obj1.myName == "wRook1" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wRook2" and obj2.myName == "bPawn1") or (obj1.myName == "wRook2" and obj2.myName == "bPawn2") or (obj1.myName == "wRook2" and obj2.myName == "bPawn3") or (obj1.myName == "wRook2" and obj2.myName == "bPawn4") or (obj1.myName == "wRook2" and obj2.myName == "bPawn5") or (obj1.myName == "wRook2" and obj2.myName == "bPawn6") or (obj1.myName == "wRook2" and obj2.myName == "bPawn7") or (obj1.myName == "wRook2" and obj2.myName == "bPawn8")  or (obj1.myName == "wRook2" and obj2.myName == "bQueen") or (obj1.myName == "wRook2" and obj2.myName == "bRook1") or (obj1.myName == "wRook2" and obj2.myName == "bRook2") or (obj1.myName == "wRook2" and obj2.myName == "bKnight1") or (obj1.myName == "wRook2" and obj2.myName == "bKnight2") or (obj1.myName == "wRook2" and obj2.myName == "bBishop1") or (obj1.myName == "wRook2" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wQueen" and obj2.myName == "bPawn1") or (obj1.myName == "wQueen" and obj2.myName == "bPawn2") or (obj1.myName == "wQueen" and obj2.myName == "bPawn3") or (obj1.myName == "wQueen" and obj2.myName == "bPawn4") or (obj1.myName == "wQueen" and obj2.myName == "bPawn5") or (obj1.myName == "wQueen" and obj2.myName == "bPawn6") or (obj1.myName == "wQueen" and obj2.myName == "bPawn7") or (obj1.myName == "wQueen" and obj2.myName == "bPawn8")  or (obj1.myName == "wQueen" and obj2.myName == "bQueen") or (obj1.myName == "wQueen" and obj2.myName == "bRook1") or (obj1.myName == "wQueen" and obj2.myName == "bRook2") or (obj1.myName == "wQueen" and obj2.myName == "bKnight1") or (obj1.myName == "wQueen" and obj2.myName == "bKnight2") or (obj1.myName == "wQueen" and obj2.myName == "bBishop1") or (obj1.myName == "wQueen" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wBishop1" and obj2.myName == "bPawn1") or (obj1.myName == "wBishop1" and obj2.myName == "bPawn2") or (obj1.myName == "wBishop1" and obj2.myName == "bPawn3") or (obj1.myName == "wBishop1" and obj2.myName == "bPawn4") or (obj1.myName == "wBishop1" and obj2.myName == "bPawn5") or (obj1.myName == "wBishop1" and obj2.myName == "bPawn6") or (obj1.myName == "wBishop1" and obj2.myName == "bPawn7") or (obj1.myName == "wBishop1" and obj2.myName == "bPawn8") or (obj1.myName == "wBishop1" and obj2.myName == "bQueen") or (obj1.myName == "wBishop1" and obj2.myName == "bRook1") or (obj1.myName == "wBishop1" and obj2.myName == "bRook2") or (obj1.myName == "wBishop1" and obj2.myName == "bKnight1") or (obj1.myName == "wBishop1" and obj2.myName == "bKnight2") or (obj1.myName == "wBishop1" and obj2.myName == "bBishop1") or (obj1.myName == "wBishop1" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wBishop2" and obj2.myName == "bPawn1") or (obj1.myName == "wBishop2" and obj2.myName == "bPawn2") or (obj1.myName == "wBishop2" and obj2.myName == "bPawn3") or (obj1.myName == "wBishop2" and obj2.myName == "bPawn4") or (obj1.myName == "wBishop2" and obj2.myName == "bPawn5") or (obj1.myName == "wBishop2" and obj2.myName == "bPawn6") or (obj1.myName == "wBishop2" and obj2.myName == "bPawn7") or (obj1.myName == "wBishop2" and obj2.myName == "bPawn8") or (obj1.myName == "wBishop2" and obj2.myName == "bQueen") or (obj1.myName == "wBishop2" and obj2.myName == "bRook1") or (obj1.myName == "wBishop2" and obj2.myName == "bRook2") or (obj1.myName == "wBishop2" and obj2.myName == "bKnight1") or (obj1.myName == "wBishop2" and obj2.myName == "bKnight2") or (obj1.myName == "wBishop2" and obj2.myName == "bBishop1") or (obj1.myName == "wBishop2" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wKnight1" and obj2.myName == "bPawn1") or (obj1.myName == "wKnight1" and obj2.myName == "bPawn2") or (obj1.myName == "wKnight1" and obj2.myName == "bPawn3") or (obj1.myName == "wKnight1" and obj2.myName == "bPawn4") or (obj1.myName == "wKnight1" and obj2.myName == "bPawn5") or (obj1.myName == "wKnight1" and obj2.myName == "bPawn6") or (obj1.myName == "wKnight1" and obj2.myName == "bPawn7") or (obj1.myName == "wKnight1" and obj2.myName == "bPawn8") or (obj1.myName == "wKnight1" and obj2.myName == "bQueen") or (obj1.myName == "wKnight1" and obj2.myName == "bRook1") or (obj1.myName == "wKnight1" and obj2.myName == "bRook2") or (obj1.myName == "wKnight1" and obj2.myName == "bKnight1") or (obj1.myName == "wKnight1" and obj2.myName == "bKnight2") or (obj1.myName == "wKnight1" and obj2.myName == "bBishop1") or (obj1.myName == "wKnight1" and obj2.myName == "bBishop2")
        	  or (obj1.myName == "wKnight2" and obj2.myName == "bPawn1") or (obj1.myName == "wKnight2" and obj2.myName == "bPawn2") or (obj1.myName == "wKnight2" and obj2.myName == "bPawn3") or (obj1.myName == "wKnight2" and obj2.myName == "bPawn4") or (obj1.myName == "wKnight2" and obj2.myName == "bPawn5") or (obj1.myName == "wKnight2" and obj2.myName == "bPawn6") or (obj1.myName == "wKnight2" and obj2.myName == "bPawn7") or (obj1.myName == "wKnight2" and obj2.myName == "bPawn8") or (obj1.myName == "wKnight2" and obj2.myName == "bQueen") or (obj1.myName == "wKnight2" and obj2.myName == "bRook1") or (obj1.myName == "wKnight2" and obj2.myName == "bRook2") or (obj1.myName == "wKnight2" and obj2.myName == "bKnight1") or (obj1.myName == "wKnight2" and obj2.myName == "bKnight2") or (obj1.myName == "wKnight2" and obj2.myName == "bBishop1") or (obj1.myName == "wKnight2" and obj2.myName == "bBishop2"))
       		 then
            -- Remove hit piece
           		display.remove(obj1)
             elseif(currentColour == "white" and (obj1.myName == "bPawn1" and obj2.myName == "wPawn1") or (obj1.myName == "bPawn1" and obj2.myName == "wPawn2") or (obj1.myName == "bPawn1" and obj2.myName == "wPawn3") or (obj1.myName == "bPawn1" and obj2.myName == "wPawn4") or (obj1.myName == "bPawn1" and obj2.myName == "wPawn5") or (obj1.myName == "bPawn1" and obj2.myName == "wPawn6") or (obj1.myName == "bPawn1" and obj2.myName == "wPawn7") or (obj1.myName == "bPawn1" and obj2.myName == "wPawn8") or (obj1.myName == "bPawn1" and obj2.myName == "wQueen") or (obj1.myName == "bPawn1" and obj2.myName == "wRook1") or (obj1.myName == "bPawn1" and obj2.myName == "wRook2") or (obj1.myName == "bPawn1" and obj2.myName == "wKnight1") or (obj1.myName == "bPawn1" and obj2.myName == "wKnight2") or (obj1.myName == "bPawn1" and obj2.myName == "wBishop1") or (obj1.myName == "bPawn1" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bPawn2" and obj2.myName == "wPawn1") or (obj1.myName == "bPawn2" and obj2.myName == "wPawn2") or (obj1.myName == "bPawn2" and obj2.myName == "wPawn3") or (obj1.myName == "bPawn2" and obj2.myName == "wPawn4") or (obj1.myName == "bPawn2" and obj2.myName == "wPawn5") or (obj1.myName == "bPawn2" and obj2.myName == "wPawn6") or (obj1.myName == "bPawn2" and obj2.myName == "wPawn7") or (obj1.myName == "bPawn2" and obj2.myName == "wPawn8") or (obj1.myName == "bPawn2" and obj2.myName == "wQueen") or (obj1.myName == "bPawn2" and obj2.myName == "wRook1") or (obj1.myName == "bPawn2" and obj2.myName == "wRook2") or (obj1.myName == "bPawn2" and obj2.myName == "wKnight1") or (obj1.myName == "bPawn2" and obj2.myName == "wKnight2") or (obj1.myName == "bPawn2" and obj2.myName == "wBishop1") or (obj1.myName == "bPawn2" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bPawn3" and obj2.myName == "wPawn1") or (obj1.myName == "bPawn3" and obj2.myName == "wPawn2") or (obj1.myName == "bPawn3" and obj2.myName == "wPawn3") or (obj1.myName == "bPawn3" and obj2.myName == "wPawn4") or (obj1.myName == "bPawn3" and obj2.myName == "wPawn5") or (obj1.myName == "bPawn3" and obj2.myName == "wPawn6") or (obj1.myName == "bPawn3" and obj2.myName == "wPawn7") or (obj1.myName == "bPawn3" and obj2.myName == "wPawn8") or (obj1.myName == "bPawn3" and obj2.myName == "wQueen") or (obj1.myName == "bPawn3" and obj2.myName == "wRook1") or (obj1.myName == "bPawn3" and obj2.myName == "wRook2") or (obj1.myName == "bPawn3" and obj2.myName == "wKnight1") or (obj1.myName == "bPawn3" and obj2.myName == "wKnight2") or (obj1.myName == "bPawn3" and obj2.myName == "wBishop1") or (obj1.myName == "bPawn3" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bPawn4" and obj2.myName == "wPawn1") or (obj1.myName == "bPawn4" and obj2.myName == "wPawn2") or (obj1.myName == "bPawn4" and obj2.myName == "wPawn3") or (obj1.myName == "bPawn4" and obj2.myName == "wPawn4") or (obj1.myName == "bPawn4" and obj2.myName == "wPawn5") or (obj1.myName == "bPawn4" and obj2.myName == "wPawn6") or (obj1.myName == "bPawn4" and obj2.myName == "wPawn7") or (obj1.myName == "bPawn4" and obj2.myName == "wPawn8") or (obj1.myName == "bPawn4" and obj2.myName == "wQueen") or (obj1.myName == "bPawn4" and obj2.myName == "wRook1") or (obj1.myName == "bPawn4" and obj2.myName == "wRook2") or (obj1.myName == "bPawn4" and obj2.myName == "wKnight1") or (obj1.myName == "bPawn4" and obj2.myName == "wKnight2") or (obj1.myName == "bPawn4" and obj2.myName == "wBishop1") or (obj1.myName == "bPawn4" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bPawn5" and obj2.myName == "wPawn1") or (obj1.myName == "bPawn5" and obj2.myName == "wPawn2") or (obj1.myName == "bPawn5" and obj2.myName == "wPawn3") or (obj1.myName == "bPawn5" and obj2.myName == "wPawn4") or (obj1.myName == "bPawn5" and obj2.myName == "wPawn5") or (obj1.myName == "bPawn5" and obj2.myName == "wPawn6") or (obj1.myName == "bPawn5" and obj2.myName == "wPawn7") or (obj1.myName == "bPawn5" and obj2.myName == "wPawn8") or (obj1.myName == "bPawn5" and obj2.myName == "wQueen") or (obj1.myName == "bPawn5" and obj2.myName == "wRook1") or (obj1.myName == "bPawn5" and obj2.myName == "wRook2") or (obj1.myName == "bPawn5" and obj2.myName == "wKnight1") or (obj1.myName == "bPawn5" and obj2.myName == "wKnight2") or (obj1.myName == "bPawn5" and obj2.myName == "wBishop1") or (obj1.myName == "bPawn5" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bPawn6" and obj2.myName == "wPawn1") or (obj1.myName == "bPawn6" and obj2.myName == "wPawn2") or (obj1.myName == "bPawn6" and obj2.myName == "wPawn3") or (obj1.myName == "bPawn6" and obj2.myName == "wPawn4") or (obj1.myName == "bPawn6" and obj2.myName == "wPawn5") or (obj1.myName == "bPawn6" and obj2.myName == "wPawn6") or (obj1.myName == "bPawn6" and obj2.myName == "wPawn7") or (obj1.myName == "bPawn6" and obj2.myName == "wPawn8") or (obj1.myName == "bPawn6" and obj2.myName == "wQueen") or (obj1.myName == "bPawn6" and obj2.myName == "wRook1") or (obj1.myName == "bPawn6" and obj2.myName == "wRook2") or (obj1.myName == "bPawn6" and obj2.myName == "wKnight1") or (obj1.myName == "bPawn6" and obj2.myName == "wKnight2") or (obj1.myName == "bPawn6" and obj2.myName == "wBishop1") or (obj1.myName == "bPawn6" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bPawn7" and obj2.myName == "wPawn1") or (obj1.myName == "bPawn7" and obj2.myName == "wPawn2") or (obj1.myName == "bPawn7" and obj2.myName == "wPawn3") or (obj1.myName == "bPawn7" and obj2.myName == "wPawn4") or (obj1.myName == "bPawn7" and obj2.myName == "wPawn5") or (obj1.myName == "bPawn7" and obj2.myName == "wPawn6") or (obj1.myName == "bPawn7" and obj2.myName == "wPawn7") or (obj1.myName == "bPawn7" and obj2.myName == "wPawn8") or (obj1.myName == "bPawn7" and obj2.myName == "wQueen") or (obj1.myName == "bPawn7" and obj2.myName == "wRook1") or (obj1.myName == "bPawn7" and obj2.myName == "wRook2") or (obj1.myName == "bPawn7" and obj2.myName == "wKnight1") or (obj1.myName == "bPawn7" and obj2.myName == "wKnight2") or (obj1.myName == "bPawn7" and obj2.myName == "wBishop1") or (obj1.myName == "bPawn7" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bPawn8" and obj2.myName == "wPawn1") or (obj1.myName == "bPawn8" and obj2.myName == "wPawn2") or (obj1.myName == "bPawn8" and obj2.myName == "wPawn3") or (obj1.myName == "bPawn8" and obj2.myName == "wPawn4") or (obj1.myName == "bPawn8" and obj2.myName == "wPawn5") or (obj1.myName == "bPawn8" and obj2.myName == "wPawn6") or (obj1.myName == "bPawn8" and obj2.myName == "wPawn7") or (obj1.myName == "bPawn8" and obj2.myName == "wPawn8") or (obj1.myName == "bPawn8" and obj2.myName == "wQueen") or (obj1.myName == "bPawn8" and obj2.myName == "wRook1") or (obj1.myName == "bPawn8" and obj2.myName == "wRook2") or (obj1.myName == "bPawn8" and obj2.myName == "wKnight1") or (obj1.myName == "bPawn8" and obj2.myName == "wKnight2") or (obj1.myName == "bPawn8" and obj2.myName == "wBishop1") or (obj1.myName == "bPawn8" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bKing" and obj2.myName == "wPawn1") or (obj1.myName == "bKing" and obj2.myName == "wPawn2") or (obj1.myName == "bKing" and obj2.myName == "wPawn3") or (obj1.myName == "bKing" and obj2.myName == "wPawn4") or (obj1.myName == "bKing" and obj2.myName == "wPawn5") or (obj1.myName == "bKing" and obj2.myName == "wPawn6") or (obj1.myName == "bKing" and obj2.myName == "wPawn7") or (obj1.myName == "bKing" and obj2.myName == "wPawn8") or (obj1.myName == "bKing" and obj2.myName == "wQueen") or (obj1.myName == "bKing" and obj2.myName == "wRook1") or (obj1.myName == "bKing" and obj2.myName == "wRook2") or (obj1.myName == "bKing" and obj2.myName == "wKnight1") or (obj1.myName == "bKing" and obj2.myName == "wKnight2") or (obj1.myName == "bKing" and obj2.myName == "wBishop1") or (obj1.myName == "bKing" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bRook1" and obj2.myName == "wPawn1") or (obj1.myName == "bRook1" and obj2.myName == "wPawn2") or (obj1.myName == "bRook1" and obj2.myName == "wPawn3") or (obj1.myName == "bRook1" and obj2.myName == "wPawn4") or (obj1.myName == "bRook1" and obj2.myName == "wPawn5") or (obj1.myName == "bRook1" and obj2.myName == "wPawn6") or (obj1.myName == "bRook1" and obj2.myName == "wPawn7") or (obj1.myName == "bRook1" and obj2.myName == "wPawn8") or (obj1.myName == "bRook1" and obj2.myName == "wQueen") or (obj1.myName == "bRook1" and obj2.myName == "wRook1") or (obj1.myName == "bRook1" and obj2.myName == "wRook2") or (obj1.myName == "bRook1" and obj2.myName == "wKnight1") or (obj1.myName == "bRook1" and obj2.myName == "wKnight2") or (obj1.myName == "bRook1" and obj2.myName == "wBishop1") or (obj1.myName == "bRook1" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bRook2" and obj2.myName == "wPawn1") or (obj1.myName == "bRook2" and obj2.myName == "wPawn2") or (obj1.myName == "bRook2" and obj2.myName == "wPawn3") or (obj1.myName == "bRook2" and obj2.myName == "wPawn4") or (obj1.myName == "bRook2" and obj2.myName == "wPawn5") or (obj1.myName == "bRook2" and obj2.myName == "wPawn6") or (obj1.myName == "bRook2" and obj2.myName == "wPawn7") or (obj1.myName == "bRook2" and obj2.myName == "wPawn8") or (obj1.myName == "bRook2" and obj2.myName == "wQueen") or (obj1.myName == "bRook2" and obj2.myName == "wRook1") or (obj1.myName == "bRook2" and obj2.myName == "wRook2") or (obj1.myName == "bRook2" and obj2.myName == "wKnight1") or (obj1.myName == "bRook2" and obj2.myName == "wKnight2") or (obj1.myName == "bRook2" and obj2.myName == "wBishop1") or (obj1.myName == "bRook2" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bQueen" and obj2.myName == "wPawn1") or (obj1.myName == "bQueen" and obj2.myName == "wPawn2") or (obj1.myName == "bQueen" and obj2.myName == "wPawn3") or (obj1.myName == "bQueen" and obj2.myName == "wPawn4") or (obj1.myName == "bQueen" and obj2.myName == "wPawn5") or (obj1.myName == "bQueen" and obj2.myName == "wPawn6") or (obj1.myName == "bQueen" and obj2.myName == "wPawn7") or (obj1.myName == "bQueen" and obj2.myName == "wPawn8") or (obj1.myName == "bQueen" and obj2.myName == "wQueen") or (obj1.myName == "bQueen" and obj2.myName == "wRook1") or (obj1.myName == "bQueen" and obj2.myName == "wRook2") or (obj1.myName == "bQueen" and obj2.myName == "wKnight1") or (obj1.myName == "bQueen" and obj2.myName == "wKnight2") or (obj1.myName == "bQueen" and obj2.myName == "wBishop1") or (obj1.myName == "bQueen" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bBishop1" and obj2.myName == "wPawn1") or (obj1.myName == "bBishop1" and obj2.myName == "wPawn2") or (obj1.myName == "bBishop1" and obj2.myName == "wPawn3") or (obj1.myName == "bBishop1" and obj2.myName == "wPawn4") or (obj1.myName == "bBishop1" and obj2.myName == "wPawn5") or (obj1.myName == "bBishop1" and obj2.myName == "wPawn6") or (obj1.myName == "bBishop1" and obj2.myName == "wPawn7") or (obj1.myName == "bBishop1" and obj2.myName == "wPawn8") or (obj1.myName == "bBishop1" and obj2.myName == "wQueen") or (obj1.myName == "bBishop1" and obj2.myName == "wRook1") or (obj1.myName == "bBishop1" and obj2.myName == "wRook2") or (obj1.myName == "bBishop1" and obj2.myName == "wKnight1") or (obj1.myName == "bBishop1" and obj2.myName == "wKnight2") or (obj1.myName == "bBishop1" and obj2.myName == "wBishop1") or (obj1.myName == "bBishop1" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bBishop2" and obj2.myName == "wPawn1") or (obj1.myName == "bBishop2" and obj2.myName == "wPawn2") or (obj1.myName == "bBishop2" and obj2.myName == "wPawn3") or (obj1.myName == "bBishop2" and obj2.myName == "wPawn4") or (obj1.myName == "bBishop2" and obj2.myName == "wPawn5") or (obj1.myName == "bBishop2" and obj2.myName == "wPawn6") or (obj1.myName == "bBishop2" and obj2.myName == "wPawn7") or (obj1.myName == "bBishop2" and obj2.myName == "wPawn8") or (obj1.myName == "bBishop2" and obj2.myName == "wQueen") or (obj1.myName == "bBishop2" and obj2.myName == "wRook1") or (obj1.myName == "bBishop2" and obj2.myName == "wRook2") or (obj1.myName == "bBishop2" and obj2.myName == "wKnight1") or (obj1.myName == "bBishop2" and obj2.myName == "wKnight2") or (obj1.myName == "bBishop2" and obj2.myName == "wBishop1") or (obj1.myName == "bBishop2" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bKnight1" and obj2.myName == "wPawn1") or (obj1.myName == "bKnight1" and obj2.myName == "wPawn2") or (obj1.myName == "bKnight1" and obj2.myName == "wPawn3") or (obj1.myName == "bKnight1" and obj2.myName == "wPawn4") or (obj1.myName == "bKnight1" and obj2.myName == "wPawn5") or (obj1.myName == "bKnight1" and obj2.myName == "wPawn6") or (obj1.myName == "bKnight1" and obj2.myName == "wPawn7") or (obj1.myName == "bKnight1" and obj2.myName == "wPawn8") or (obj1.myName == "bKnight1" and obj2.myName == "wQueen") or (obj1.myName == "bKnight1" and obj2.myName == "wRook1") or (obj1.myName == "bKnight1" and obj2.myName == "wRook2") or (obj1.myName == "bKnight1" and obj2.myName == "wKnight1") or (obj1.myName == "bKnight1" and obj2.myName == "wKnight2") or (obj1.myName == "bKnight1" and obj2.myName == "wBishop1") or (obj1.myName == "bKnight1" and obj2.myName == "wBishop2")
        	  or (obj1.myName == "bKnight2" and obj2.myName == "wPawn1") or (obj1.myName == "bKnight2" and obj2.myName == "wPawn2") or (obj1.myName == "bKnight2" and obj2.myName == "wPawn3") or (obj1.myName == "bKnight2" and obj2.myName == "wPawn4") or (obj1.myName == "bKnight2" and obj2.myName == "wPawn5") or (obj1.myName == "bKnight2" and obj2.myName == "wPawn6") or (obj1.myName == "bKnight2" and obj2.myName == "wPawn7") or (obj1.myName == "bKnight2" and obj2.myName == "wPawn8") or (obj1.myName == "bKnight2" and obj2.myName == "wQueen") or (obj1.myName == "bKnight2" and obj2.myName == "wRook1") or (obj1.myName == "bKnight2" and obj2.myName == "wRook2") or (obj1.myName == "bKnight2" and obj2.myName == "wKnight1") or (obj1.myName == "bKnight2" and obj2.myName == "wKnight2") or (obj1.myName == "bKnight2" and obj2.myName == "wBishop1") or (obj1.myName == "bKnight2" and obj2.myName == "wBishop2"))
			then
           		display.remove(obj1)
           	elseif(currentColour == "black" and (obj1.myName == "wPawn1" and obj2.myName == "wPawn1") or (obj1.myName == "wPawn1" and obj2.myName == "wPawn2") or (obj1.myName == "wPawn1" and obj2.myName == "wPawn3") or (obj1.myName == "wPawn1" and obj2.myName == "wPawn4") or (obj1.myName == "wPawn1" and obj2.myName == "wPawn5") or (obj1.myName == "wPawn1" and obj2.myName == "wPawn6") or (obj1.myName == "wPawn1" and obj2.myName == "wPawn7") or (obj1.myName == "wPawn1" and obj2.myName == "wPawn8") or (obj1.myName == "wPawn1" and obj2.myName == "wKing") or (obj1.myName == "wPawn1" and obj2.myName == "wQueen") or (obj1.myName == "wPawn1" and obj2.myName == "wRook1") or (obj1.myName == "wPawn1" and obj2.myName == "wRook2") or (obj1.myName == "wPawn1" and obj2.myName == "wKnight1") or (obj1.myName == "wPawn1" and obj2.myName == "wKnight2") or (obj1.myName == "wPawn1" and obj2.myName == "wBishop1") or (obj1.myName == "wPawn1" and obj2.myName == "wBishop2")
				or (obj1.myName == "wPawn2" and obj2.myName == "wPawn1") or (obj1.myName == "wPawn2" and obj2.myName == "wPawn2") or (obj1.myName == "wPawn2" and obj2.myName == "wPawn3") or (obj1.myName == "wPawn2" and obj2.myName == "wPawn4") or (obj1.myName == "wPawn2" and obj2.myName == "wPawn5") or (obj1.myName == "wPawn2" and obj2.myName == "wPawn6") or (obj1.myName == "wPawn2" and obj2.myName == "wPawn7") or (obj1.myName == "wPawn2" and obj2.myName == "wPawn8") or (obj1.myName == "wPawn2" and obj2.myName == "wKing") or (obj1.myName == "wPawn2" and obj2.myName == "wQueen") or (obj1.myName == "wPawn2" and obj2.myName == "wRook1") or (obj1.myName == "wPawn2" and obj2.myName == "wRook2") or (obj1.myName == "wPawn2" and obj2.myName == "wKnight1") or (obj1.myName == "wPawn2" and obj2.myName == "wKnight2") or (obj1.myName == "wPawn2" and obj2.myName == "wBishop1") or (obj1.myName == "wPawn2" and obj2.myName == "wBishop2")
				or (obj1.myName == "wPawn3" and obj2.myName == "wPawn1") or (obj1.myName == "wPawn3" and obj2.myName == "wPawn2") or (obj1.myName == "wPawn3" and obj2.myName == "wPawn3") or (obj1.myName == "wPawn3" and obj2.myName == "wPawn4") or (obj1.myName == "wPawn3" and obj2.myName == "wPawn5") or (obj1.myName == "wPawn3" and obj2.myName == "wPawn6") or (obj1.myName == "wPawn3" and obj2.myName == "wPawn7") or (obj1.myName == "wPawn3" and obj2.myName == "wPawn8") or (obj1.myName == "wPawn3" and obj2.myName == "wKing") or (obj1.myName == "wPawn3" and obj2.myName == "wQueen") or (obj1.myName == "wPawn3" and obj2.myName == "wRook1") or (obj1.myName == "wPawn3" and obj2.myName == "wRook2") or (obj1.myName == "wPawn3" and obj2.myName == "wKnight1") or (obj1.myName == "wPawn3" and obj2.myName == "wKnight2") or (obj1.myName == "wPawn3" and obj2.myName == "wBishop1") or (obj1.myName == "wPawn3" and obj2.myName == "wBishop2")
				or (obj1.myName == "wPawn4" and obj2.myName == "wPawn1") or (obj1.myName == "wPawn4" and obj2.myName == "wPawn2") or (obj1.myName == "wPawn4" and obj2.myName == "wPawn3") or (obj1.myName == "wPawn4" and obj2.myName == "wPawn4") or (obj1.myName == "wPawn4" and obj2.myName == "wPawn5") or (obj1.myName == "wPawn4" and obj2.myName == "wPawn6") or (obj1.myName == "wPawn4" and obj2.myName == "wPawn7") or (obj1.myName == "wPawn4" and obj2.myName == "wPawn8") or (obj1.myName == "wPawn4" and obj2.myName == "wKing") or (obj1.myName == "wPawn4" and obj2.myName == "wQueen") or (obj1.myName == "wPawn4" and obj2.myName == "wRook1") or (obj1.myName == "wPawn4" and obj2.myName == "wRook2") or (obj1.myName == "wPawn4" and obj2.myName == "wKnight1") or (obj1.myName == "wPawn4" and obj2.myName == "wKnight2") or (obj1.myName == "wPawn4" and obj2.myName == "wBishop1") or (obj1.myName == "wPawn4" and obj2.myName == "wBishop2")
				or (obj1.myName == "wPawn5" and obj2.myName == "wPawn1") or (obj1.myName == "wPawn5" and obj2.myName == "wPawn2") or (obj1.myName == "wPawn5" and obj2.myName == "wPawn3") or (obj1.myName == "wPawn5" and obj2.myName == "wPawn4") or (obj1.myName == "wPawn5" and obj2.myName == "wPawn5") or (obj1.myName == "wPawn5" and obj2.myName == "wPawn6") or (obj1.myName == "wPawn5" and obj2.myName == "wPawn7") or (obj1.myName == "wPawn5" and obj2.myName == "wPawn8") or (obj1.myName == "wPawn5" and obj2.myName == "wKing") or (obj1.myName == "wPawn5" and obj2.myName == "wQueen") or (obj1.myName == "wPawn5" and obj2.myName == "wRook1") or (obj1.myName == "wPawn5" and obj2.myName == "wRook2") or (obj1.myName == "wPawn5" and obj2.myName == "wKnight1") or (obj1.myName == "wPawn5" and obj2.myName == "wKnight2") or (obj1.myName == "wPawn5" and obj2.myName == "wBishop1") or (obj1.myName == "wPawn5" and obj2.myName == "wBishop2")
				or (obj1.myName == "wPawn6" and obj2.myName == "wPawn1") or (obj1.myName == "wPawn6" and obj2.myName == "wPawn2") or (obj1.myName == "wPawn6" and obj2.myName == "wPawn3") or (obj1.myName == "wPawn6" and obj2.myName == "wPawn4") or (obj1.myName == "wPawn6" and obj2.myName == "wPawn5") or (obj1.myName == "wPawn6" and obj2.myName == "wPawn6") or (obj1.myName == "wPawn6" and obj2.myName == "wPawn7") or (obj1.myName == "wPawn6" and obj2.myName == "wPawn8") or (obj1.myName == "wPawn6" and obj2.myName == "wKing") or (obj1.myName == "wPawn6" and obj2.myName == "wQueen") or (obj1.myName == "wPawn6" and obj2.myName == "wRook1") or (obj1.myName == "wPawn6" and obj2.myName == "wRook2") or (obj1.myName == "wPawn6" and obj2.myName == "wKnight1") or (obj1.myName == "wPawn6" and obj2.myName == "wKnight2") or (obj1.myName == "wPawn6" and obj2.myName == "wBishop1") or (obj1.myName == "wPawn6" and obj2.myName == "wBishop2")
				or (obj1.myName == "wPawn7" and obj2.myName == "wPawn1") or (obj1.myName == "wPawn7" and obj2.myName == "wPawn2") or (obj1.myName == "wPawn7" and obj2.myName == "wPawn3") or (obj1.myName == "wPawn7" and obj2.myName == "wPawn4") or (obj1.myName == "wPawn7" and obj2.myName == "wPawn5") or (obj1.myName == "wPawn7" and obj2.myName == "wPawn6") or (obj1.myName == "wPawn7" and obj2.myName == "wPawn7") or (obj1.myName == "wPawn7" and obj2.myName == "wPawn8") or (obj1.myName == "wPawn7" and obj2.myName == "wKing") or (obj1.myName == "wPawn7" and obj2.myName == "wQueen") or (obj1.myName == "wPawn7" and obj2.myName == "wRook1") or (obj1.myName == "wPawn7" and obj2.myName == "wRook2") or (obj1.myName == "wPawn7" and obj2.myName == "wKnight1") or (obj1.myName == "wPawn7" and obj2.myName == "wKnight2") or (obj1.myName == "wPawn7" and obj2.myName == "wBishop1") or (obj1.myName == "wPawn7" and obj2.myName == "wBishop2")
				or (obj1.myName == "wPawn8" and obj2.myName == "wPawn1") or (obj1.myName == "wPawn8" and obj2.myName == "wPawn2") or (obj1.myName == "wPawn8" and obj2.myName == "wPawn3") or (obj1.myName == "wPawn8" and obj2.myName == "wPawn4") or (obj1.myName == "wPawn8" and obj2.myName == "wPawn5") or (obj1.myName == "wPawn8" and obj2.myName == "wPawn6") or (obj1.myName == "wPawn8" and obj2.myName == "wPawn7") or (obj1.myName == "wPawn8" and obj2.myName == "wPawn8") or (obj1.myName == "wPawn8" and obj2.myName == "wKing") or (obj1.myName == "wPawn8" and obj2.myName == "wQueen") or (obj1.myName == "wPawn8" and obj2.myName == "wRook1") or (obj1.myName == "wPawn8" and obj2.myName == "wRook2") or (obj1.myName == "wPawn8" and obj2.myName == "wKnight1") or (obj1.myName == "wPawn8" and obj2.myName == "wKnight2") or (obj1.myName == "wPawn8" and obj2.myName == "wBishop1") or (obj1.myName == "wPawn8" and obj2.myName == "wBishop2")
				or (obj1.myName == "wKing" and obj2.myName == "wPawn1") or (obj1.myName == "wKing" and obj2.myName == "wPawn2") or (obj1.myName == "wKing" and obj2.myName == "wPawn3") or (obj1.myName == "wKing" and obj2.myName == "wPawn4") or (obj1.myName == "wKing" and obj2.myName == "wPawn5") or (obj1.myName == "wKing" and obj2.myName == "wPawn6") or (obj1.myName == "wKing" and obj2.myName == "wPawn7") or (obj1.myName == "wKing" and obj2.myName == "wPawn8") or (obj1.myName == "wKing" and obj2.myName == "wKing") or (obj1.myName == "wKing" and obj2.myName == "wQueen") or (obj1.myName == "wKing" and obj2.myName == "wRook1") or (obj1.myName == "wKing" and obj2.myName == "wRook2") or (obj1.myName == "wKing" and obj2.myName == "wKnight1") or (obj1.myName == "wKing" and obj2.myName == "wKnight2") or (obj1.myName == "wKing" and obj2.myName == "wBishop1") or (obj1.myName == "wKing" and obj2.myName == "wBishop2")
				or (obj1.myName == "wRook1" and obj2.myName == "wPawn1") or (obj1.myName == "wRook1" and obj2.myName == "wPawn2") or (obj1.myName == "wRook1" and obj2.myName == "wPawn3") or (obj1.myName == "wRook1" and obj2.myName == "wPawn4") or (obj1.myName == "wRook1" and obj2.myName == "wPawn5") or (obj1.myName == "wRook1" and obj2.myName == "wPawn6") or (obj1.myName == "wRook1" and obj2.myName == "wPawn7") or (obj1.myName == "wRook1" and obj2.myName == "wPawn8") or (obj1.myName == "wRook1" and obj2.myName == "wKing") or (obj1.myName == "wRook1" and obj2.myName == "wQueen") or (obj1.myName == "wRook1" and obj2.myName == "wRook1") or (obj1.myName == "wRook1" and obj2.myName == "wRook2") or (obj1.myName == "wRook1" and obj2.myName == "wKnight1") or (obj1.myName == "wRook1" and obj2.myName == "wKnight2") or (obj1.myName == "wRook1" and obj2.myName == "wBishop1") or (obj1.myName == "wRook1" and obj2.myName == "wBishop2")
				or (obj1.myName == "wRook2" and obj2.myName == "wPawn1") or (obj1.myName == "wRook2" and obj2.myName == "wPawn2") or (obj1.myName == "wRook2" and obj2.myName == "wPawn3") or (obj1.myName == "wRook2" and obj2.myName == "wPawn4") or (obj1.myName == "wRook2" and obj2.myName == "wPawn5") or (obj1.myName == "wRook2" and obj2.myName == "wPawn6") or (obj1.myName == "wRook2" and obj2.myName == "wPawn7") or (obj1.myName == "wRook2" and obj2.myName == "wPawn8") or (obj1.myName == "wRook2" and obj2.myName == "wKing") or (obj1.myName == "wRook2" and obj2.myName == "wQueen") or (obj1.myName == "wRook2" and obj2.myName == "wRook1") or (obj1.myName == "wRook2" and obj2.myName == "wRook2") or (obj1.myName == "wRook2" and obj2.myName == "wKnight1") or (obj1.myName == "wRook2" and obj2.myName == "wKnight2") or (obj1.myName == "wRook2" and obj2.myName == "wBishop1") or (obj1.myName == "wRook2" and obj2.myName == "wBishop2")
				or (obj1.myName == "wQueen" and obj2.myName == "wPawn1") or (obj1.myName == "wQueen" and obj2.myName == "wPawn2") or (obj1.myName == "wQueen" and obj2.myName == "wPawn3") or (obj1.myName == "wQueen" and obj2.myName == "wPawn4") or (obj1.myName == "wQueen" and obj2.myName == "wPawn5") or (obj1.myName == "wQueen" and obj2.myName == "wPawn6") or (obj1.myName == "wQueen" and obj2.myName == "wPawn7") or (obj1.myName == "wQueen" and obj2.myName == "wPawn8") or (obj1.myName == "wQueen" and obj2.myName == "wKing") or (obj1.myName == "wQueen" and obj2.myName == "wQueen") or (obj1.myName == "wQueen" and obj2.myName == "wRook1") or (obj1.myName == "wQueen" and obj2.myName == "wRook2") or (obj1.myName == "wQueen" and obj2.myName == "wKnight1") or (obj1.myName == "wQueen" and obj2.myName == "wKnight2") or (obj1.myName == "wQueen" and obj2.myName == "wBishop1") or (obj1.myName == "wQueen" and obj2.myName == "wBishop2")
				or (obj1.myName == "wBishop1" and obj2.myName == "wPawn1") or (obj1.myName == "wBishop1" and obj2.myName == "wPawn2") or (obj1.myName == "wBishop1" and obj2.myName == "wPawn3") or (obj1.myName == "wBishop1" and obj2.myName == "wPawn4") or (obj1.myName == "wBishop1" and obj2.myName == "wPawn5") or (obj1.myName == "wBishop1" and obj2.myName == "wPawn6") or (obj1.myName == "wBishop1" and obj2.myName == "wPawn7") or (obj1.myName == "wBishop1" and obj2.myName == "wPawn8") or (obj1.myName == "wBishop1" and obj2.myName == "wKing") or (obj1.myName == "wBishop1" and obj2.myName == "wQueen") or (obj1.myName == "wBishop1" and obj2.myName == "wRook1") or (obj1.myName == "wBishop1" and obj2.myName == "wRook2") or (obj1.myName == "wBishop1" and obj2.myName == "wKnight1") or (obj1.myName == "wBishop1" and obj2.myName == "wKnight2") or (obj1.myName == "wBishop1" and obj2.myName == "wBishop1") or (obj1.myName == "wBishop1" and obj2.myName == "wBishop2")
				or (obj1.myName == "wBishop2" and obj2.myName == "wPawn1") or (obj1.myName == "wBishop2" and obj2.myName == "wPawn2") or (obj1.myName == "wBishop2" and obj2.myName == "wPawn3") or (obj1.myName == "wBishop2" and obj2.myName == "wPawn4") or (obj1.myName == "wBishop2" and obj2.myName == "wPawn5") or (obj1.myName == "wBishop2" and obj2.myName == "wPawn6") or (obj1.myName == "wBishop2" and obj2.myName == "wPawn7") or (obj1.myName == "wBishop2" and obj2.myName == "wPawn8") or (obj1.myName == "wBishop2" and obj2.myName == "wKing") or (obj1.myName == "wBishop2" and obj2.myName == "wQueen") or (obj1.myName == "wBishop2" and obj2.myName == "wRook1") or (obj1.myName == "wBishop2" and obj2.myName == "wRook2") or (obj1.myName == "wBishop2" and obj2.myName == "wKnight1") or (obj1.myName == "wBishop2" and obj2.myName == "wKnight2") or (obj1.myName == "wBishop2" and obj2.myName == "wBishop1") or (obj1.myName == "wBishop2" and obj2.myName == "wBishop2")
				or (obj1.myName == "wKnight1" and obj2.myName == "wPawn1") or (obj1.myName == "wKnight1" and obj2.myName == "wPawn2") or (obj1.myName == "wKnight1" and obj2.myName == "wPawn3") or (obj1.myName == "wKnight1" and obj2.myName == "wPawn4") or (obj1.myName == "wKnight1" and obj2.myName == "wPawn5") or (obj1.myName == "wKnight1" and obj2.myName == "wPawn6") or (obj1.myName == "wKnight1" and obj2.myName == "wPawn7") or (obj1.myName == "wKnight1" and obj2.myName == "wPawn8") or (obj1.myName == "wKnight1" and obj2.myName == "wKing") or (obj1.myName == "wKnight1" and obj2.myName == "wQueen") or (obj1.myName == "wKnight1" and obj2.myName == "wRook1") or (obj1.myName == "wKnight1" and obj2.myName == "wRook2") or (obj1.myName == "wKnight1" and obj2.myName == "wKnight1") or (obj1.myName == "wKnight1" and obj2.myName == "wKnight2") or (obj1.myName == "wKnight1" and obj2.myName == "wBishop1") or (obj1.myName == "wKnight1" and obj2.myName == "wBishop2")
				or (obj1.myName == "wKnight2" and obj2.myName == "wPawn1") or (obj1.myName == "wKnight2" and obj2.myName == "wPawn2") or (obj1.myName == "wKnight2" and obj2.myName == "wPawn3") or (obj1.myName == "wKnight2" and obj2.myName == "wPawn4") or (obj1.myName == "wKnight2" and obj2.myName == "wPawn5") or (obj1.myName == "wKnight2" and obj2.myName == "wPawn6") or (obj1.myName == "wKnight2" and obj2.myName == "wPawn7") or (obj1.myName == "wKnight2" and obj2.myName == "wPawn8") or (obj1.myName == "wKnight2" and obj2.myName == "wKing") or (obj1.myName == "wKnight2" and obj2.myName == "wQueen") or (obj1.myName == "wKnight2" and obj2.myName == "wRook1") or (obj1.myName == "wKnight2" and obj2.myName == "wRook2") or (obj1.myName == "wKnight2" and obj2.myName == "wKnight1") or (obj1.myName == "wKnight2" and obj2.myName == "wKnight2") or (obj1.myName == "wKnight2" and obj2.myName == "wBishop1") or (obj1.myName == "wKnight2" and obj2.myName == "wBishop2"))
				then
				moveBack = true
           	elseif(currentColour == "white" and (obj1.myName == "bPawn1" and obj2.myName == "bPawn1") or (obj1.myName == "bPawn1" and obj2.myName == "bPawn2") or (obj1.myName == "bPawn1" and obj2.myName == "bPawn3") or (obj1.myName == "bPawn1" and obj2.myName == "bPawn4") or (obj1.myName == "bPawn1" and obj2.myName == "bPawn5") or (obj1.myName == "bPawn1" and obj2.myName == "bPawn6") or (obj1.myName == "bPawn1" and obj2.myName == "bPawn7") or (obj1.myName == "bPawn1" and obj2.myName == "bPawn8") or (obj1.myName == "bPawn1" and obj2.myName == "bKing") or (obj1.myName == "bPawn1" and obj2.myName == "bQueen") or (obj1.myName == "bPawn1" and obj2.myName == "bRook1") or (obj1.myName == "bPawn1" and obj2.myName == "bRook2") or (obj1.myName == "bPawn1" and obj2.myName == "bKnight1") or (obj1.myName == "bPawn1" and obj2.myName == "bKnight2") or (obj1.myName == "bPawn1" and obj2.myName == "bBishop1") or (obj1.myName == "bPawn1" and obj2.myName == "bBishop2")
				or (obj1.myName == "bPawn2" and obj2.myName == "bPawn1") or (obj1.myName == "bPawn2" and obj2.myName == "bPawn2") or (obj1.myName == "bPawn2" and obj2.myName == "bPawn3") or (obj1.myName == "bPawn2" and obj2.myName == "bPawn4") or (obj1.myName == "bPawn2" and obj2.myName == "bPawn5") or (obj1.myName == "bPawn2" and obj2.myName == "bPawn6") or (obj1.myName == "bPawn2" and obj2.myName == "bPawn7") or (obj1.myName == "bPawn2" and obj2.myName == "bPawn8") or (obj1.myName == "bPawn2" and obj2.myName == "bKing") or (obj1.myName == "bPawn2" and obj2.myName == "bQueen") or (obj1.myName == "bPawn2" and obj2.myName == "bRook1") or (obj1.myName == "bPawn2" and obj2.myName == "bRook2") or (obj1.myName == "bPawn2" and obj2.myName == "bKnight1") or (obj1.myName == "bPawn2" and obj2.myName == "bKnight2") or (obj1.myName == "bPawn2" and obj2.myName == "bBishop1") or (obj1.myName == "bPawn2" and obj2.myName == "bBishop2")
				or (obj1.myName == "bPawn3" and obj2.myName == "bPawn1") or (obj1.myName == "bPawn3" and obj2.myName == "bPawn2") or (obj1.myName == "bPawn3" and obj2.myName == "bPawn3") or (obj1.myName == "bPawn3" and obj2.myName == "bPawn4") or (obj1.myName == "bPawn3" and obj2.myName == "bPawn5") or (obj1.myName == "bPawn3" and obj2.myName == "bPawn6") or (obj1.myName == "bPawn3" and obj2.myName == "bPawn7") or (obj1.myName == "bPawn3" and obj2.myName == "bPawn8") or (obj1.myName == "bPawn3" and obj2.myName == "bKing") or (obj1.myName == "bPawn3" and obj2.myName == "bQueen") or (obj1.myName == "bPawn3" and obj2.myName == "bRook1") or (obj1.myName == "bPawn3" and obj2.myName == "bRook2") or (obj1.myName == "bPawn3" and obj2.myName == "bKnight1") or (obj1.myName == "bPawn3" and obj2.myName == "bKnight2") or (obj1.myName == "bPawn3" and obj2.myName == "bBishop1") or (obj1.myName == "bPawn3" and obj2.myName == "bBishop2")
				or (obj1.myName == "bPawn4" and obj2.myName == "bPawn1") or (obj1.myName == "bPawn4" and obj2.myName == "bPawn2") or (obj1.myName == "bPawn4" and obj2.myName == "bPawn3") or (obj1.myName == "bPawn4" and obj2.myName == "bPawn4") or (obj1.myName == "bPawn4" and obj2.myName == "bPawn5") or (obj1.myName == "bPawn4" and obj2.myName == "bPawn6") or (obj1.myName == "bPawn4" and obj2.myName == "bPawn7") or (obj1.myName == "bPawn4" and obj2.myName == "bPawn8") or (obj1.myName == "bPawn4" and obj2.myName == "bKing") or (obj1.myName == "bPawn4" and obj2.myName == "bQueen") or (obj1.myName == "bPawn4" and obj2.myName == "bRook1") or (obj1.myName == "bPawn4" and obj2.myName == "bRook2") or (obj1.myName == "bPawn4" and obj2.myName == "bKnight1") or (obj1.myName == "bPawn4" and obj2.myName == "bKnight2") or (obj1.myName == "bPawn4" and obj2.myName == "bBishop1") or (obj1.myName == "bPawn4" and obj2.myName == "bBishop2")
				or (obj1.myName == "bPawn5" and obj2.myName == "bPawn1") or (obj1.myName == "bPawn5" and obj2.myName == "bPawn2") or (obj1.myName == "bPawn5" and obj2.myName == "bPawn3") or (obj1.myName == "bPawn5" and obj2.myName == "bPawn4") or (obj1.myName == "bPawn5" and obj2.myName == "bPawn5") or (obj1.myName == "bPawn5" and obj2.myName == "bPawn6") or (obj1.myName == "bPawn5" and obj2.myName == "bPawn7") or (obj1.myName == "bPawn5" and obj2.myName == "bPawn8") or (obj1.myName == "bPawn5" and obj2.myName == "bKing") or (obj1.myName == "bPawn5" and obj2.myName == "bQueen") or (obj1.myName == "bPawn5" and obj2.myName == "bRook1") or (obj1.myName == "bPawn5" and obj2.myName == "bRook2") or (obj1.myName == "bPawn5" and obj2.myName == "bKnight1") or (obj1.myName == "bPawn5" and obj2.myName == "bKnight2") or (obj1.myName == "bPawn5" and obj2.myName == "bBishop1") or (obj1.myName == "bPawn5" and obj2.myName == "bBishop2")
				or (obj1.myName == "bPawn6" and obj2.myName == "bPawn1") or (obj1.myName == "bPawn6" and obj2.myName == "bPawn2") or (obj1.myName == "bPawn6" and obj2.myName == "bPawn3") or (obj1.myName == "bPawn6" and obj2.myName == "bPawn4") or (obj1.myName == "bPawn6" and obj2.myName == "bPawn5") or (obj1.myName == "bPawn6" and obj2.myName == "bPawn6") or (obj1.myName == "bPawn6" and obj2.myName == "bPawn7") or (obj1.myName == "bPawn6" and obj2.myName == "bPawn8") or (obj1.myName == "bPawn6" and obj2.myName == "bKing") or (obj1.myName == "bPawn6" and obj2.myName == "bQueen") or (obj1.myName == "bPawn6" and obj2.myName == "bRook1") or (obj1.myName == "bPawn6" and obj2.myName == "bRook2") or (obj1.myName == "bPawn6" and obj2.myName == "bKnight1") or (obj1.myName == "bPawn6" and obj2.myName == "bKnight2") or (obj1.myName == "bPawn6" and obj2.myName == "bBishop1") or (obj1.myName == "bPawn6" and obj2.myName == "bBishop2")
				or (obj1.myName == "bPawn7" and obj2.myName == "bPawn1") or (obj1.myName == "bPawn7" and obj2.myName == "bPawn2") or (obj1.myName == "bPawn7" and obj2.myName == "bPawn3") or (obj1.myName == "bPawn7" and obj2.myName == "bPawn4") or (obj1.myName == "bPawn7" and obj2.myName == "bPawn5") or (obj1.myName == "bPawn7" and obj2.myName == "bPawn6") or (obj1.myName == "bPawn7" and obj2.myName == "bPawn7") or (obj1.myName == "bPawn7" and obj2.myName == "bPawn8") or (obj1.myName == "bPawn7" and obj2.myName == "bKing") or (obj1.myName == "bPawn7" and obj2.myName == "bQueen") or (obj1.myName == "bPawn7" and obj2.myName == "bRook1") or (obj1.myName == "bPawn7" and obj2.myName == "bRook2") or (obj1.myName == "bPawn7" and obj2.myName == "bKnight1") or (obj1.myName == "bPawn7" and obj2.myName == "bKnight2") or (obj1.myName == "bPawn7" and obj2.myName == "bBishop1") or (obj1.myName == "bPawn7" and obj2.myName == "bBishop2")
				or (obj1.myName == "bPawn8" and obj2.myName == "bPawn1") or (obj1.myName == "bPawn8" and obj2.myName == "bPawn2") or (obj1.myName == "bPawn8" and obj2.myName == "bPawn3") or (obj1.myName == "bPawn8" and obj2.myName == "bPawn4") or (obj1.myName == "bPawn8" and obj2.myName == "bPawn5") or (obj1.myName == "bPawn8" and obj2.myName == "bPawn6") or (obj1.myName == "bPawn8" and obj2.myName == "bPawn7") or (obj1.myName == "bPawn8" and obj2.myName == "bPawn8") or (obj1.myName == "bPawn8" and obj2.myName == "bKing") or (obj1.myName == "bPawn8" and obj2.myName == "bQueen") or (obj1.myName == "bPawn8" and obj2.myName == "bRook1") or (obj1.myName == "bPawn8" and obj2.myName == "bRook2") or (obj1.myName == "bPawn8" and obj2.myName == "bKnight1") or (obj1.myName == "bPawn8" and obj2.myName == "bKnight2") or (obj1.myName == "bPawn8" and obj2.myName == "bBishop1") or (obj1.myName == "bPawn8" and obj2.myName == "bBishop2")
				or (obj1.myName == "bKing" and obj2.myName == "bPawn1") or (obj1.myName == "bKing" and obj2.myName == "bPawn2") or (obj1.myName == "bKing" and obj2.myName == "bPawn3") or (obj1.myName == "bKing" and obj2.myName == "bPawn4") or (obj1.myName == "bKing" and obj2.myName == "bPawn5") or (obj1.myName == "bKing" and obj2.myName == "bPawn6") or (obj1.myName == "bKing" and obj2.myName == "bPawn7") or (obj1.myName == "bKing" and obj2.myName == "bPawn8") or (obj1.myName == "bKing" and obj2.myName == "bKing") or (obj1.myName == "bKing" and obj2.myName == "bQueen") or (obj1.myName == "bKing" and obj2.myName == "bRook1") or (obj1.myName == "bKing" and obj2.myName == "bRook2") or (obj1.myName == "bKing" and obj2.myName == "bKnight1") or (obj1.myName == "bKing" and obj2.myName == "bKnight2") or (obj1.myName == "bKing" and obj2.myName == "bBishop1") or (obj1.myName == "bKing" and obj2.myName == "bBishop2")
				or (obj1.myName == "bRook1" and obj2.myName == "bPawn1") or (obj1.myName == "bRook1" and obj2.myName == "bPawn2") or (obj1.myName == "bRook1" and obj2.myName == "bPawn3") or (obj1.myName == "bRook1" and obj2.myName == "bPawn4") or (obj1.myName == "bRook1" and obj2.myName == "bPawn5") or (obj1.myName == "bRook1" and obj2.myName == "bPawn6") or (obj1.myName == "bRook1" and obj2.myName == "bPawn7") or (obj1.myName == "bRook1" and obj2.myName == "bPawn8") or (obj1.myName == "bRook1" and obj2.myName == "bKing") or (obj1.myName == "bRook1" and obj2.myName == "bQueen") or (obj1.myName == "bRook1" and obj2.myName == "bRook1") or (obj1.myName == "bRook1" and obj2.myName == "bRook2") or (obj1.myName == "bRook1" and obj2.myName == "bKnight1") or (obj1.myName == "bRook1" and obj2.myName == "bKnight2") or (obj1.myName == "bRook1" and obj2.myName == "bBishop1") or (obj1.myName == "bRook1" and obj2.myName == "bBishop2")
				or (obj1.myName == "bRook2" and obj2.myName == "bPawn1") or (obj1.myName == "bRook2" and obj2.myName == "bPawn2") or (obj1.myName == "bRook2" and obj2.myName == "bPawn3") or (obj1.myName == "bRook2" and obj2.myName == "bPawn4") or (obj1.myName == "bRook2" and obj2.myName == "bPawn5") or (obj1.myName == "bRook2" and obj2.myName == "bPawn6") or (obj1.myName == "bRook2" and obj2.myName == "bPawn7") or (obj1.myName == "bRook2" and obj2.myName == "bPawn8") or (obj1.myName == "bRook2" and obj2.myName == "bKing") or (obj1.myName == "bRook2" and obj2.myName == "bQueen") or (obj1.myName == "bRook2" and obj2.myName == "bRook1") or (obj1.myName == "bRook2" and obj2.myName == "bRook2") or (obj1.myName == "bRook2" and obj2.myName == "bKnight1") or (obj1.myName == "bRook2" and obj2.myName == "bKnight2") or (obj1.myName == "bRook2" and obj2.myName == "bBishop1") or (obj1.myName == "bRook2" and obj2.myName == "bBishop2")
				or (obj1.myName == "bQueen" and obj2.myName == "bPawn1") or (obj1.myName == "bQueen" and obj2.myName == "bPawn2") or (obj1.myName == "bQueen" and obj2.myName == "bPawn3") or (obj1.myName == "bQueen" and obj2.myName == "bPawn4") or (obj1.myName == "bQueen" and obj2.myName == "bPawn5") or (obj1.myName == "bQueen" and obj2.myName == "bPawn6") or (obj1.myName == "bQueen" and obj2.myName == "bPawn7") or (obj1.myName == "bQueen" and obj2.myName == "bPawn8") or (obj1.myName == "bQueen" and obj2.myName == "bKing") or (obj1.myName == "bQueen" and obj2.myName == "bQueen") or (obj1.myName == "bQueen" and obj2.myName == "bRook1") or (obj1.myName == "bQueen" and obj2.myName == "bRook2") or (obj1.myName == "bQueen" and obj2.myName == "bKnight1") or (obj1.myName == "bQueen" and obj2.myName == "bKnight2") or (obj1.myName == "bQueen" and obj2.myName == "bBishop1") or (obj1.myName == "bQueen" and obj2.myName == "bBishop2")
				or (obj1.myName == "bBishop1" and obj2.myName == "bPawn1") or (obj1.myName == "bBishop1" and obj2.myName == "bPawn2") or (obj1.myName == "bBishop1" and obj2.myName == "bPawn3") or (obj1.myName == "bBishop1" and obj2.myName == "bPawn4") or (obj1.myName == "bBishop1" and obj2.myName == "bPawn5") or (obj1.myName == "bBishop1" and obj2.myName == "bPawn6") or (obj1.myName == "bBishop1" and obj2.myName == "bPawn7") or (obj1.myName == "bBishop1" and obj2.myName == "bPawn8") or (obj1.myName == "bBishop1" and obj2.myName == "bKing") or (obj1.myName == "bBishop1" and obj2.myName == "bQueen") or (obj1.myName == "bBishop1" and obj2.myName == "bRook1") or (obj1.myName == "bBishop1" and obj2.myName == "bRook2") or (obj1.myName == "bBishop1" and obj2.myName == "bKnight1") or (obj1.myName == "bBishop1" and obj2.myName == "bKnight2") or (obj1.myName == "bBishop1" and obj2.myName == "bBishop1") or (obj1.myName == "bBishop1" and obj2.myName == "bBishop2")
				or (obj1.myName == "bBishop2" and obj2.myName == "bPawn1") or (obj1.myName == "bBishop2" and obj2.myName == "bPawn2") or (obj1.myName == "bBishop2" and obj2.myName == "bPawn3") or (obj1.myName == "bBishop2" and obj2.myName == "bPawn4") or (obj1.myName == "bBishop2" and obj2.myName == "bPawn5") or (obj1.myName == "bBishop2" and obj2.myName == "bPawn6") or (obj1.myName == "bBishop2" and obj2.myName == "bPawn7") or (obj1.myName == "bBishop2" and obj2.myName == "bPawn8") or (obj1.myName == "bBishop2" and obj2.myName == "bKing") or (obj1.myName == "bBishop2" and obj2.myName == "bQueen") or (obj1.myName == "bBishop2" and obj2.myName == "bRook1") or (obj1.myName == "bBishop2" and obj2.myName == "bRook2") or (obj1.myName == "bBishop2" and obj2.myName == "bKnight1") or (obj1.myName == "bBishop2" and obj2.myName == "bKnight2") or (obj1.myName == "bBishop2" and obj2.myName == "bBishop1") or (obj1.myName == "bBishop2" and obj2.myName == "bBishop2")
				or (obj1.myName == "bKnight1" and obj2.myName == "bPawn1") or (obj1.myName == "bKnight1" and obj2.myName == "bPawn2") or (obj1.myName == "bKnight1" and obj2.myName == "bPawn3") or (obj1.myName == "bKnight1" and obj2.myName == "bPawn4") or (obj1.myName == "bKnight1" and obj2.myName == "bPawn5") or (obj1.myName == "bKnight1" and obj2.myName == "bPawn6") or (obj1.myName == "bKnight1" and obj2.myName == "bPawn7") or (obj1.myName == "bKnight1" and obj2.myName == "bPawn8") or (obj1.myName == "bKnight1" and obj2.myName == "bKing") or (obj1.myName == "bKnight1" and obj2.myName == "bQueen") or (obj1.myName == "bKnight1" and obj2.myName == "bRook1") or (obj1.myName == "bKnight1" and obj2.myName == "bRook2") or (obj1.myName == "bKnight1" and obj2.myName == "bKnight1") or (obj1.myName == "bKnight1" and obj2.myName == "bKnight2") or (obj1.myName == "bKnight1" and obj2.myName == "bBishop1") or (obj1.myName == "bKnight1" and obj2.myName == "bBishop2")
				or (obj1.myName == "bKnight2" and obj2.myName == "bPawn1") or (obj1.myName == "bKnight2" and obj2.myName == "bPawn2") or (obj1.myName == "bKnight2" and obj2.myName == "bPawn3") or (obj1.myName == "bKnight2" and obj2.myName == "bPawn4") or (obj1.myName == "bKnight2" and obj2.myName == "bPawn5") or (obj1.myName == "bKnight2" and obj2.myName == "bPawn6") or (obj1.myName == "bKnight2" and obj2.myName == "bPawn7") or (obj1.myName == "bKnight2" and obj2.myName == "bPawn8") or (obj1.myName == "bKnight2" and obj2.myName == "bKing") or (obj1.myName == "bKnight2" and obj2.myName == "bQueen") or (obj1.myName == "bKnight2" and obj2.myName == "bRook1") or (obj1.myName == "bKnight2" and obj2.myName == "bRook2") or (obj1.myName == "bKnight2" and obj2.myName == "bKnight1") or (obj1.myName == "bKnight2" and obj2.myName == "bKnight2") or (obj1.myName == "bKnight2" and obj2.myName == "bBishop1") or (obj1.myName == "bKnight2" and obj2.myName == "bBishop2"))
				then
				moveBack = true
			end
		if (moveBack == true) then
			timer.performWithDelay( 500, resetPosition )
		end

			--Win condition code
        	temp = obj1
        	obj1 = obj2
        	obj2 = temp
        	function resetPieces(e)
			wPawn1.x =108.5;wPawn1.y =255;wPawn2.x =146.5;wPawn2.y =255;wPawn3.x =183.5;wPawn3.y =255;wPawn4.x =221.5;wPawn4.y =255;wPawn5.x =259;wPawn5.y =255;wPawn6.x =296;wPawn6.y =255;wPawn7.x =333;wPawn7.y =255;wPawn8.x =370;wPawn8.y =255;
			bPawn1.x =108.5;bPawn1.y =65;bPawn2.x =146.5;bPawn2.y =65;bPawn3.x =183.5;bPawn3.y =65;bPawn4.x =221.5;bPawn4.y =65;bPawn5.x =259;bPawn5.y =65;bPawn6.x =296;bPawn6.y =65;bPawn7.x =333;bPawn7.y =65;bPawn8.x =370;bPawn8.y =65;
			wRook1.x = 108.5;wRook1.y = 295;wRook2.x = 370;wRook2.y = 295;bRook1.x = 108.5;bRook1.y = 27.5;bRook2.x = 370;bRook2.y = 27.5;wKnight1.x =146.5;wKnight1.y =295;wKnight2.x =333;wKnight2.y =295;bKnight1.x =146.5;bKnight1.y =27.5;bKnight2.x =333;bKnight2.y =27.5;
			wBishop1.x =183.5;wBishop1.y =295;wBishop2.x =296;wBishop2.y =295;bBishop1.x =183.5;bBishop1.y =27.5;bBishop2.x =296;bBishop2.y =27.5;wQueen.x =221.5;wQueen.y =295;bQueen.x =221.5;bQueen.y =27.5;wKing.x =259;wKing.y =296;bKing.x =259;bKing.y =27.5;		
			end
        	if(currentColour == "white" and (obj1.myName == "bPawn1" and obj2.myName == "wKing") or (obj1.myName == "bPawn2" and obj2.myName == "wKing") or (obj1.myName == "bPawn3" and obj2.myName == "wKing") or (obj1.myName == "bPawn4" and obj2.myName == "wKing") or (obj1.myName == "bPawn5" and obj2.myName == "wKing") or (obj1.myName == "bPawn6" and obj2.myName == "wKing") or (obj1.myName == "bPawn7" and obj2.myName == "wKing") or (obj1.myName == "bPawn8" and obj2.myName == "wKing") or
			      (obj1.myName == "bKing" and obj2.myName == "wKing") or  (obj1.myName == "bRook1" and obj2.myName == "wKing") or (obj1.myName == "bRook2" and obj2.myName == "wKing") or (obj1.myName == "bQueen" and obj2.myName == "wKing") or (obj1.myName == "bBishop1" and obj2.myName == "wKing") or (obj1.myName == "bBishop2" and obj2.myName == "wKing") or (obj1.myName == "bKnight1" and obj2.myName == "wKing") or (obj1.myName == "bKnight2" and obj2.myName == "wKing")) 
			then
				display.remove(obj1)
				local screenTextWB = display.newText("Black Wins!", 0, 0, "MASQUE.ttf", 9*2);
				screenTextWB.xScale = 1
				screenTextWB.yScale = 1
				screenTextWB.anchorX = 0
				screenTextWB.x = 175
				screenTextWB.y = 175
				reset = true
			elseif (currentColour == "black" and (obj1.myName == "wPawn1" and obj2.myName == "bKing") or (obj1.myName == "wPawn2" and obj2.myName == "bKing") or (obj1.myName == "wPawn3" and obj2.myName == "bKing") or (obj1.myName == "wPawn4" and obj2.myName == "bKing") or (obj1.myName == "wPawn5" and obj2.myName == "bKing") or (obj1.myName == "wPawn6" and obj2.myName == "bKing") or (obj1.myName == "wPawn7" and obj2.myName == "bKing") or (obj1.myName == "wPawn8" and obj2.myName == "bKing") or
			       (obj1.myName == "wKing" and obj2.myName == "bKing") or  (obj1.myName == "wRook1" and obj2.myName == "bKing") or (obj1.myName == "wRook2" and obj2.myName == "bKing") or (obj1.myName == "wQueen" and obj2.myName == "bKing") or (obj1.myName == "wBishop1" and obj2.myName == "bKing") or (obj1.myName == "wBishop2" and obj2.myName == "bKing") or (obj1.myName == "wKnight1" and obj2.myName == "bKing") or (obj1.myName == "wKnight2" and obj2.myName == "bKing")) 
			then
				display.remove(obj1)
				local screenTextWW = display.newText("White Wins!", 0, 0, "MASQUE.ttf", 9*2);
				screenTextWW.xScale = 1
				screenTextWW.yScale = 1
				screenTextWW.anchorX = 0
				screenTextWW.x = 175
				screenTextWW.y = 175
				screenTextWW:setFillColor( 1, 0, 1 )
				reset = true
            end
        if (reset == true) then
			timer.performWithDelay(500, resetPieces)
		end
   		end
	end
	Runtime:addEventListener( "collision", pieceCollision )
	--white move
	local function whiteMove()
		--create piece touch movement
    	function touchListenerWP1(event)
    	if blackTurn then
		 	return
		 end
		whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	    print(currentColour)
    	   	display.getCurrentStage():setFocus(wPawn1) 
    	    markX = wPawn1.x    -- store x location of object
    	    markY = wPawn1.y  -- store y location of object
   			elseif event.phase == "moved" then
   				if(tapCountW1==0) then
   					if (math.abs(markY-event.y)<83) then
						wPawn1.y = event.y
					else
						wPawn1.x=markX
						wPawn1.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						wPawn1.y = event.y
					else
					wPawn1.x=markX
					wPawn1.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountW1 = tapCountW1+1
    		end
    	return true
    	end
		pcall(function()wPawn1:addEventListener("touch", touchListenerWP1)end)

		function touchListenerWP2(event)
		if blackTurn then
		 	return
		 end
		whiteTurn=true
		if blackTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wPawn2) 
    	    markX = wPawn2.x    -- store x location of object
    	    markY = wPawn2.y    -- store y location of object
    	
   			elseif event.phase == "moved" then		
   				if(tapCountW2==0) then
   					if (math.abs(markY-event.y)<83) then
						wPawn2.y = event.y
					else
						wPawn2.x=markX
						wPawn2.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						wPawn2.y = event.y
					else
					wPawn2.x=markX
					wPawn2.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountW2 = tapCountW2+1
    		end
    	return true
    	end
		pcall(function()wPawn2:addEventListener("touch", touchListenerWP2)end)

		function touchListenerWP3(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wPawn3) 
    	    markX = wPawn3.x    -- store x location of object
    	    markY = wPawn3.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountW3==0) then
   					if (math.abs(markY-event.y)<83) then
						wPawn3.y = event.y
					else
						wPawn3.x=markX
						wPawn3.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						wPawn3.y = event.y
					else
					wPawn3.x=markX
					wPawn3.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountW3 = tapCountW3+1
    		end
    	return true
    	end
		pcall(function()wPawn3:addEventListener("touch", touchListenerWP3)end)

		function touchListenerWP4(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wPawn) 
    	    markX = wPawn4.x    -- store x location of object
    	    markY = wPawn4.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountW4==0) then
   					if (math.abs(markY-event.y)<83) then
						wPawn4.y = event.y
					else
						wPawn4.x=markX
						wPawn4.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						wPawn4.y = event.y
					else
					wPawn4.x=markX
					wPawn4.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountW4 = tapCountW4+1
    		end
    	return true
    	end
		pcall(function()wPawn4:addEventListener("touch", touchListenerWP4)end)

		function touchListenerWP5(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wPawn) 
    	    markX = wPawn5.x    -- store x location of object
    	    markY = wPawn5.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountW5==0) then
   					if (math.abs(markY-event.y)<83) then
						wPawn5.y = event.y
					else
						wPawn5.x=markX
						wPawn5.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						wPawn5.y = event.y
					else
					wPawn5.x=markX
					wPawn5.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountW5 = tapCountW5+1
    		end
    	return true
    	end
		pcall(function()wPawn5:addEventListener("touch", touchListenerWP5)end)

		function touchListenerWP6(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wPawn) 
    	    markX = wPawn6.x    -- store x location of object
    	    markY = wPawn6.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountW6==0) then
   					if (math.abs(markY-event.y)<83) then
						wPawn6.y = event.y
					else
						wPawn6.x=markX
						wPawn6.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						wPawn6.y = event.y
					else
					wPawn6.x=markX
					wPawn6.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountW6 = tapCountW6+1
    		end
    	return true
    	end
		pcall(function()wPawn6:addEventListener("touch", touchListenerWP6)end)

		function touchListenerWP7(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wPawn) 
    	    markX = wPawn7.x    -- store x location of object
    	    markY = wPawn7.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountW7==0) then
   					if (math.abs(markY-event.y)<83) then
						wPawn7.y = event.y
					else
						wPawn7.x=markX
						wPawn7.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						wPawn7.y = event.y
					else
					wPawn7.x=markX
					wPawn7.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountW7 = tapCountW7+1
    		end
    	return true
    	end
		pcall(function()wPawn7:addEventListener("touch", touchListenerWP7)end)

		function touchListenerWP8(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wPawn) 
    	    markX = wPawn8.x    -- store x location of object
    	    markY = wPawn8.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountW8==0) then
   					if (math.abs(markY-event.y)<83) then
						wPawn8.y = event.y
					else
						wPawn8.x=markX
						wPawn8.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						wPawn8.y = event.y
					else
					wPawn8.x=markX
					wPawn8.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountW8 = tapCountW8+1
    		end
    	return true
    	end
		pcall(function()wPawn8:addEventListener("touch", touchListenerWP8)end)


		function touchListenerWR1(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wRook1) 
    	    markX = wRook1.x    -- store x location of object
    	    markY = wRook1.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   			distx=math.abs(markX-event.x);
   			disty=math.abs(markY-event.y);
		   if(distx>disty) then
    	   		wRook1.x = event.x
    	   		wRook1.y = markY   			
    	   end
    	   if(distx<disty) then
    	   		wRook1.y = event.y
    	   		wRook1.x = markX
    	   end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()wRook1:addEventListener("touch", touchListenerWR1)end)

		function touchListenerWR2(event)
		if blackTurn then
		 	return
		 end
		  whiteTurn=true
    	    if event.phase == "began" then
    	    currentColour = "white"
    	   	display.getCurrentStage():setFocus(wRook2) 
    	    markX = wRook2.x    -- store x location of object
    	    markY = wRook2.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   			distx=math.abs(markX-event.x);
   			disty=math.abs(markY-event.y);
		   if(distx>disty) then
    	   		wRook2.x = event.x
    	   		wRook2.y = markY   			
    	   end
    	   if(distx<disty) then
    	   		wRook2.y = event.y
    	   		wRook2.x = markX
    	   end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()wRook2:addEventListener("touch", touchListenerWR2)end)

		function touchListenerWKN1(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
			if event.phase == "began" then
			currentColour = "white"
    	   	display.getCurrentStage():setFocus(wKnight1) 
    	    markX = wKnight1.x    -- store x location of object
    	    markY = wKnight1.y    -- store y location of object
    		markXM = markX-20
    	    markXP = markX+20
    	    markYM = markY-20
			markYP = markY+20

   			elseif event.phase == "moved" then
   			distx=math.abs(markX-event.x);
   			disty=math.abs(markY-event.y);
				if(distx>disty and wKnight1.y>markYM and wKnight1.y<markYP)then
						if(math.abs(markX-event.x)<83) then
							wKnight1.x = event.x
								if(math.abs(markY-event.y)<46) then
									wKnight1.y = event.y
								else
									wKnight1.x = markX
									wKnight1.y = markY
								end
						else
							wKnight1.x = markX
							wKnight1.y = markY
						end
				elseif(distx<disty and wKnight1.x>markXM and wKnight1.x<markXP)then
						if(math.abs(markY-event.y)<83) then
							wKnight1.y = event.y
								if(math.abs(markX-event.x)<46) then
									wKnight1.x = event.x
								else
									wKnight1.x = markX
									wKnight1.y = markY
								end
						else
							wKnight1.x = markX
							wKnight1.y = markY
						end
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()wKnight1:addEventListener("touch", touchListenerWKN1)end)

		function touchListenerWKN2(event)
		if blackTurn then
		 	return
		 end
		 whiteTurn=true
			 if event.phase == "began" then
			 currentColour = "white"
    	   	display.getCurrentStage():setFocus(wKnight2) 
    	    markX = wKnight2.x    -- store x location of object
    	    markY = wKnight2.y    -- store y location of object
    		markXM = markX-20
    	    markXP = markX+20
    	    markYM = markY-20
			markYP = markY+20
   			elseif event.phase == "moved" then
   			distx=math.abs(markX-event.x);
   			disty=math.abs(markY-event.y);
				if(distx>disty and wKnight2.y>markYM and wKnight2.y<markYP)then
						if(math.abs(markX-event.x)<83) then
							wKnight2.x = event.x
								if(math.abs(markY-event.y)<46) then
									wKnight2.y = event.y
								else
									wKnight2.x = markX
									wKnight2.y = markY
								end
						else
							wKnight2.x = markX
							wKnight2.y = markY
						end
				elseif(distx<disty and wKnight2.x>markXM and wKnight2.x<markXP)then
						if(math.abs(markY-event.y)<83) then
							wKnight2.y = event.y
								if(math.abs(markX-event.x)<46) then
									wKnight2.x = event.x
								else
									wKnight2.x = markX
									wKnight2.y = markY
								end
						else
							wKnight2.x = markX
							wKnight2.y = markY
						end
				end    		
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()wKnight2:addEventListener("touch", touchListenerWKN2)end)

		function touchListenerWB1(event)
		if blackTurn then
		 	return
		 end
		 	whiteTurn=true
			if event.phase == "began" then
			currentColour = "white"
    		  	display.getCurrentStage():setFocus(wBishop1) 
    		   markX = wBishop1.x    -- store x location of object
    		   markY = wBishop1.y    -- store y location of object

   			elseif event.phase == "moved" then
   					wBishop1.x=event.x
   					wBishop1.y=markY-(markX-event.x)
					if(markX<event.x  and markY>event.y) then
    	 				wBishop1.x=event.x
    	 				wBishop1.y=markY-(event.x-markX)
    	 			end
					if(markX>event.x  and markY>event.y) then
			   			wBishop1.x=event.x
			   			wBishop1.y=markY-(markX-event.x)
					end
					if(markX<event.x  and markY<event.y) then
    	 				wBishop1.x=event.x
    	 				wBishop1.y=markY+(event.x-markX)
    	 			end
					if(markX>event.x  and markY<event.y) then
			   			wBishop1.x=event.x
			   			wBishop1.y=markY+(markX-event.x)
					end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		return true
    		end
    	end
		pcall(function()wBishop1:addEventListener("touch", touchListenerWB1)end)

		 function touchListenerWB2(event)
		 if blackTurn then
		 	return
		 end
		 		 whiteTurn=true
			if event.phase == "began" then
			currentColour = "white"
    		  	display.getCurrentStage():setFocus(wBishop2) 
    		   markX = wBishop2.x    -- store x location of object
    		   markY = wBishop2.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   					wBishop2.x=event.x
   					wBishop2.y=markY-(markX-event.x)
					if(markX<event.x and markY>event.y) then
    	 				wBishop2.x=event.x
    	 				wBishop2.y=markY-(event.x-markX)
    	 			end
					if(markX>event.x  and markY>event.y) then
			   			wBishop2.x=event.x
			   			wBishop2.y=markY-(markX-event.x)
					end
					if(markX<event.x  and markY<event.y) then
    	 				wBishop2.x=event.x
    	 				wBishop2.y=markY+(event.x-markX)
    	 			end
					if(markX>event.x  and markY<event.y) then
			   			wBishop2.x=event.x
			   			wBishop2.y=markY+(markX-event.x)
					end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()wBishop2:addEventListener("touch", touchListenerWB2)end)

		function touchListenerWQ(event)
		if blackTurn then
		 	return
		 end
		 		 whiteTurn=true
		 if event.phase == "began" then
		 currentColour = "white"
    	   	display.getCurrentStage():setFocus(wQueen) 
    	    markX = wQueen.x    -- store x location of object
    	    markY = wQueen.y    -- store y location of object
    	    markXM = markX-20
    	    markXP = markX+20
    	    markYM = markY-20
			markYP = markY+20
   			elseif event.phase == "moved" then
				distx=math.abs(markX-event.x);
				disty=math.abs(markY-event.y);
				if(distx>disty and wQueen.y>markYM and wQueen.y<markYP)then
						wQueen.x = event.x
				elseif(distx<disty and wQueen.x>markXM and wQueen.x<markXP)then
						wQueen.y = event.y
				elseif(markX<event.x and markY>event.y) then
					wQueen.x=event.x
   					wQueen.y=markY-(markX-event.x)
    	 			wQueen.x=event.x
    	 			wQueen.y=markY-(event.x-markX)
				elseif(markX>event.x and markY>event.y) then
					wQueen.x=event.x
					wQueen.y=markY-(markX-event.x)
			   		wQueen.x=event.x
			   		wQueen.y=markY-(markX-event.x)
			   	elseif(markX<event.x and markY<event.y) then
					wQueen.x=event.x
					wQueen.y=markY-(markX-event.x)
					wQueen.x=event.x
					wQueen.y=markY+(event.x-markX)
				elseif(markX>event.x and markY<event.y) then
					wQueen.x=event.x
					wQueen.y=markY-(markX-event.x)
					wQueen.x=event.x
					wQueen.y=markY+(markX-event.x)
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()wQueen:addEventListener("touch", touchListenerWQ)end)

		function touchListenerWK(event)
		if blackTurn then
		 	return
		 end
		 		 whiteTurn=true
		 if event.phase == "began" then
		 currentColour = "white"
    	   	display.getCurrentStage():setFocus(wKing) 
    	    markX = wKing.x    -- store x location of object
    	    markY = wKing.y    -- store y location of object
    		markXM = markX-20
    	    markXP = markX+20
    	    markYM = markY-20
			markYP = markY+20
   			elseif event.phase == "moved" then
				distx=math.abs(markX-event.x);
				disty=math.abs(markY-event.y);
				if(distx>disty and wKing.y>markYM and wKing.y<markYP)then
						if(math.abs(markX-event.x)<46) then
							wKing.x = event.x
						else
							wKing.x = markX
							wKing.y = markY
						end
				elseif(distx<disty and wKing.x>markXM and wKing.x<markXP)then
						if(math.abs(markY-event.y)<46) then
							wKing.y = event.y
						else
							wKing.x = markX
							wKing.y = markY
						end
				elseif(markX<event.x and markY>event.y) then
					if(math.abs(markX-event.x)<45 or math.abs(markY-event.y)<45) then
						wKing.x=event.x
   						wKing.y=markY-(markX-event.x)
    	 				wKing.x=event.x
    	 				wKing.y=markY-(event.x-markX)
    	 			else
						wKing.x = markX
						wKing.y = markY
					end
				elseif(markX>event.x and markY>event.y) then
					if(math.abs(markX-event.x)<45 or math.abs(markY-event.y)<45) then
						wKing.x=event.x
						wKing.y=markY-(markX-event.x)
			   			wKing.x=event.x
			   			wKing.y=markY-(markX-event.x)
    	 			else
						wKing.x = markX
						wKing.y = markY
					end
			   	elseif(markX<event.x and markY<event.y) then
					if(math.abs(markX-event.x)<45 or math.abs(markY-event.y)<45) then
						wKing.x=event.x
						wKing.y=markY-(markX-event.x)
						wKing.x=event.x
						wKing.y=markY+(event.x-markX)
    	 			else
						wKing.x = markX
						wKing.y = markY
					end
				elseif(markX>event.x and markY<event.y) then
					if(math.abs(markX-event.x)<45 or math.abs(markY-event.y)<45) then
						wKing.x=event.x
						wKing.y=markY-(markX-event.x)
						wKing.x=event.x
						wKing.y=markY+(markX-event.x)
    	 			else
						wKing.x = markX
						wKing.y = markY
					end
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=false
			blackTurn=true
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()wKing:addEventListener("touch", touchListenerWK)end)
	end

	--black move
	local function blackMove()
		    function touchListenerBP1(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	    print(currentColour)
    	   	display.getCurrentStage():setFocus(bPawn1) 
    	    markX = bPawn1.x    -- store x location of object
    	    markY = bPawn1.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountB1==0) then
   					if (math.abs(markY-event.y)<83) then
						bPawn1.y = event.y
					else
						bPawn1.x=markX
						bPawn1.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						bPawn1.y = event.y
					else
					bPawn1.x=markX
					bPawn1.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountB1 = tapCountB1+1
    		end
    	return true
    	end
		pcall(function()bPawn1:addEventListener("touch", touchListenerBP1)end)

		    function touchListenerBP2(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bPawn2) 
    	    markX = bPawn2.x    -- store x location of object
    	    markY = bPawn2.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountB2==0) then
   					if (math.abs(markY-event.y)<83) then
						bPawn2.y = event.y
					else
						bPawn2.x=markX
						bPawn2.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						bPawn2.y = event.y
					else
					bPawn2.x=markX
					bPawn2.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountB2 = tapCountB2+1
    		end
    	return true
    	end
		pcall(function()bPawn2:addEventListener("touch", touchListenerBP2)end)

		    function touchListenerBP3(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bPawn3) 
    	    markX = bPawn3.x    -- store x location of object
    	    markY = bPawn3.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountB3==0) then
   					if (math.abs(markY-event.y)<83) then
						bPawn3.y = event.y
					else
						bPawn3.x=markX
						bPawn3.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						bPawn3.y = event.y
					else
					bPawn3.x=markX
					bPawn3.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountB3 = tapCountB3+1
    		end
    	return true
    	end
		pcall(function()bPawn3:addEventListener("touch", touchListenerBP3)end)

		    function touchListenerBP4(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bPawn4) 
    	    markX = bPawn4.x    -- store x location of object
    	    markY = bPawn4.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountB4==0) then
   					if (math.abs(markY-event.y)<83) then
						bPawn4.y = event.y
					else
						bPawn4.x=markX
						bPawn4.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						bPawn4.y = event.y
					else
					bPawn4.x=markX
					bPawn4.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountB4 = tapCountB4+1
    		end
    	return true
    	end
		pcall(function()bPawn4:addEventListener("touch", touchListenerBP4)end)

		    function touchListenerBP5(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bPawn5) 
    	    markX = bPawn5.x    -- store x location of object
    	    markY = bPawn5.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountB5==0) then
   					if (math.abs(markY-event.y)<83) then
						bPawn5.y = event.y
					else
						bPawn5.x=markX
						bPawn5.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						bPawn5.y = event.y
					else
					bPawn5.x=markX
					bPawn5.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountB5 = tapCountB5+1
    		end
    	return true
    	end
		pcall(function()bPawn5:addEventListener("touch", touchListenerBP5)end)

		    function touchListenerBP6(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bPawn6) 
    	    markX = bPawn6.x    -- store x location of object
    	    markY = bPawn6.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountB6==0) then
   					if (math.abs(markY-event.y)<83) then
						bPawn6.y = event.y
					else
						bPawn6.x=markX
						bPawn6.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						bPawn6.y = event.y
					else
					bPawn6.x=markX
					bPawn6.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountB6 = tapCountB6+1
    		end
    	return true
    	end
		pcall(function()bPawn6:addEventListener("touch", touchListenerBP6)end)

		    function touchListenerBP7(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bPawn7) 
    	    markX = bPawn7.x    -- store x location of object
    	    markY = bPawn7.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountB7==0) then
   					if (math.abs(markY-event.y)<83) then
						bPawn7.y = event.y
					else
						bPawn7.x=markX
						bPawn7.y=markY
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						bPawn7.y = event.y
					else
					bPawn7.x=markX
					bPawn7.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		tapCountB7 = tapCountB7+1
    		end
    	return true
    	end
		pcall(function()bPawn7:addEventListener("touch", touchListenerBP7)end)

		    function touchListenerBP8(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bPawn8) 
    	    markX = bPawn8.x    -- store x location of object
    	    markY = bPawn8.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   				if(tapCountB8==0) then
   					if (math.abs(markY-event.y)<83) then
						bPawn8.y = event.y
					else
						bPawn8.x=markX
						bPawn8.y=markY
						tapCountB8 = tapCountB8-1
					end
					return true
				else
					if (math.abs(markY-event.y)<52) then
						bPawn8.y = event.y
					else
					bPawn8.x=markX
					bPawn8.y=markY
					end
					return true
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
			tapCountB8 = tapCountB8+1
    		end
    	return true
    	end
		pcall(function()bPawn8:addEventListener("touch", touchListenerBP8)end)

		function touchListenerBR1(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bRook1) 
    	    markX = bRook1.x    -- store x location of object
    	    markY = bRook1.y    -- store y location of object
    	
   			elseif event.phase == "moved" then

   			distx=math.abs(markX-event.x);
   			disty=math.abs(markY-event.y);
		   if(distx>disty) then
    	   		bRook1.x = event.x
    	   		bRook1.y = markY   			
    	   end
    	   if(distx<disty) then
    	   		bRook1.y = event.y
    	   		bRook1.x = markX
    	   end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()bRook1:addEventListener("touch", touchListenerBR1)end)

		function touchListenerBR2(event)
		 if whiteTurn then
		 	return
		 end
    	    if event.phase == "began" then
    	    currentColour = "black"
    	   	display.getCurrentStage():setFocus(bRook2) 
    	    markX = bRook2.x    -- store x location of object
    	    markY = bRook2.y    -- store y location of object
    	
   			elseif event.phase == "moved" then

   			distx=math.abs(markX-event.x);
   			disty=math.abs(markY-event.y);
		   if(distx>disty) then
    	   		bRook2.x = event.x
    	   		bRook2.y = markY   			
    	   end
    	   if(distx<disty) then
    	   		bRook2.y = event.y
    	   		bRook2.x = markX
    	   end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()bRook2:addEventListener("touch", touchListenerBR2)end)

		function touchListenerBKN1(event)
		 if whiteTurn then
		 	return
		 end
			 if event.phase == "began" then
			 currentColour = "black"
    	   	display.getCurrentStage():setFocus(bKnight1) 
    	    markX = bKnight1.x    -- store x location of object
    	    markY = bKnight1.y    -- store y location of object
    		markXM = markX-20
    	    markXP = markX+20
    	    markYM = markY-20
			markYP = markY+20
   			elseif event.phase == "moved" then
   			distx=math.abs(markX-event.x);
   			disty=math.abs(markY-event.y);
				if(distx>disty and bKnight1.y>markYM and bKnight1.y<markYP)then
						if(math.abs(markX-event.x)<83) then
							bKnight1.x = event.x
								if(math.abs(markY-event.y)<46) then
									bKnight1.y = event.y
								else
									bKnight1.x = markX
									bKnight1.y = markY
								end
						else
							bKnight1.x = markX
							bKnight1.y = markY
						end
				elseif(distx<disty and bKnight1.x>markXM and bKnight1.x<markXP)then
						if(math.abs(markY-event.y)<83) then
							bKnight1.y = event.y
								if(math.abs(markX-event.x)<46) then
									bKnight1.x = event.x
								else
									bKnight1.x = markX
									bKnight1.y = markY
								end
						else
							bKnight1.x = markX
							bKnight1.y = markY
						end
				end    		
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()bKnight1:addEventListener("touch", touchListenerBKN1)end)

		function touchListenerBKN2(event)
		 if whiteTurn then
		 	return
		 end
			 if event.phase == "began" then
			 currentColour = "black"
    	   	display.getCurrentStage():setFocus(bKnight2) 
    	    markX = bKnight2.x    -- store x location of object
    	    markY = bKnight2.y    -- store y location of object
    		markXM = markX-20
    	    markXP = markX+20
    	    markYM = markY-20
			markYP = markY+20
   			elseif event.phase == "moved" then
   			distx=math.abs(markX-event.x);
   			disty=math.abs(markY-event.y);
				if(distx>disty and bKnight2.y>markYM and bKnight2.y<markYP)then
						if(math.abs(markX-event.x)<83) then
							bKnight2.x = event.x
								if(math.abs(markY-event.y)<46) then
									bKnight2.y = event.y
								else
									bKnight2.x = markX
									bKnight2.y = markY
								end
						else
							bKnight2.x = markX
							bKnight2.y = markY
						end
				elseif(distx<disty and bKnight2.x>markXM and bKnight2.x<markXP)then
						if(math.abs(markY-event.y)<83) then
							bKnight2.y = event.y
								if(math.abs(markX-event.x)<46) then
									bKnight2.x = event.x
								else
									bKnight2.x = markX
									bKnight2.y = markY
								end
						else
							bKnight2.x = markX
							bKnight2.y = markY
						end
				end    		
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()bKnight2:addEventListener("touch", touchListenerBKN2)end)

		function touchListenerBB1(event)
		 if whiteTurn then
		 	return
		 end
		 if event.phase == "began" then
		 currentColour = "black"
    	   	display.getCurrentStage():setFocus(bBishop1) 
    	    markX = bBishop1.x    -- store x location of object
    	    markY = bBishop1.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   					bBishop1.x=event.x
   					bBishop1.y=markY-(markX-event.x)
					if(markX<event.x  and markY<event.y) then
    	 				bBishop1.x=event.x
    	 				bBishop1.y=markY+(event.x-markX)
    	 			end
					if(markX>event.x  and markY<event.y) then
			   			bBishop1.x=event.x
			   			bBishop1.y=markY+(markX-event.x)
					end
					if(markX<event.x  and markY>event.y) then
    	 				bBishop1.x=event.x
    	 				bBishop1.y=markY-(event.x-markX)
    	 			end
					if(markX>event.x  and markY>event.y) then
			   			bBishop1.x=event.x
			   			bBishop1.y=markY-(markX-event.x)
					end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()bBishop1:addEventListener("touch", touchListenerBB1)end)

		function touchListenerBB2(event)
		 if whiteTurn then 
		 	return
		 end
		 if event.phase == "began" then
		 currentColour = "black"
    	   	display.getCurrentStage():setFocus(bBishop2) 
    	    markX = bBishop2.x    -- store x location of object
    	    markY = bBishop2.y    -- store y location of object
    	
   			elseif event.phase == "moved" then
   					bBishop2.x=event.x
   					bBishop2.y=markY-(markX-event.x)
					if(markX<event.x  and markY<event.y) then
    	 				bBishop2.x=event.x
    	 				bBishop2.y=markY+(event.x-markX)
    	 			end
					if(markX>event.x  and markY<event.y) then
			   			bBishop2.x=event.x
			   			bBishop2.y=markY+(markX-event.x)
					end
					if(markX<event.x  and markY>event.y) then
    	 				bBishop2.x=event.x
    	 				bBishop2.y=markY-(event.x-markX)
    	 			end
					if(markX>event.x  and markY>event.y) then
			   			bBishop2.x=event.x
			   			bBishop2.y=markY-(markX-event.x)
					end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()bBishop2:addEventListener("touch", touchListenerBB2)end)

		function touchListenerBQ(event)
		 if whiteTurn then
		 	return
		 end
		 if event.phase == "began" then
		 currentColour = "black"
    	   	display.getCurrentStage():setFocus(bQueen) 
    	    markX = bQueen.x    -- store x location of object
    	    markY = bQueen.y    -- store y location of object
    		markXM = markX-20
    	    markXP = markX+20
    	    markYM = markY-20
			markYP = markY+20
   			elseif event.phase == "moved" then
				distx=math.abs(markX-event.x);
				disty=math.abs(markY-event.y);
				if(distx>disty and bQueen.y>markYM and bQueen.y<markYP)then
						bQueen.x = event.x
				elseif(distx<disty and bQueen.x>markXM and bQueen.x<markXP)then
						bQueen.y = event.y
				elseif(markX<event.x and markY>event.y) then
					bQueen.x=event.x
   					bQueen.y=markY-(markX-event.x)
    	 			bQueen.x=event.x
    	 			bQueen.y=markY-(event.x-markX)
				elseif(markX>event.x and markY>event.y) then
					bQueen.x=event.x
					bQueen.y=markY-(markX-event.x)
			   		bQueen.x=event.x
			   		bQueen.y=markY-(markX-event.x)
			   	elseif(markX<event.x and markY<event.y) then
					bQueen.x=event.x
					bQueen.y=markY-(markX-event.x)
					bQueen.x=event.x
					bQueen.y=markY+(event.x-markX)
				elseif(markX>event.x and markY<event.y) then
					bQueen.x=event.x
					bQueen.y=markY-(markX-event.x)
					bQueen.x=event.x
					bQueen.y=markY+(markX-event.x)
				end 
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()bQueen:addEventListener("touch", touchListenerBQ)end)

		function touchListenerBK(event)
		  if whiteTurn then
		 	return
		 end
		 if event.phase == "began" then
		 currentColour = "black"
    	   	display.getCurrentStage():setFocus(bKing) 
    	    markX = bKing.x    -- store x location of object
    	    markY = bKing.y    -- store y location of object
    		markXM = markX-20
    	    markXP = markX+20
    	    markYM = markY-20
			markYP = markY+20
   			elseif event.phase == "moved" then
				distx=math.abs(markX-event.x);
				disty=math.abs(markY-event.y);
				if(distx>disty and bKing.y>markYM and bKing.y<markYP)then
						if(math.abs(markX-event.x)<46) then
							bKing.x = event.x
						else
							bKing.x = markX
							bKing.y = markY
						end
				elseif(distx<disty and bKing.x>markXM and bKing.x<markXP)then
						if(math.abs(markY-event.y)<46) then
							bKing.y = event.y
						else
							bKing.x = markX
							bKing.y = markY
						end
				elseif(markX<event.x and markY>event.y) then
					if(math.abs(markX-event.x)<45 or math.abs(markY-event.y)<45) then
						bKing.x=event.x
   						bKing.y=markY-(markX-event.x)
    	 				bKing.x=event.x
    	 				bKing.y=markY-(event.x-markX)
    	 			else
						bKing.x = markX
						bKing.y = markY
					end
				elseif(markX>event.x and markY>event.y) then
					if(math.abs(markX-event.x)<45 or math.abs(markY-event.y)<45) then
						bKing.x=event.x
						bKing.y=markY-(markX-event.x)
			   			bKing.x=event.x
			   			bKing.y=markY-(markX-event.x)
    	 			else
						bKing.x = markX
						bKing.y = markY
					end
			   	elseif(markX<event.x and markY<event.y) then
					if(math.abs(markX-event.x)<45 or math.abs(markY-event.y)<45) then
						bKing.x=event.x
						bKing.y=markY-(markX-event.x)
						bKing.x=event.x
						bKing.y=markY+(event.x-markX)
    	 			else
						bKing.x = markX
						bKing.y = markY
					end
				elseif(markX>event.x and markY<event.y) then
					if(math.abs(markX-event.x)<45 or math.abs(markY-event.y)<45) then
						bKing.x=event.x
						bKing.y=markY-(markX-event.x)
						bKing.x=event.x
						bKing.y=markY+(markX-event.x)
    	 			else
						bKing.x = markX
						bKing.y = markY
					end
				end
    		elseif event.phase == "ended" or event.phase == "cancelled"  then
    		whiteTurn=true;
    		blackTurn=false
    		display.getCurrentStage():setFocus( nil )
    		audio.play(PieceSound)
    		end
    	return true
    	end
		pcall(function()bKing:addEventListener("touch", touchListenerBK)end)
	end
	function turnListener(event)
		if whiteTurn == true then
			
			whiteMove()
		--pcall(function()
		--	bPawn1:removeEventListener("touch", touchListenerBP1)
		--	bPawn2:removeEventListener("touch", touchListenerBP2)
		--	bPawn3:removeEventListener("touch", touchListenerBP3)
		--	bPawn4:removeEventListener("touch", touchListenerBP4)
		--	bPawn5:removeEventListener("touch", touchListenerBP5)
		--	bPawn6:removeEventListener("touch", touchListenerBP6)
		--	bPawn7:removeEventListener("touch", touchListenerBP7)
		--	bPawn8:removeEventListener("touch", touchListenerBP8)
		--	bRook1:removeEventListener("touch", touchListenerBR1)
		--	bRook2:removeEventListener("touch", touchListenerBR2)
		--	bBishop1:removeEventListener("touch", touchListenerBB1)
		--	bBishop2:removeEventListener("touch", touchListenerBB2)
		--	bKnight1:removeEventListener("touch", touchListenerBKN1)
		--	bKnight2:removeEventListener("touch", touchListenerBKN2)
		--	bQueen:removeEventListener("touch", touchListenerBQ)
		--	bKing:removeEventListener("touch", touchListenerBK)
		--	print("successfully removed black event listeners")
		--end)
		-- 
		elseif blackTurn == true then
			blackMove()
		--	pcall(function()
		--		bPawn1:addEventListener("touch", touchListenerBP1)
		--		bPawn2:addEventListener("touch", touchListenerBP2)
		--		bPawn3:addEventListener("touch", touchListenerBP3)
		--		bPawn4:addEventListener("touch", touchListenerBP4)
		--		bPawn5:addEventListener("touch", touchListenerBP5)
		--		bPawn6:addEventListener("touch", touchListenerBP6)
		--		bPawn7:addEventListener("touch", touchListenerBP7)
		--		bPawn8:addEventListener("touch", touchListenerBP8)
		--		bRook1:addEventListener("touch", touchListenerBR1)
		--		bRook2:addEventListener("touch", touchListenerBR2)
		--	    bBishop1:addEventListener("touch", touchListenerBB1)
		--		bBishop2:addEventListener("touch", touchListenerBB2)
		--		bKnight1:addEventListener("touch", touchListenerBKN1)
		--		bKnight2:addEventListener("touch", touchListenerBKN2)
		--	   	bQueen:addEventListener("touch", touchListenerBQ)
		--	    bKing:addEventListener("touch", touchListenerBK)
		    --wPawn1:removeEventListener("touch", touchListenerWP1)
			--wPawn2:removeEventListener("touch", touchListenerWP2)
			--wPawn3:removeEventListener("touch", touchListenerWP3)
			--wPawn4:removeEventListener("touch", touchListenerWP4)
			--wPawn5:removeEventListener("touch", touchListenerWP5)
			--wPawn6:removeEventListener("touch", touchListenerWP6)
			--wPawn7:removeEventListener("touch", touchListenerWP7)
			--wPawn8:removeEventListener("touch", touchListenerWP8)
			--wRook1:removeEventListener("touch", touchListenerWR1)
			--wRook2:removeEventListener("touch", touchListenerWR2)
		    --wBishop1:removeEventListener("touch", touchListenerWB1)
			--wBishop2:removeEventListener("touch", touchListenerWB2)
			--wKnight1:removeEventListener("touch", touchListenerWKN1)
			--wKnight2:removeEventListener("touch", touchListenerWKN2)
		   	--wQueen:removeEventListener("touch", touchListenerWQ)
		    --wKing:removeEventListener("touch", touchListenerWK)
		--    	print("successfully removed white
		--    	 event listeners")
		--	end)
		end
	end
	Runtime:addEventListener( "enterFrame", turnListener)
	audio.play(BackgroundMusic, {loops =- 1});
end
startGame()