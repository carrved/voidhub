local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or Player.CharacterAdded:Wait()
local humanoid = char:WaitForChild('Humanoid')
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create {
    Name = "z4's hub",
    Size = UDim2.fromOffset(400, 500),
    Theme = Mercury.Themes.Serika,
    Link = "https://github.com/deeeity/mercury-lib"
}


-------------------------
--       General
-------------------------

local General = GUI:Tab {
	Name = "General",
	Icon = "rbxassetid://10162704828"
}

local gittest1 = General:Button {
	Name = "GitHub Test",
	Description = "Test for WSL Git Support.",
	Callback = function()
		print("the gaming has been complete")
	end
}

local RJBtn = General:Button {
    Name = "Rejoin",
    Description = "Rejoins you to the server you were last in",
    Callback = function()
    General:prompt{
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

local fps = General:Button {
	Name = "FPS",
	Description = "Lets you know of your current FPS.",
	Callback = function()
		GUI:Notification {
			Title = "FPS",
			Text = "FPS: " .. Workspace:GetRealPhysicsFPS()
		}
	end
}

local fullbright = General:Button {
	Name = "Fullbright",
	StartingState = false,
	Description = "Brights up the world!",
	Callback = function(state)
		loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU"), false)()
	end
}

-------------------------
--      Movement
-------------------------

local Movement = GUI:Tab {
	Name = "Movement",
	Icon = "rbxassetid://10162222820"
}

local SpeedSlider = Movement:slider {
	Name = "Speed",
	Default = 16,
	Min = 16,
	Max = 500,
	Callback = function(v)
		humanoid.WalkSpeed = v
	end
}

-------------------------
--       Player
-------------------------

local Player = GUI:Tab {
	Name = "Player",
	Icon = "rbxassetid://10162555280"
}

local TpToPlayer = Player:TextBox {
	Name = "Teleport to Player",
	Callback = function(text) 
        local plr1 = game.Players.LocalPlayer.Character
	    local plr2 = game.Workspace:FindFirstChild(text)
	    plr1.HumanoidRootPart.CFrame = plr2.HumanoidRootPart.CFrame * CFrame.new(0,2,0)

		local notificationMsg = "Teleported to " .. text
		GUI:Notification{
	        Title = "TP",
	        Text = notificationMsg,
	        Duration = 3,
	        Callback = function() end
        }
    end
}

local Noclip = Player:Button {
	Name = "Noclip",
	Description = "Walk through ANYTHING!",
	Callback = function()
		humanoid:ChangeState(11)
	end
}

GUI:Credit{ 
	Name = "whos_ian",
	Description = "Scripting / Coding",
	V3rm = "whosian",
	Discord = "iаn#4332"
}
