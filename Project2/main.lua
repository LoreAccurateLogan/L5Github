require("L5")

-- Variables
local screenSize = 500
local objectAmount = 9

local offset = 180
local offsetPositiveNegative = true

local currentX = 0
local currentY = 0

local eyeY = -15

local patternType = random(1, 2)
-- Patterns: 
-- 1 - Uniform
-- 2 - Radial

-- Shape used in the pattern
local patternShape = round(random(1, 2))
-- 1 = Square
-- 2 = Circle
-- 3 = Triangle

-- Images
local borderImage = loadImage("assets/borderCircle.png")

-- Tables
local outerObjectTable = {}
local innerObjectTable = {}
local centerObjectTable = {}

function setup()
    size(screenSize, screenSize)

end

function draw()
    -- Create and add Outer Layer Objects to outerObjectTable
    createOuterLayerObjects()
    drawOuterLayer()
    drawFace()
    image(borderImage, 0, 0)

    fill(0)
    text(""..offset, 30, 30, 60)
    fill(255)
end

function drawFace()
    push()

    -- Set translate to screen center
    translate(screenSize/2, screenSize/2)
    fill(255)

    -- Left eye
    circle(-35, eyeY, 40)
    fill(0)
    circle(-35, eyeY, 30)

    -- Right eye
    fill(255)
    circle(35, eyeY, 40)
    fill(0)
    circle(35, eyeY, 30)

    -- Mouth
    fill(255)
    strokeWeight(5)
    curve(-30, -10, -10, 0, 10, 0, 30, -10)

    pop()
end

function createOuterLayerObjects()
    for i = 1, objectAmount do
        -- Create Object
        local object = {
            x = 0, -- y position
            y = 0, -- x position
            r = 0, -- rotation
            s = 150 -- size
        }
        -- Add object to table
        table.insert(outerObjectTable, object)
    end
end



function drawOuterLayer()
    for i=1, #outerObjectTable do
        local o = outerObjectTable[i]

        -- Make new row when i % 3
        if i % 3 == 1 then
            currentX = 0
            currentY = currentY + offset
        end

        -- Set the position based on the center for the current x and current y
        setPositionBasedOnCenter(i, screenSize / 2)
        o.x = currentX
        o.y = currentY

        push()
        fill(0)
        rectMode(CENTER)
        --translate(screenSize / 2, screenSize / 2)

        -- choose and draw the pattern here.
        if patternShape == 1 then
            square(o.x, o.y, o.s)
        end

        if patternShape == 2 then
            circle(o.x, o.y, o.s)    
        end

        
        

        pop()
        currentX = currentX + offset
    end
end

function setPositionBasedOnCenter(i, centerPos)
    if i == 1 then
        currentX = centerPos - offset
        currentY = centerPos - offset
    end

    if i == 2 then
        currentX = centerPos
        currentY = centerPos - offset
    end

    if i == 3 then
        currentX = centerPos + offset
        currentY = centerPos - offset
    end

    if i == 4 then
        currentX = centerPos - offset
        currentY = centerPos
    end

    if i == 5 then
        currentX = centerPos
        currentY = centerPos
    end

    if i == 6 then
        currentX = centerPos + offset
        currentY = centerPos
    end

    if i == 7 then
        currentX = centerPos - offset
        currentY = centerPos + offset
    end

    if i == 8 then
        currentX = centerPos
        currentY = centerPos + offset
    end

    if i == 9 then
        currentX = centerPos + offset
        currentY = centerPos + offset
    end
end