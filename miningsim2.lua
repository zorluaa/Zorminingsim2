local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Mining Simulator 2 AutoMine/AutoFish", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section1 = Tab:NewSection("Fish farm")
local Section2 = Tab:NewSection("Sell")
local Section = Tab:NewSection("Auto Mine")
Section:NewToggle("Auto mine ", ".", function(state)
    if state then
        _G.On = true -- true = on / false = off
-- main scripts below --
function breakblock(pos)
local args = {
[1] = pos
}
game:GetService("ReplicatedStorage").Events.MineBlock:FireServer(unpack(args))
end
local Mod = require(game:GetService("ReplicatedStorage").SharedModules.ChunkUtil)
function getPartBelow()
local Character = game.Players.LocalPlayer.Character
local Foot = Character.RightFoot
local RayOrigin = Foot.Position
local RayDirection = Vector3.new(0, -1, 0)
local Params = RaycastParams.new()
Params.FilterType = Enum.RaycastFilterType.Blacklist
Params.FilterDescendantsInstances = {Character}
local Result = workspace:Raycast(RayOrigin, RayDirection, Params)
if Result then
local RayInstance = Result.Instance
print("Instance hit: " .. tostring(RayInstance))
return RayInstance
end
return nil
end
while _G.On do
task.wait()
local closest = getPartBelow()
if closest ~= nil then
local Pos = closest.Position
local NewPos = Mod.worldToCell(Pos)
task.spawn(
function()
breakblock(NewPos)
end
)
end
end
    else
        _G.On = off -- true = on / false = off
-- main scripts below --
function breakblock(pos)
local args = {
[1] = pos
}
game:GetService("ReplicatedStorage").Events.MineBlock:FireServer(unpack(args))
end
local Mod = require(game:GetService("ReplicatedStorage").SharedModules.ChunkUtil)
function getPartBelow()
local Character = game.Players.LocalPlayer.Character
local Foot = Character.RightFoot
local RayOrigin = Foot.Position
local RayDirection = Vector3.new(0, -1, 0)
local Params = RaycastParams.new()
Params.FilterType = Enum.RaycastFilterType.Blacklist
Params.FilterDescendantsInstances = {Character}
local Result = workspace:Raycast(RayOrigin, RayDirection, Params)
if Result then
local RayInstance = Result.Instance
print("Instance hit: " .. tostring(RayInstance))
return RayInstance
end
return nil
end
while _G.On do
task.wait()
local closest = getPartBelow()
if closest ~= nil then
local Pos = closest.Position
local NewPos = Mod.worldToCell(Pos)
task.spawn(
function()
breakblock(NewPos)
end
)
end
end
    end
end)
local Section = Tab:NewSection("Chest Finder")
Section:NewButton("Click", ".", function()
    local _speed=100 -- lower if you are getting tp'd back (shouldn't happen)
function tp(...)
local plr=game.Players.LocalPlayer
local args={...}
if typeof(args[1])=="number"and args[2]and args[3]then
args=Vector3.new(args[1],args[2],args[3])
elseif typeof(args[1])=="Vector3" then
args=args[1]
elseif typeof(args[1])=="CFrame" then
args=args[1].Position
end
local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
game:GetService("TweenService"):Create(
plr.Character.HumanoidRootPart,
TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
{CFrame=CFrame.new(args)}
):Play()
end
for i,v in pairs(game:GetService("Workspace").Chests:GetChildren()) do
if v.Name == "Epic" then -- Change the name to "Wood", "Silver", "Gold", "Epic" or "Legendary"
tp(game:GetService("Workspace").Chests.Epic.Part.Position) -- Change The Path too to .Wood, .Silver, .Gold, .Epic or ,Legendary
end
end
end)
Section1:NewToggle("Auto Fish ", "Autofarm fish", function(state)
    _G.autoFish = true;
spawn(function()
while _G.autoFish == true do
    local args = {
    [1] = workspace.Worlds:FindFirstChild("Summer Fair").Fishing.Ocean.Part,
    [2] = Vector3.new(-3059.762451171875, 0.18494415283203125, 50.52241134643555)
}

game:GetService("ReplicatedStorage").Events.FishingCast:FireServer(unpack(args))


    wait()
end
end)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)
Section2:NewButton("Sell", "ButtonInfo", function()
    local args = {
    [1] = "The Overworld SurfaceSell"
}

game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))

    print("Clicked")
end)
