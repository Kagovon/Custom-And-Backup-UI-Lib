local Seraph = {}

local function MakeDraggable(frame, parent)
    frame = frame or nil
    parent = parent or nil
    local dragging = false
    local dragInput, mousePos, framePos
    local input = game:GetService("UserInputService")

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    input.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            wait(0.1)
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            shadow.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

function Seraph:CreateWindow(text)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local MenuFrame = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Invisible = Instance.new("Frame")
    local TitleFrame = Instance.new("Frame")
    local Title1 = Instance.new("TextLabel")
    local Title2 = Instance.new("TextLabel")
    local UIListLayout = Instance.new("UIListLayout")
    local MenuFrame_2 = Instance.new("Frame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local DraggableFrame = Instance.new("Frame")
    local ImageButton = Instance.new("ImageButton")
    local TabFolder = Instance.new("Folder")
    local Shadow = Instance.new("ImageLabel")

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.Active = true
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 611, 0, 396)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = MainFrame

    MenuFrame.Name = "MenuFrame"
    MenuFrame.Parent = MainFrame
    MenuFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MenuFrame.Size = UDim2.new(0, 180, 0, 396)

    UICorner_2.CornerRadius = UDim.new(0, 4)
    UICorner_2.Parent = MenuFrame

    Invisible.Name = "Invisible"
    Invisible.Parent = MenuFrame
    Invisible.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Invisible.BorderSizePixel = 0
    Invisible.Position = UDim2.new(0.964999914, 0, -0.00252525252, 1)
    Invisible.Size = UDim2.new(0, 6, 0, 396)

    TitleFrame.Name = "TitleFrame"
    TitleFrame.Parent = MenuFrame
    TitleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleFrame.BackgroundTransparency = 1.000
    TitleFrame.Position = UDim2.new(0.027777778, 0, 0.0379999988, 0)
    TitleFrame.Size = UDim2.new(0, 170, 0, 50)

    Title1.Name = "Title1"
    Title1.Parent = TitleFrame
    Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title1.BackgroundTransparency = 1.000
    Title1.Position = UDim2.new(0, 0, 0.037878789, 0)
    Title1.Size = UDim2.new(0, 170, 0, 50)
    Title1.Font = Enum.Font.Gotham
    Title1.Text = text
    Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title1.TextSize = 20.000

    Title2.Name = "Title2"
    Title2.Parent = TitleFrame
    Title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title2.BackgroundTransparency = 1.000
    Title2.Position = UDim2.new(0.0294117648, 0, 0.0178787895, 0)
    Title2.Size = UDim2.new(0, 170, 0, 50)
    Title2.Font = Enum.Font.Gotham
    Title2.Text = "Hub"
    Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title2.TextSize = 20.000

    UIListLayout.Parent = TitleFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, -28)

    MenuFrame_2.Name = "MenuFrame"
    MenuFrame_2.Parent = MenuFrame
    MenuFrame_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MenuFrame_2.BackgroundTransparency = 1.000
    MenuFrame_2.Position = UDim2.new(0, 0, 0.219696969, 0)
    MenuFrame_2.Size = UDim2.new(0, 180, 0, 290)

    UIListLayout_2.Parent = MenuFrame_2
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 4)

    UIPadding.Parent = MenuFrame_2
    UIPadding.PaddingLeft = UDim.new(0, 9)

    DraggableFrame.Name = "DraggableFrame"
    DraggableFrame.Parent = MainFrame
    DraggableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DraggableFrame.BackgroundTransparency = 1.000
    DraggableFrame.Size = UDim2.new(0, 170, 0, 396)

    ImageButton.Parent = MainFrame
    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton.BackgroundTransparency = 1.000
    ImageButton.Position = UDim2.new(0.958999991, 0, 0.0199999996, 0)
    ImageButton.Selectable = false
    ImageButton.Size = UDim2.new(0, 17, 0, 17)
    ImageButton.ZIndex = 2
    ImageButton.AutoButtonColor = false
    ImageButton.Image = "rbxassetid://7072725342"

    TabFolder.Name = "TabFolder"
    TabFolder.Parent = MainFrame

    Shadow.Name = "Shadow"
    Shadow.Parent = ScreenGui
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Shadow.BackgroundTransparency = 1.000
    Shadow.Position = UDim2.new(0.49850598, 0, 0.5, 0)
    Shadow.Size = UDim2.new(0, 672, 0, 467)
    Shadow.Visible = false
    Shadow.Image = "rbxassetid://6105530152"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)

    MakeDraggable(DraggableFrame, MainFrame)
end
return Seraph
