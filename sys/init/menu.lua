os.pullEvent = os.pullEventRaw
 
local w,h = term.getSize()
 
function printCentered( y,s )
   local x = math.floor((w - string.len(s)) / 2)
   term.setCursorPos(x,y)
   term.clearLine()
   term.write( s )
end
 
local nOption = 1
 
local function drawMenu()
   term.clear()
   term.setCursorPos(1,1)
   term.write("Crossline OS")
term.setCursorPos(1,2)
shell.run("id")
 
   term.setCursorPos(w-11,1)
   if nOption == 1 then
   term.write("Command Prompt")
elseif nOption == 2 then
   term.write("Programs")
elseif nOption == 3 then
   term.write("Shutdown")
elseif nOption == 4 then
    term.write("Check Storaage")
end
 
end

term.clear()
local function drawFront()
   printCentered( math.floor(h/2) - 3, "")
   printCentered( math.floor(h/2) - 2, "Start Menu" )
   printCentered( math.floor(h/2) - 1, "")
   printCentered( math.floor(h/2) + 0, ((nOption == 1) and "[ Command Prompt  ]") or "Command Prompt" )
   printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[ Programs ]") or "Programs" )
   printCentered( math.floor(h/2) + 2, ((nOption == 3) and "[ Shutdown ]") or "Shutdown" )
   printCentered( math.floor(h/2) + 3, ((nOption == 4) and "[ Check Storage ]") or "Check Storage" )
   printCentered( math.floor(h/2) + 4, "")
end

drawMenu()
drawFront()
 
while true do
 local e,p = os.pullEvent()
 if e == "key" then
  local key = p
  if key == 17 or key == 200 then
 
   if nOption > 1 then
    nOption = nOption - 1
    drawMenu()
    drawFront()
   end
  elseif key == 31 or key == 208 then
  if nOption < 4 then
  nOption = nOption + 1
  drawMenu()
  drawFront()
end
elseif key == 28 then
break
end
end
end
term.clear()
 

if nOption  == 1 then
shell.run(".sys/term.lua")
elseif nOption == 2 then
shell.run(".sys/programs.lua")
elseif nOption == 3 then
os.shutdown()
elseif nOption == 4 then
shell.run(".sys/init/storage.lua")
end
