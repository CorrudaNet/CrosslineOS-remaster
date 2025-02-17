local booting = true
local function bootloader()

print("Crossline OS Bootloader version 0.0.4 BETA\n\n")

shell.run("set shell.allow_disk_startup false")

if disk.isPresent("top") == true then
 if fs.exists("disk/startup.lua") then
     shell.run("set shell.allow_disk_startup false")
  error("Booting disks is unsupported! | Due to security risks")
 end
end

if disk.isPresent("bottom") == true then
    if fs.exists("disk/startup.lua") then
     shell.run("set shell.allow_disk_startup false")
  error("Booting disks is unsupported! | Due to security risks")
  end
end

if disk.isPresent("left") == true then
    if fs.exists("disk/startup.lua") then
     shell.run("set shell.allow_disk_startup false")
  error("Booting disks is unsupported! | Due to security risks")
  end
end

if disk.isPresent("right") == true then
    if fs.exists("disk/startup.lua") then
     shell.run("set shell.allow_disk_startup false")
  error("Booting disks is unsupported! | Due to security risks")
  end
end

-- This is currently disabled due to issues regarding getting PCs bricked
--shell.run(".sys/init/security.lua")

print("            1. Boot into Crossline OS\n            2. Safe Mode (PRE-ALPHA)\n            3. Update OS")
term.setCursorPos(25,6)
local bootOption = read()

if bootOption == "1" then
    booting = false
    shell.run(".sys/kernel.lua")

    else
    if bootOption == "2" then
        term.clear()
        booting = false
        shell.run(".sys/safemode.lua")
        else
            if bootOption == "3" then
                    shell.execute(".sys/systemUpdate.lua") -- The corruda-net server currently does not serve updates anymore.
                else
        os.reboot()
        end
        end
        end
end

--shell.execute(".sys/kernel.lua")

--_G.id = multishell.launch({}, ".sys/kernel.lua")
--multishell.setFocus(2)
--multishell.setTitle(id, "Kernel")

while booting == true do
    local ok, err = pcall(bootloader)

    if ok then
       else
           if err == "Terminated" then
               os.reboot()
        end
    end
end
