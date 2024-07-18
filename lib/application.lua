local application = {}
local img = require("Image")
local config = require("config")
local lang = require("Lang")
local application.list = {}
function application.create(name, sizeX, sizeY, x,y, LangPath)
    
end
function application.list.create(name,sizeX,sizeY,x,y)
     application.list[name] = {}
end
return application