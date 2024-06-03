local Gui = require("Gui")
local image = require("Image")
-- Main Program
local buttonX, buttonY, buttonWidth, buttonHeight = 10, 5, 20, 3
local buttonColor = 0x00FF00
local buttonLabel = "Click Me"
local picFilePath = "/home/picture.pic"

-- Create initial picture
image.createPic(30, 15, picFilePath)
image.modifyPixel(picFilePath, 5, 5, 0xFF0000)

-- Draw button
Gui.drawButton(buttonX, buttonY, buttonWidth, buttonHeight, buttonLabel, buttonColor, true)

-- Draw picture
image.drawPic(picFilePath, 1, 10)

-- Event loop to detect button clicks
while true do
    local _, _, clickX, clickY = event.pull("touch")
    if Gui.isButtonClicked(buttonX, buttonY, buttonWidth, buttonHeight, clickX, clickY) then
        print("Button clicked!")
        -- Modify the picture when the button is clicked
        image.modifyPixel(picFilePath, 10, 10, 0x0000FF)
        image.drawPic(picFilePath, 1, 10)
    end
end