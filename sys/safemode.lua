os.pullEvent = os.pullEventRaw

term.setBackgroundColor(colors.red)
term.clear()
term.setCursorBlink(false)
term.setCursorPos(1,1)
term.setTextColor(colors.yellow)
textutils.slowPrint("CROSSLINE OS SAFE MODE\n\n[!] WARNING THIS IS MADE FOR ADVANCED USERS ONLY!\n\n[!] USE CAUTION WHEN USING THIS MENU\n\n1. Change Password")

local option = read()

if option == "1" then
  shell.run(".sys/safemode/setup.lua")

  else
    os.reboot()
end
