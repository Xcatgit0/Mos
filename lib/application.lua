local application = {}
local img = require("Image")
local config = require("config")
local lang = require("Lang")
application.list = {}
function application.create(name, sizeX, sizeY, x,y, LangPath)
    local create = load("return {name = "..name..",LangPath="..LangPath..",x="..x..",y="..y..",Data={}}")
    application.list[name] = create()
end
return application