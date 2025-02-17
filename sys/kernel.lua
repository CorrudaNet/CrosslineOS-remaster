--local permission = 0

local settings = _G.settings

--local _G.LoginSucess = nil

local errorCode = ""

term.clear()
term.setCursorPos(1,1)
print("Crossline OS Kernel")

function _G.RedScreenOfDeath()
os.pullEvent = os.pullEventRaw
term.setBackgroundColor(colors.red)
term.clear()


term.setCursorPos(1,1)
term.write("KERNEL PANIC: " .. errorCode)

sleep(2)
os.reboot()

end

local kernel = _G.kernel

shell.openTab(".sys/gps.lua")

shell.execute(".sys/init/login.lua")

local id = shell.openTab(".sys/gps.lua")
local term = shell.openTab(".sys/term.lua")

return {errorCode, _G.RedScreenOfDeath }
