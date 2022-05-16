local plr = game:GetService("Players").LocalPlayer
local Character = plr.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild('Humanoid')
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Void Hub v2",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Legacy,
    Link = "https://github.com/deeeity/mercury-lib"
}

local PlayerTab = GUI:Tab{
    Name = "Player",
    Icon = "rbxassetid://8569322835",
}

local GetHumanoid = function(Plr, Char)
    local LCharacter = GetCharacter();
    local Character = Char or GetCharacter(Plr);
    return Plr and Character and FindFirstChildWhichIsA(Character, "Humanoid") or LCharacter and FindFirstChildWhichIsA(LCharacter, "Humanoid");
end

local WSSlider = PlayerTab:slider({
    Name = "Walk Speed",
    Default = 16,
    Min = 16,
    Max = 1000,
    Callback = function(v)
    local plr = game:GetService("Players").LocalPlayer
    local Character = plr.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild('Humanoid')

    Humanoid.WalkSpeed = v
end})

local JPSlider = PlayerTab:slider({
    Name = "Jump Power (BROKEN)",
    Default = 50,
    Min = 50,
    Max = 500,
    Callback = function(v)
    local plr = game:GetService("Players").LocalPlayer
    local Character = plr.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild('Humanoid')
    
    Humanoid.JumpHeight = v
end})

local GodBtn = PlayerTab:Button {
    Name = "God",
    Description = "Gods the player (BROKEN)",
    Callback = function()
        Humanoid.MaxHealth = 9999999999999
	    Humanoid.Health = 9999999999999
    end
}

local FlingBtn = PlayerTab:Button {
    Name = "Fling",
    Description = "Spins so fast you can fling people. Reset to stop",
    Callback = function()

        -- Made by JackMcJagger15

        power = 50000 -- change this to make it more or less powerful

        game:GetService('RunService').Stepped:connect(function()
        game.Players.LocalPlayer.Character.Head.CanCollide = false
        game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
        game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        end)
        wait(.1)
        local bambam = Instance.new("BodyThrust")
        bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        bambam.Force = Vector3.new(power,0,power)
        bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end
}

local RJBtn = PlayerTab:Button {
    Name = "Rejoin",
    Description = "Rejoins you to the server you were last in",
    Callback = function() 
        local ts = game:GetService("TeleportService")
	    local p = game:GetService("Players").LocalPlayer
	    ts:Teleport(game.PlaceId, p)
    end
}

local SitBtn = PlayerTab:Button {
    Name = "Sit",
    Description = "Sits the player, what else did you think",
    Callback = function() 
        Humanoid.Sit = true
    end
}

local TpToPlr = PlayerTab:TextBox {
	Name = "Textbox",
	Callback = function(text) 
        local plr1 = game.Players.LocalPlayer.Character
	    local plr2 = game.Workspace:FindFirstChild(text)
	    plr1.HumanoidRootPart.CFrame = plr2.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
    end
}

local NoclipToggle = PlayerTab:Toggle {
	Name = "Noclip",
	StartingState = false,
	Description = "Noclips the player",
	Callback = function(state) 
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
}

eGUI:Credit{ 
	Name = "whos_ian",
	Description = "Scripting / Coding",
	V3rm = "whosian",
	Discord = "iаn#4332"
}
