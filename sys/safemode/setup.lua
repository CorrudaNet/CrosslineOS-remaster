term.setBackgroundColor(colors.blue)
term.clear()
term.setCursorPos(1,1)

settings.define("password", {
    description = "Crossline OS password\n",
    default = "",
    type = "string",
})

textutils.slowPrint("Type the desired password")

local UsrInput1 = read("*")

settings.set("password", UsrInput1)
settings.save()

print("Type in your password to confirm")
local usrInput = read("*")

if usrInput == settings.get("password") then
    print("Correct password")
    os.reboot()
    else

    print("Wrong Password")
    os.reboot()
end
