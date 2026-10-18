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
    noStroke()
    rectMode(CORNER)
    ellipseMode(CORNER)
    
    translate(((width/2) + (width/4)) - 200, height / 2 - 125)

    scale(4, 4)

    for i = 1, squareCount do
        squareXPosition = squareXPosition + 1

        -- Draw square every even number
        if i % 2 == 0 then
            fill(0, 120, 191)
            square(squareXPosition * squareOffset,squareRow,20)    
        
        -- Draw circle every odd number
        else
            fill(255, 72, 176)
            circle(squareXPosition * squareOffset, squareRow, 20)
        end

        -- If i is divisible by three then start a new row
        if i % 3 == 0 then
            squareXPosition = 0
            squareRow = squareRow + 20
        end
    end
    pop()
end