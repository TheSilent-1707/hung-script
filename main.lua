local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HUNGGG scripts",
   Icon = 0, 
   LoadingTitle = "HUNGGG",
   LoadingSubtitle = "by_hung17072",
   ShowText = "HUNGGG", 
   Theme = "Default", 

   ToggleUIKeybind = "K", 

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 

   
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },

   KeySystem = true, 
   KeySettings = {
      Title = "bietbomay0",
      Subtitle = "Key System",
      Note = "dek co note", 
      FileName = "Key", 
      SaveKey = true,
      GrabKeyFromSite = false, 
      Key = {"hungdeptrai"}
   }
})

local MainTab = Window:CreateTab("home", nil)
local MainSection = MainTab:CreateSection("Main")

local player = game.Players.LocalPlayer
local speed = 16

local function bindHumanoid(humanoid)
    humanoid.WalkSpeed = speed
    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if humanoid.WalkSpeed ~= speed then
            humanoid.WalkSpeed = speed
        end
    end)
end

local function onCharacter(char)
    local humanoid = char:WaitForChild("Humanoid")
    bindHumanoid(humanoid)
end

if player.Character then
    onCharacter(player.Character)
end
player.CharacterAdded:Connect(onCharacter)

local Slider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 360},
   Increment = 1,
   Suffix = "speed",
   CurrentValue = 16,
   Flag = "Slider1", 
   Callback = function(Value)
        speed = Value
        local char = player.Character
        if char then
            local hum = char:FindFirstChild("Humanoid")
            if hum then hum.WalkSpeed = speed end
        end
   end,
})
