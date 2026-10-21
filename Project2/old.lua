require("L5")

local screenWidth = 500
local screenHeight = 500

local previousPositionX = 0 -- starting position X that gets updated
local previousPositionY = 0 -- starting position Y that gets updated

local currentAmountOfShapeInRow = 0

local shapesPerRow = 27
local columns = 5

local shapeOffsetX = screenWidth / shapesPerRow
local shapeOffsetY = screenHeight / columns


function setup()
    noStroke()
    size(screenWidth, screenHeight)
    drawShape()
end

function mouseClicked()
    -- Reset Y position variable before generation
    previousPositionY = 0
    drawShape()
end

function drawShape()
    for y=0, columns do
        for i=0, shapesPerRow do
            local centerX = previousPositionX
            local centerY = previousPositionY
            --rgb(146, 114, 92)

            local fillColor = random(50, 255)
            local scale = random(5, 70)

            local doFill = false

            -- Deep black
            if fillColor < 100 then
                fill(27, 28, 51)
                scale = 500
            elseif fillColor < 175 then
                fill(10, 10, 49)
                scale = 500
            elseif fillColor > 175 and fillColor < 250 then
                fill(53, 53, 86)
                scale = 500
            elseif fillColor > 250 then
                fill(226, 0, 40)
                scale = 500
            end

            rect(centerX, centerY, (screenWidth / shapesPerRow) * scale, (screenHeight / columns) * scale, 40)

            previousPositionX = previousPositionX + (shapeOffsetX)
            -- Create the shapes at different offsets in the row
        end
        previousPositionY = previousPositionY + shapeOffsetY
        previousPositionX = 0
    end
    
end