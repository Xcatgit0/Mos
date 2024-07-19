local application = {}
local img = require("Image")
local config = require("config")
local lang = require("Lang")
application.list = {}
function application.create(name, sizeX, sizeY, x,y, LangPath)
    application.list[name] = {}
    application.list[name].name = name
    application.list[name].x = x
    application.list[name].y = y
    application.list[name].sizeX = sizeX
    application.list[name].sizeY = sizeY
    application.list[name].Data = {LangPath = LangPath}
end
function application.remove(name)
  application.list[name] = nil
end
