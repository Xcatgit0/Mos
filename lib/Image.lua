local image = {}
local fs = require("filesystem")
local serialization = require("serialization")
local component = require("component")
local gpu = component.gpu

function image.createPic(width, height, filePath)
  local pic = {}
  for y = 1, height do
    pic[y] = {}
    for x = 1, width do
      pic[y][x] = 0xFFFFFF
    end
  end
  local file = io.open(filePath, "wb")
  file:write(serialization.serialize(pic))
  file:close()
end

function image.readPic(filePath)
  local file = io.open(filePath, "rb")
  local content = file:read("*a")
  file:close()
  return serialization.unserialize(content)
end

function image.modifyPixel(filePath, x, y, color)
  local pic = image.readPic(filePath)
  if pic[y] and pic[y][x] then
    pic[y][x] = color
    local file = io.open(filePath, "wb")
    file:write(serialization.serialize(pic))
    file:close()
  else
    print("position error")
  end
end

function image.drawPic(filePath, startX, startY)
  local pic = image.readPic(filePath)
  for y, row in ipairs(pic) do 
    for x, color in ipairs(row) do
      gpu.setForeground(color)
      gpu.set(startX + x - 1, startY + y - 1, "█")
    end
  end
end

return image