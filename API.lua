game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Thanks!";
    Text = "This script uses jnk's psx api";
    Icon = "rbxassetid://9753879195";
    Duration = 5;
    })
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer


Networking = require(game.ReplicatedStorage:WaitForChild("Library"):WaitForChild("Client"):WaitForChild("Network"))


if (not getgenv().RemoteHooking) then
    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
    local functions = Network.Fire, Network.Invoke
    local old 
    old = hookfunction(getupvalue(functions, 1) , function(...) return true end)
    getgenv().RemoteHooking = true
end


local Lib = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
Bypass = {};for i,v in pairs(Lib.Directory.Pets) do    if v.titanic or v.huge or v.rarity == "Exclusive" or v.rarity == "Event" then Bypass[i]=true end end

function BypassAntiCheat()
	local Blunder = require(game:GetService("ReplicatedStorage"):FindFirstChild("BlunderList", true))
	local OldGet = Blunder.getAndClear

	setreadonly(Blunder, false)

	local function OutputData(Message)
		return Message
	end

	Blunder.getAndClear = function(...)
		local Packet = ...
		for i,v in next, Packet.list do
			if v.message ~= "PING" then
				OutputData(v.message)
				table.remove(Packet.list, i)
			end
		end
		return OldGet(Packet)
	end
	local Audio = require(game:GetService("ReplicatedStorage").Library.Audio)
	local old1 = hookfunction(Audio.Play, function(sound, ...)
		return {
			Play = function()
				print("Fake sound played")
			end,
			Stop = function()
				print("Fake sound stopped")
			end,
			IsPlaying = function()
				return false
			end
		}
	end)
end

function TeleportToBank()
    local bankPad = game:GetService("Workspace")["__MAP"].Interactive.Bank.Pad
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(bankPad.Position)
end

function TeleportToMailbox()
    local mailPad = game:GetService("Workspace")["__MAP"].Interactive.Mailbox.Pad
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mailPad.Position)
end



getgenv().Option = nil
getgenv().SetOption = function(X) getgenv().Option = X end
function NewOption(Message)
    local u6 = game.Players.LocalPlayer.PlayerGui.Message.Frame
    u6.Yes.Visible = true;
    u6.No.Visible = true;
    u6.Ok.Visible = false;
    u6.Cancel.Visible = false;
    u6.Desc.Text = Message;
    u6.Parent.Enabled = true
    for i,v in pairs({"A","B","C"}) do if u6:FindFirstChild("Option"..v) then u6["Option"..v].Visible = false end end
    if not getgenv().hookedmsgxx then
        u6.Yes.MouseButton1Click:Connect(function()
            getgenv().SetOption(true)
            u6.Parent.Enabled = false
        end)
        u6.No.MouseButton1Click:Connect(function()
            getgenv().SetOption(false)
            u6.Parent.Enabled = false
        end)
        getgenv().hookedmsgxx = true
    end
    repeat task.wait() until u6.Parent.Enabled == false
    return getgenv().Option
end

function NewMessage(Message)
    local u6 = game.Players.LocalPlayer.PlayerGui.Message.Frame
    u6.Yes.Visible = false;
    u6.No.Visible = false;
    u6.Ok.Visible = true;
    u6.Cancel.Visible = false;
    u6.Desc.Text = Message;
    u6.Parent.Enabled = true
    for i,v in pairs({"A","B","C"}) do if u6:FindFirstChild("Option"..v) then u6["Option"..v].Visible = false end end
        u6.Ok.MouseButton1Click:Connect(function()
            getgenv().SetOption(true)
            u6.Parent.Enabled = false
        end)
    repeat task.wait() until u6.Parent.Enabled == false
end

local teleport = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs.Teleport)
local Variables = require(game:GetService("ReplicatedStorage").Library.Variables)
function AreaTeleport(Area)
    Variables.Teleporting = false
	teleport.Teleport(Area, true)
	Variables.Teleporting = false
end

function GetHoverboards()
Hoverboards = {}
for i,v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Hoverboards:GetChildren())do
    if v:IsA("Folder") then
     table.insert(Hoverboards, v.Name)
    end
end
return Hoverboards
end
