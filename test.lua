local image = require("image")
local gpu = require("component").gpu
local name = io.read()
local xx = io.read()
local yy = io.read()
local ran1 = io.read()
local ran2 = io.read()
image.createPic(xx,yy,name)
for x=1,xx do
  for y=1,yy do
    local ran = math.random(ran1,ran2)
    if ran==1 then
      image.modifyPixel(name,x,y,0xFF0000)
      gpu.setForeground(0xFF0000)
      gpu.set(x,y,"█")
    elseif ran==2 then
      image.modifyPixel(name,x,y,0x00FF00)
      gpu.setForeground(0x00FF00)
      gpu.set(x,y,"█")
    elseif ran==3 then
      image.modifyPixel(name,x,y,0x0000FF)
      gpu.setForeground(0x0000FF)
      gpu.set(x,y,"█")
    end
  end
end
require("tty").clear()