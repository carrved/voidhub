local plr = game:GetService("Players").LocalPlayer
local Character = plr.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild('Humanoid')
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Void Hub v2.1",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Legacy,
    Link = "https://github.com/deeeity/mercury-lib"
}

local PlayerTab = GUI:Tab{
    Name = "Player",
    Icon = "rbxassetid://8497489087",
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
    Name = "Jump Power",
    Default = 50,
    Min = 50,
    Max = 500,
    Callback = function(v)
        for i, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character:WaitForChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = v
        end
    end
end})

local GodBtn = PlayerTab:Button {
    Name = "God",
    Description = "Gods the player (BROKEN)",
    Callback = function()
        plr.Character.Humanoid.MaxHealth = 9999999999999
	    plr.Character.Humanoid.Health = 9999999999999
    end
}

local SpinBox = PlayerTab:TextBox {
    Name = "Spin",
    Callback = function(text)
        local Speed = text
        if (not CEnv[1]) then
            local Spin = InstanceNew("BodyAngularVelocity");
            ProtectInstance(Spin);
            Spin.Parent = GetRoot();
            Spin.MaxTorque = Vector3New(0, math.huge, 0);
            Spin.AngularVelocity = Vector3New(0, Speed, 0);
            CEnv[#CEnv + 1] = Spin
        else
            CEnv[1].AngularVelocity = Vector3New(0, Speed, 0);
        end
    end
}

local FlingBtn = PlayerTab:Button {
    Name = "Fling",
    Description = "Spins so fast you can fling people. Reset to stop",
    Callback = function()
        power = 500

        if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        game.Players.LocalPlayer.Character.Head.CanCollide = false
        game.Players.LocalPlayer.Character.Torso.CanCollide = false
        game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
        game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
        else
        if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        game.Players.LocalPlayer.Character.Head.CanCollide = false
        game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
        game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        end
        end
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
    PlayerTab:prompt{
        Title = "Rejoin",
        Text = "Are you sure you want to rejoin?",
        Buttons = {
            Yes = function() 
                local ts = game:GetService("TeleportService")
	            local p = game:GetService("Players").LocalPlayer
	            ts:Teleport(game.PlaceId, p)
                GUI:Notification {
                    Title = "Rejoin",
                    Text = "Rejoining...",
                    Duration = 5,
                    Callback = function() end
                }
            end,
            No = function() 
                return
            end
        }
    }
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
	Name = "Teleport to Player",
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
        if state == true then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
        end
    end
}

local FPSBtn = PlayerTab:Button {
    Name = "FPS",
    Description = "Notifies you of the current client FPS",
    Callback = function()
        GUI:Notification {
            Title = "FPS",
            Text = workspace:GetRealPhysicsFPS()
        }
    end
}

local FreecamBtn = PlayerTab:Button {
    Name = "Freecam",
    Description = "Allows you to go anywhere without moving your character!",
    Callback = function() 
        loadstring(game:HttpGet("https://pastebin.com/raw/6ngxJT8b"))();

        GUI:Notification {
            Title = "Freecam",
            Text = "Keybind is LShift + P to toggle"
        }
    end
}

GUI:Credit{ 
	Name = "whos_ian",
	Description = "Scripting / Coding",
	V3rm = "whosian",
	Discord = "iаn#4332"
}
