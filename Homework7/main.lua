require("L5")

local circleCount = 20
local circleOffset = (circleCount / 2)

local squareCount = 9
local squareOffset = 20
local squareRow = 0
local squareXPosition = 0

local rotation = 0

function setup()
    size(700, 500)
    background(250)

    -- Draw left side
    push()
    translate(width/4,height/2)
    scale(2, 2)
    noStroke()

    ellipseMode(CENTER)
    fill(random(0, 100))
    circle(0,0,30)

    ellipseMode(CORNER)
    for i = 0, circleCount * circleOffset, circleOffset do
        fill(random(255), random(255), random(255))
        rotate((circleOffset * i) / 360)
        strokeWeight(5)
        ellipse(0,0, 50, 45)
    end    
    pop()

    -- Draw center line
    push()
    strokeWeight(5)
    line(width/2, 0, width/2, height)
    pop()

    -- Draw right design
    push()
    rectMode(CENTER)
    
    translate(((width/2) + (width/4)) - 25, height / 2)
    scale(2, 2)

    for i = 1, squareCount do
        square(squareXPosition * squareOffset,squareRow,20)
        squareXPosition = squareXPosition + 1
        if i % 3 == 0 then
            squareXPosition = 0
            squareRow = squareRow + 20
        end
    end
    pop()
end