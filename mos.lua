local event = require("event")
local component = require("component")
local Gui = require("Gui")
local term = require("term")
local img = require("Image")
img.drawPic("mos.pic",1,1)
local gpu = component.gpu
gpu.setBackground(0x000000)
Gui.drawButton(10, 5, 20, 3, "Start", 0xFF0000, true)
while true do
    local eventType, _, clickX, clickY, button = event.pull()
    if eventType=="touch" and button==0 then
        if Gui.isButtonClicked(10,5,20,3,clickX,clickY) then
            gpu.setBackground(0xFFFFFF)
            gpu.fill(10,5,20,3," ")
            Gui.drawButton(11,6,20,3,"Start!", 0xFF0000)
            require("computer").shutdown(true)
        end
    end
end