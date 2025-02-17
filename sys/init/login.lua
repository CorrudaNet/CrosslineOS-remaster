_G.LoginSucess = false

_G.password = ""

term.clear()
print("Welcome,", os.getComputerLabel())

print("ComputerID:", os.getComputerID())

print("Enter Password")

local function login()
    local UsrPassword = read("*")

    if UsrPassword == settings.get("password") then
        _G.LoginSucess = true
        shell.run(".sys/init/desktop.lua")

    else
        printError("Wrong Password")
    end
end

while _G.LoginSucess == false do
    local ok, err = pcall(login)

    if ok then
        -- No errors not terminated
    else
        -- Kernel Panic

        if err == "Terminated" then
            printError("KERNEL PANIC!")
            _G.RedScreenOfDeath()
        end
    end
end
