require("L5")

-- Variables
local screenSize = 500
local objectAmount = 9

local offset = 180
local currentX = 0
local currentY = 0

local patternType = random(1, 2)
-- Patterns: 
-- 1 - Uniform
-- 2 - Radial

-- Images
local borderImage = loadImage("assets/borderCircle.png")

-- Tables
local outerObjectTable = {}
local innerObjectTable = {}
local centerObjectTable = {}

function setup()
    size(screenSize, screenSize)
    
    -- Create and add Outer Layer Objects to outerObjectTable
    createOuterLayerObjects()
    drawOuterLayer()

    image(borderImage, 0, 0)
end

function draw()
    drawInnerLayer()
    drawCenter()
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

        if i % 3 == 1 then
            currentX = 0
            currentY = currentY + offset
        end

        setPositionBasedOnCenter(i, screenSize / 2)
        o.x = currentX
        o.y = currentY

        push()
        rectMode(CENTER)
        --translate(screenSize / 2, screenSize / 2)

        square(o.x, o.y, o.s)

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


function drawInnerLayer()

end

function drawCenter()

end