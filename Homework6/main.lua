require("L5")

-- Circle one
local objectX = 0
local objectY = 200
local objectSize = 20

local directionX = "Right"
local directionY = "Up"

-- Circle two
local objectXTwo = 400
local objectYTwo = 200
local objectSizeTwo = 20

local directionXTwo = "Left"
local directionYTwo = "Down"

local squareX = 100
local squareY = 100

local squareXTwo = 300
local squareYTwo = 300

local squareDir = "Up"
local squareTwoDir = "Down"

local circleSize = 30
local circleState = "Small"

function setup()
    size(400, 400)
end

function draw()
    background(255 - objectX, 0 + objectY, 255 + objectX)
    strokeWeight(7)
    drawBouncyCircle()
    drawBouncyCircleTwo()
    circleThatGetsBiggerAndSmaller()
    fill(0 + objectX, 255 - objectY, 255 + objectX, squareX)
    drawMovieSquare()
    fill(0 + objectX, 255 - objectY, 255 + objectX, squareXTwo)
    drawMovieSquareTwo()
    
end

function drawBouncyCircle()
    fill(0 + objectX, 255 - objectY, 255 + objectX)

    -- Set direction when it hits the wall
    if objectX > 399 and directionX ~= "Left" then
        directionX = "Left"
        --if directionY == "Up" then directionY = "Down" end
        --if directionY == "Down" then directionY = "Up" end
    end

    if objectX < 1 and directionX ~= "Right" then
        directionX = "Right"
        --if directionY == "Up" then directionY = "Down" end
        --if directionY == "Down" then directionY = "Up" end
    end

    -- Vertical Direction
    if directionY == "Up" and objectY < 1 then
        directionY = "Down"
    end

    if directionY == "Down" and objectY > 399 then
        directionY = "Up"
    end

    -- Apply actual motion
    if directionX == "Right" then
        objectX = objectX + 1
    else
        objectX = objectX - 1
    end

    if directionY == "Down" then
        objectY = objectY + 1
    else
        objectY = objectY - 1
    end

    objectSize = objectX

    -- Draw the object
    circle(objectX, objectY, objectSize)
end

function drawBouncyCircleTwo()
    fill(0 + objectXTwo, 255 - objectYTwo, 255 + objectXTwo)

    -- Set direction when it hits the wall
    if objectXTwo > 399 and directionXTwo ~= "Left" then
        directionXTwo = "Left"
        --if directionY == "Up" then directionY = "Down" end
        --if directionY == "Down" then directionY = "Up" end
    end

    if objectXTwo < 1 and directionXTwo ~= "Right" then
        directionXTwo = "Right"
        --if directionY == "Up" then directionY = "Down" end
        --if directionY == "Down" then directionY = "Up" end
    end

    -- Vertical Direction
    if directionYTwo == "Up" and objectYTwo < 1 then
        directionYTwo = "Down"
    end

    if directionYTwo == "Down" and objectYTwo > 399 then
        directionYTwo = "Up"
    end

    -- Apply actual motion
    if directionXTwo == "Right" then
        objectXTwo = objectXTwo + 1
    else
        objectXTwo = objectXTwo - 1
    end

    if directionYTwo == "Down" then
        objectYTwo = objectYTwo + 1
    else
        objectYTwo = objectYTwo - 1
    end

    objectSizeTwo = objectXTwo

    -- Draw the object
    circle(objectXTwo, objectYTwo, objectSizeTwo)
end



function drawMovieSquare()
    -- Top left of movement
    if squareX == 100 and squareY == 100 then
        squareDir = "Right"
    end
    -- Top right
    if squareX == 300 and squareY == 100 then
        squareDir = "Down"
    end
    -- Bottom right
    if squareX == 300 and squareY == 300 then
        squareDir = "Left"
    end
    -- Bottom left
    if squareX == 100 and squareY == 300 then
        squareDir = "Up"
    end

    if squareDir == "Right" then
        squareX = squareX + 1
    end
    if squareDir == "Down" then
        squareY = squareY + 1
    end
    if squareDir == "Up" then
        squareY = squareY - 1
    end
    if squareDir == "Left" then
        squareX = squareX - 1
    end

    square(squareX, squareY, 60, 5)
end

function drawMovieSquareTwo()
    -- Top left of movement
    if squareXTwo == 100 - 60 and squareYTwo == 100 then
        squareTwoDir = "Right"
    end
    -- Top right
    if squareXTwo == 300 and squareYTwo == 100 then
        squareTwoDir = "Down"
    end
    -- Bottom right
    if squareXTwo == 300 and squareYTwo == 300 then
        squareTwoDir = "Left"
    end
    -- Bottom left
    if squareXTwo == 100 - 60 and squareYTwo == 300 then
        squareTwoDir = "Up"
    end

    if squareTwoDir == "Right" then
        squareXTwo = squareXTwo + 1
    end
    if squareTwoDir == "Down" then
        squareYTwo = squareYTwo + 1
    end
    if squareTwoDir == "Up" then
        squareYTwo = squareYTwo - 1
    end
    if squareTwoDir == "Left" then
        squareXTwo = squareXTwo - 1
    end
    square(squareXTwo, squareYTwo, 60, 5)
end

function circleThatGetsBiggerAndSmaller()
    if circleSize < 20 and circleState == "Small" then
        circleState = "Big"
    end
    if circleSize > 50 and circleState == "Big" then
        circleState = "Small"
    end

    if circleState == "Big" then
        circleSize = circleSize + 1
    end
    if circleState == "Small" then
        circleSize = circleSize - 1
    end

    circle(width / 2, height / 2, circleSize)

end