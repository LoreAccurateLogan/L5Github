require("L5")

local screenWidth = 1280
local screenHeight = 720
local buildingCount = 10
local buildingWidth = 250
local buildingHeight = 600

--local buildingColor = (237, 45, 120)
--local shadowColor = (67, 22, 39)

function setup()
    size(screenWidth, screenHeight)
    background(27, 30, 33)

    drawBetterBuildings(0, screenHeight + 230) -- 950

    drawBetterBuildings(1100, screenHeight + 230)

    drawBetterBuildings(730, screenHeight + 130)

    drawBetterBuildings(100, screenHeight + 180) -- 900
    
    drawBetterBuildings(900, screenHeight + 5)

    drawBetterBuildings(450, screenHeight + 30)

    drawBetterBuildings(700, 900)

    drawBetterBuildings(250, 800)
    --drawBetterBuildings(850)
    --drawBetterBuildings(1000)
end

function drawBetterBuildings(xPos, yPos)
    -- Draw the buildings at random positions
    local buildingCenterX = xPos
    local buildingCenterY = yPos - buildingHeight

    local buildingCenterPosition = buildingCenterX + 75
    
    --local buildingCenterPosition = buildingCenterX + random(buildingWidth / 2, buildingWidth / 2 + buildingWidth / 4)

    noStroke()

    -- Apply buildingColor
    fill(80, 85, 91)

    -- First vertex shape
    beginShape()
    -- Starts from top left
    vertex(buildingCenterX, buildingCenterY)
    -- Draws to the center (center position will change based on distance from center of screen)
    vertex(buildingCenterPosition, buildingCenterY - 10)
    --vertex(buildingCenterX + (buildingWidth / 2), buildingCenterY - 10)
    -- Draws down from center
    vertex(buildingCenterPosition, buildingCenterY + buildingHeight)
    -- Draws to the bottom left
    vertex(buildingCenterX, buildingCenterY + buildingHeight)

    endShape(CLOSE)

    -- Apply shadowColor
    fill(67, 22, 39)

    -- Second vertex shape
    beginShape()
    -- Starts from the center
    vertex(buildingCenterPosition, buildingCenterY - 10)
    --vertex(buildingCenterX + (buildingWidth / 2), buildingCenterY - 10)
    -- Draws to the top right
    vertex(buildingCenterX + buildingWidth, buildingCenterY)
    -- Draws down from the right
    vertex(buildingCenterX + buildingWidth, buildingCenterY + buildingHeight)
    -- Draws to the bottom center
    vertex(buildingCenterPosition, buildingCenterY + buildingHeight)
    endShape(CLOSE)

    -- Plane guidance lights
    fill(255,0,0)
    circle(buildingCenterX + buildingWidth, buildingCenterY, 8)
    circle(buildingCenterX, buildingCenterY, 8)
    circle(buildingCenterPosition, buildingCenterY - 10, 8)

    
-------------------------

    -- Starts from top left
    --vertex(buildingCenterX, buildingCenterY)
    -- Draws to the center
    --vertex(buildingCenterX + (buildingWidth / 2), buildingCenterY - 10)
    -- Draws to the top right
    --vertex(buildingCenterX + buildingWidth, buildingCenterY)
    -- Draws downward
    --vertex(buildingCenterX + buildingWidth, buildingCenterY + buildingHeight)
    -- Draws to the bottom left
    --vertex(buildingCenterX, buildingCenterY + buildingHeight)
    -- Back to top left
    --vertex(buildingCenterX, buildingCenterY)
    -- Draws to center at the bottom
    --vertex(buildingCenterX + (buildingWidth / 2), buildingCenterY + buildingHeight)
    -- Draws up to the center
    --vertex(buildingCenterX + (buildingWidth / 2), buildingCenterY - 10)
    -- Diagonal line to bottom left
    --vertex(buildingCenterX, buildingCenterY + buildingHeight)
    -- Back to top left
    --vertex(buildingCenterX, buildingCenterY)
    -- Draws back to center at the bottom
    ---vertex(buildingCenterX + (buildingWidth / 2), buildingCenterY + buildingHeight)
    -- Line to bottom left
    --vertex(buildingCenterX, buildingCenterY + buildingHeight)
    



end

function drawWindow()
    
end

function drawBuildings()
    for i = 0, buildingCount do
        -- Draw the buildings at random positions
        local buildingCenterX = random(screenWidth)
        local buildingCenterY = random(screenHeight)

        -- The point that the left side connects to
        local leftBottomSideofBuilding = buildingCenterY + buildingHeight

        strokeWeight(2)
        fill(255)
        -- Draw roof line of building.
        line(buildingCenterX, buildingCenterY, buildingCenterX + buildingWidth, buildingCenterY)

        -- Draw left side of building.
        line(buildingCenterX, buildingCenterY, buildingCenterX, buildingCenterY + buildingHeight)

        -- Draw right side of building.
        line(buildingCenterX + buildingWidth, buildingCenterY, buildingCenterX + buildingWidth, buildingCenterY + buildingHeight)

        -- Variable that chooses an X position for the 3D effect line based on the position to the center of the screenWidth.
        local ThreeDimensionalLineXPosition = 25
        
        -- Check if buildingCenterX is on the right side of the screen
        if buildingCenterX > screenWidth / 2 then
           ThreeDimensionalLineXPosition = random((buildingWidth / 2) + (buildingWidth / 4), buildingWidth)
        else
            ThreeDimensionalLineXPosition = random((buildingWidth / 2) - (buildingWidth / 4), 0)
        end

        -- Draw line that will make it look 3D based on the position it is compared to the center
        line(buildingCenterX + ThreeDimensionalLineXPosition, buildingCenterY, buildingCenterX + ThreeDimensionalLineXPosition, buildingCenterY + buildingHeight)
    end
end