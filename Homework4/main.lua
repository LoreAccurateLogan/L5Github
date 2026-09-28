require("L5")


-- Circle Variables
local circleCount = 64
local circleSpacing = 10
local circleMinSize = 5
local circleMaxSize = 30

local horizonHeight = 240

-- Fish Variables
local fishCount = 10

local screenWidth = 640
local screenHeight = 480

function setup()
    -- Set screen size
    size(screenWidth, screenHeight)

    -- Draw the scene from the drawScene function
    drawScene()
end

-- Draws the scene whenever the mouse is clicked (it's a built in L5 function I found)
function mouseClicked()
    drawScene()
end

function drawScene()
    -- Set background
    background(120, 185, 240)

    -- Disable the stroke
    noStroke()

    -- Draw the circles
    drawCircles()
    
    -- Draw fish
    fill(255)
    drawFish()

    -- Reset scene instructions
    text("Click to randomize the scene", 10, 460)

    -- Slightly transparent overlay
    fill(0,0,255,40)
    rect(0,0,640,480)
    
end

function drawGradient()
    local startingX = random(640)
    local startingY = random(480)

    beginShape(TRIANGLES)
    vertex(startingX, startingY)
    vertex(startingX + random(-50, 50), startingY + random(-50, 50))
    vertex(startingX + random(-100, 100), startingY + random(-100, 100))
    vertex(startingX + random(-150, 150), startingY + random(-150, 150))
    vertex(startingX + random(-200, 200), startingY + random(-200, 200))
    endShape(CLOSE)
end

function drawCircles()
    for i = 0, circleCount do
        -- if i is equal to the amount of circleCount then end the loop
        if i == circleCount then break end

        -- Iterate through the circleCount
        -- 0 for false, 1 for true
        local placeCircle = random(0, 1)
        local randomSize = random(circleMinSize, circleMaxSize)

        -- If placeCircle is false then don't continue
        if (placeCircle == 0) then return end

        -- Randomize the color
        fill(random(0, 90), random(0,180), random(185, 255), random(50, 100))

        -- Draw the circles in random places with the set spacing 
        circle(random(width) + circleSpacing, random(height) + circleSpacing, randomSize) 
    end
end

function drawFish()
    for i=0, fishCount do
        local fishX = random(160, 480)
        local fishY = random(120, 360)
        local fishW = random(30, 70)
        local fishH = random(10, 50)

        local tailW = random(20, 40)
        local tailH = random(7, 30)
        
        -- Position for the tail, it is at the third quarter of the fish
        local fishTailStartPos = fishX + (fishW * 0.25)

        local fishEyeStartPos = fishX - (fishW * 0.25)

        fill(random(255), random(100, 255), random(255))

        -- Draw tail
        triangle(fishTailStartPos, fishY, fishTailStartPos + tailW, fishY + tailH, fishTailStartPos + tailW, fishY - tailH)

        -- Draw body
        ellipse(fishX, fishY, fishW, fishH)

        -- Draw eye
        fill(0)
        circle(fishEyeStartPos, fishY, 10)
    end
    
end

