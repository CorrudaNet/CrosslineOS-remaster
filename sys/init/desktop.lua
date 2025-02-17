local basalt = require("basalt")

local desktop = basalt.createFrame():setTheme({FrameBG = colors.black, FrameFG = colors.white})

local id = 1
local processes = {}

local function openProgram(path, title, x, y, w, h)
    local pID = id
    id = id + 1
    local f = desktop:addMovableFrame()
        :setSize(w or 30, h or 12)
        :setPosition(x or math.random(2, 12), y or math.random(2,8))
        
        f:addLabel()
             :setSize("parent.w", 1)
             :setBackground(colors.orange)
             :setForeground(colors.white)
             :setText(title or "New Window")
             
             f:addProgram()
                 :setSize("parent.w-1", "parent.h - 2")
                 :setPosition(1,2)
                 :execute(path or "/rom/programs/shell.lua")
                 
                 f:addButton()
                 :setSize(1,1)
                 :setText("X")
                 :setBackground(colors.orange)
                 :setForeground(colors.red)
                 :setPosition("parent.w-1", 1)
                 :onClick(function()
                    f:remove()
                    processes[pID] = nil
                end)
                processes[pID] = f
                return f
                end

desktop:addButton():setPosition("parent.w - 16", 2):setText("Open"):onClick(function()
       openProgram()
   end)
   
openProgram("/.sys/init/about.lua", "About OS", 2, 2)

local warning = desktop:addLabel()
warning:setText("EARLY ALPHA")
warning:setFontSize(1)
warning:setPosition(1, 18)
warning:setForeground(colors.red)

local clock = desktop:addLabel()
clock:setText(os.date())
clock:setFontSize(1)
clock:setPosition(32, 18)
clock:setForeground(colors.white)

local version = desktop:addLabel()
version:setText(os.version())
version:setFontSize(1)
version:setPosition(17, 18)


basalt.autoUpdate()
