require("L5")

local font

local pose

local screenSize = 500

local player = {
    x = 0, -- x position
    y = 0, -- y position
    w = 10, -- width
    h = 10 -- height
}

local notInfectedFaces = {
    'assets/People/man.png',
    'assets/People/ryan.png',
    'assets/People/holland.png',
    'assets/People/pose.png'
}

local infectedFaces = {
    'assets/People/Zman.png',
    'assets/People/Zryan.png',
    'assets/People/Zholland.png',
    'assets/People/Zpose.png'
}

local imageIndex = 1

local humans = {}

local humanCount = 5

local humanDirectionChangeCooldownDefault = 240
local humanDirectionChangeCooldown = 240

local directions = {"left", "right", "up", "down"}

function setup()
    size(screenSize, screenSize)
    angleMode(DEGREES)
    rectMode(CENTER)

    font = loadFont('assets/VCR_OSD_MONO.ttf')

    -- Add the humanCount amount of human objects to the human table
    for i = 1, humanCount do
        imageIndex = random(3)
        local newHuman = {
            x = random(screenSize),
            y = random(screenSize),
            w = 100,
            h = 100,
            dir = "right",
            c = 0,
            infected = false
        }
        table.insert(humans, newHuman)
    end
end

function draw()
    background(255)

    textFont(font)
    textSize(20)
    textAlign(CENTER,TOP)
    fill(0)
    text('Infect all the humans!',250,50)

    playerMovement()

    checkCollisions()

    for i = 1, #humans do
        fill(0, humans[i].c, 0)
        drawHuman(humans[i].x, humans[i].y)
    end

    push()
    translate(player.x, player.y)
    scale(0.5, 0.5)
    noStroke()
    drawDog()
    pop()
    --circle(player.x, player.y, 10)
end

function drawHuman(hX, hY)
    circle(hX, hY, 10)
end

function playerMovement()
    if keyIsDown("left") or keyIsDown("a") then
        player.x = player.x - 1
    end

    if keyIsDown("right") or keyIsDown("d") then
        player.x = player.x + 1
    end

    if keyIsDown("up") or keyIsDown("w") then
        player.y = player.y - 1
    end

    if keyIsDown("down") or keyIsDown("s") then
        player.y = player.y + 1
    end
end

function drawDog()
    -- leg 1
    fill(73, 122, 61)
    rect(-28, 39, 10, 40)
    -- leg 2
    fill(73, 122, 61)
    rect(-5, 39, 10, 40)
    -- leg 3
    fill(73, 122, 61)
    rect(10, 39, 10, 40)
    -- leg 3
    fill(73, 122, 61)
    rect(35, 39, 10, 40)
    -- tail
    fill(28, 48, 23)
    ellipse(40, -20, 70, 10)
    -- body
    fill(40, 82, 30)
    circle(0, 0, 100)
    -- head
    fill(73, 122, 61)
    ellipse(-50, -40, 80, 50)
    -- nose
    fill(28, 48, 23)
    ellipse(-56, -26, 20, 10)
    -- eye 1
    fill(219, 33, 54)
    ellipse(-40, -40, 10, 10)
    -- eye 2
    fill(219, 33, 54)
    ellipse(-70, -40, 10, 10)
    -- ear 1
    push()
    fill(28, 54, 22)
    rotate(45)
    ellipse(-95, 40, 20, 40)
    pop()
    -- ear 2
    push()
    fill(28, 54, 22)
    rotate(-45)
    ellipse(40, -75, 20, 40)
    pop()
end


function checkCollisions()
    for i = 1, #humans do
        local collisionShapePositiveX = player.x + player.w
        local collisionShapeNegativeX = player.x - player.w

        local collisionShapePositiveY = player.y + player.h
        local collisionShapeNegativeY = player.y - player.h

        if humans[i].x < collisionShapePositiveX and humans[i].x > collisionShapeNegativeX then
            if humans[i].y < collisionShapePositiveY and humans[i].y > collisionShapeNegativeY then
                humans[i].infected = true
            end
        end
    end
end