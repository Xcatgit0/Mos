local Gui = {}
local component = require("component")
local event = require("event")
local term = require("term")
local gpu = component.gpu

local screenWidth, screenHeight = gpu.getResolution()

function Gui.drawRectangle(x, y, width, height, color)
    gpu.setBackground(color)
    gpu.fill(x, y, width, height, " ")
    gpu.setBackground(0x000000)
end

function Gui.drawButton(x, y, width, height, label, color, shadowButton)
    -- Draw shadow if shadowButton is true
    if shadowButton then
        local shadowColor = 0x555555
        Gui.drawRectangle(x + 1, y + 1, width, height, shadowColor)
    end
    
    -- Draw button
    Gui.drawRectangle(x, y, width, height, color)
    local labelX = x + math.floor((width - #label) / 2)
    local labelY = y + math.floor(height / 2)
    gpu.setForeground(0xFFFFFF)
    gpu.setBackground(color)
    gpu.set(labelX, labelY, label)
    gpu.setForeground(0x000000)
end

function Gui.isButtonClicked(x, y, width, height, clickX, clickY)
    return clickX >= x and clickX < x + width and clickY >= y and clickY < y + height
end

return Gui