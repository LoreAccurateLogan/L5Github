require("L5")

local font -- Global font variable

local prophecyRandom = {"prophesied", "prophesized"}

local nameArray = {"Bob", "Joe", "Tim", "Vincent", "Linda", "Martha", "Trisha", "Sans Undertale", "Torg", "Ron", "Cirbus", "Fulugal", "Eduard", "Eduardo", "Twimble", "John Kaisen", "Marvin", "McLovin", "Roy the IV of England", "Mufasa", "Scar", "Pauul Blaaart", "Joe Earth", "Joe, Destroyer of Earth", "Ned", "Nedward", "Squidholdtheward", "Ward, Hold the Squid", "Ceymore Buhts", "Sealess Buhts", "Mike Raphone", "Jonesy", "Febuary", "June", "Stacy", "Wingardian Leviosa", "Kefir"}
local jobArray = {"Plumber", "Industry Plant", "Model", "Space Person", "Space Alien", "Communist", "Grocery Bagger", "Grocery Bagger Attendant", "Grocery Bagger Attendant Supervisor", "President Grocery Bagger", "Diplomat of McDonald’s", "Keyboard Warrior", "War Chief of Wendy’s", "Gold Digger", "Trouser Model", "Sleep Model", "Flex Tape Representative Camera Person", "Fake Mustache Model", "Literal Mouse (not the one that watches you in your sleep)", "spider that goes in your mouth everynight", "Grafitti Enthusiast", "Student", "Reddit Moderator", "Discord Moderator", "The guy who offered candy to…people", "Supreme Justice Moderator", "Powdered Wig Enthusiast", "Powderer of Wigs", "Job Idea Maker"}
local adjectiveArray = {"HARD", "SMELLY", "TEDIOUS", "AURA", "DANTY", "ADJECTIVE", "POOPY", "VERB", "HAIRY", "GOOFY", "SPOOFY", "LONG", "SHORT", "ABOVE AVERAGE LENGTH", "BELOW AVERAGE LENGTH", "SAD", "SUPER SAD", "SUPER SHY", "GUT-WRENCHING", "DEPRESSING", "STUPENDOUS", "HelveticaTM", "ArialTM", "TIMES NEW ROMAN 12 PT. FONT", "CANVAS DYSLEXIA FRIENDLY FONT", "EASY"}

local protagonistName = random(nameArray)
local protagonistJob = random(jobArray)

local kidnapperName = random(nameArray)
local heroName = random(adjectiveArray).." HERO "..random(nameArray)
local sidekickName = random(adjectiveArray).." SIDEKICK "..random(nameArray)

local prophecyPersonName = random(adjectiveArray).." "..random(jobArray).." "..random(nameArray)

-- The story
local messageArray = {
	"Hello my name is "..protagonistName..".",
	"I work as a "..protagonistJob..".",
	"Working as a "..protagonistJob.." is pretty "..random(adjectiveArray)..".",
    "But, besides my "..random(adjectiveArray).." job...",
    "I am in trouble.",
	"I have kidnapper, their name is "..kidnapperName,
    kidnapperName.." has been REALLY mean.",
    "Supposedly they work as a "..random(jobArray).." during the day...",
    "makes sense honestly...",
    "but my kidnapping was "..random(prophecyRandom).." by "..prophecyPersonName.." last week.",
    "They knew this would happen...",
    "I SHOULD'VE LISTENED TO THEM!!",
    "but there is hope.",
    heroName.." is the hero I am looking for!",
    "They will save the day!",
    "but there's something wrong...",
    kidnapperName.." is looking for them!",
    "Will "..heroName.." save me or will "..kidnapperName.." succeed in kidnapping me?",
    kidnapperName..": 'Oh shut up! You aren't supposed to be talking "..protagonistName.."!'",
    protagonistName..": 'You shut up! You are interupting my monologue!'",
    kidnapperName..": 'Well your monologue is "..random(adjectiveArray).."!'",
    protagonistName..": 'You take that back "..kidnapperName.."!'",
    kidnapperName..": 'No.'",
    heroName.." ENTERS THE SCENE!",
    heroName..": 'I'm here to help!'",
    kidnapperName..": 'No.'",
    heroName..": 'You can't just say 'No' to that.'",
    kidnapperName..": 'Yes.'",
    heroName..": 'Wait. Do you mean no or yes?'",
    kidnapperName..": 'Maybe.'",
    protagonistName..": 'It's useless "..heroName.." you can never defeat "..kidnapperName.." *sobs*'",
    heroName..": 'I can't do it alone...I NEED MY SIDEKICK!'",
    heroName..": 'COME ON OUT!'",
    sidekickName.." ENTERS THE SCENE!",
    sidekickName..": 'Hi, I'm "..sidekickName.."!'",
    heroName..": 'We're gonna need to end this now!'",
    sidekickName..": 'Yeah! This assignment is NOT supposed to be a big project!'",
    protagonistName..": 'Yeah, I do have other things I need to do..."..random(adjectiveArray).." things...'",
    kidnapperName..": 'Oh, okay, I'll surrender then.'",
    "[ THE END ]"
}

-- Number to iterate each click (instead of a for loop doing it all at once)
local iterationNum = 1

local screenWidth = 1280
local screenHeight = 720

function setup()
    font = loadFont("fonts/arial_narrow_7.ttf")
    size(screenWidth,screenHeight)
    background(0)
    generateSentence()
end

function mouseClicked()
    background(0)
    generateSentence()
end

function generateSentence()
    textFont(font, 20)
    textAlign(CENTER)
    strokeWeight(20)
    text(messageArray[iterationNum], screenWidth/2, screenHeight/2)

    -- Exit the game if the iterationNum is bigger than the amount of entries in messageArray
    if iterationNum > #messageArray then
        exit()
    end
    iterationNum = iterationNum + 1
end