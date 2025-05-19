loadstring([[

-- Philly Goats GUI (Mobile-Compatible with Toggle Button)

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PhillyGoatsGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleButton.Text = "Toggle Menu"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 18
toggleButton.Parent = screenGui

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.9, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false -- Initially hidden
mainFrame.Parent = screenGui

-- Toggle Button Logic
toggleButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- Add Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.Text = "Philly Goats 🐐"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.TextColor3 = Color3.new(1, 1, 1)
title.Parent = mainFrame

-- Add Scrolling Emote List
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
scroll.ScrollBarThickness = 8
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = mainFrame

-- UIListLayout for better mobile layout
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = scroll

-- Sample Emotes
local emotes = {"Wave", "Dance", "Point", "Laugh", "Cheer", "Salute", "Clap"}

for _, name in ipairs(emotes) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 50)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 20
    button.Text = name
    button.Parent = scroll

    button.MouseButton1Click:Connect(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e " .. name:lower(), "All")
    end)
end

]])()