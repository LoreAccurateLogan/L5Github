require("L5")

local screenWidth = 1280
local screenHeight = 720

local img = loadImage("assets/SnowyScape.png")

local shapeCount = 700

local shapes = {}

-- Day and night cycle variables
local timeOfDay = 0
local currentTint = 0
-- trigger for making tint go towards 0 (false) or towards 255 (true)
local tintTrigger = true

function setup()
    size(screenWidth, screenHeight)
    image(img, 0, 0, screenWidth, screenHeight)
end

function draw()
    image(img, 0, 0, screenWidth, screenHeight)

    randomizeShapeAndAddToTable()
    moveCirclesDown()
    drawFromTable()

    drawTint()
end

-- Day and night cycle that was completely unnecessary to make but was fun
function drawTint()
    if timeOfDay == 255 then
        timeOfDay = 0
    end

    timeOfDay = timeOfDay + 0.1

    if tintTrigger == true then
        currentTint = currentTint + 0.1
    else
        currentTint = currentTint - 0.1
    end

    if currentTint >= 255 then
        tintTrigger = false
    end

    if currentTint <= 0 then
        tintTrigger = true
    end
    
    push()
    fill(currentTint, 160)
    rect(0,0,1920,1080)
    pop()
end


-- Making snowflake object and adding to a table 
function randomizeShapeAndAddToTable()
    if #shapes >= shapeCount then return end

    for i=0, shapeCount do
        local randomShape = random(0,1)
        local newShape = {
            x=0,
            y=0,
            s=10,
            sp=random(1, 5),
            w=random(200, 255),
            a=random(170, 255)
        }
        newShape.x = random(screenWidth)
        newShape.y = random(screenHeight)
        newShape.s = random(2, 20)

        table.insert(shapes, newShape)
    end
end

-- Moving the snowflakes
function moveCirclesDown()
    for i = 1, #shapes do
        shapes[i].y = shapes[i].y + shapes[i].sp
        shapes[i].x = shapes[i].x + shapes[i].sp
        if shapes[i].y >= screenHeight then
            shapes[i].y = -1
        end
        if shapes[i].x >= screenWidth then
            shapes[i].x = -1
        end
    end
end

-- Drawing the snowflakes
function drawFromTable()
    for i=1, #shapes do
        noStroke()
        fill(shapes[i].w, shapes[i].a)
        circle(shapes[i].x, shapes[i].y, shapes[i].s)
    end
end