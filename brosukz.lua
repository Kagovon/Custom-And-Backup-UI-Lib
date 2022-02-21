local coreGui = game:GetService("CoreGui")
local tweenService = game:GetService("TweenService")

local Status = game:HttpGet("https://eylzduef68mpz6d.000webhostapp.com/status.nil")

function createTween(Object,setup,settings)
	local style = (settings.Style or Enum.EasingStyle.Sine);
	local direction = (settings.Direction or Enum.EasingDirection.InOut);
	local length = (settings.TIME or 1);
	local repeatcount = (settings.repeatLimit or 0);
	local reverse = (settings.IsReversed or false);
	local dt = (settings.delay or 0);
	
	local tween = TweenInfo.new(
		length, style, direction, repeatcount, reverse, dt
	);
	
	local tweenService = game:GetService("TweenService");
	local Anim = tweenService:Create(Object,tween,setup);
	Anim:Play();
	return Anim;
end

function RUN_FUNCTION(name, extension, configOpt)
    local settings = configOpt;
    local PATH_URL = settings.URL or nil;
    local GAME_NAME = "";
    local PLACE_ID
    
    local success = pcall(function()
        game:HttpGet(PATH_URL)
    end);

     local DecodedTable;
     if (success) then
        if extension == "lua" then 
            DecodedTable = loadstring(game:HttpGet(PATH_URL))()
        elseif extension == "json" then
            DecodedTable = game:GetService("HttpService"):JSONDecode(game:HttpGet(PATH_URL))
        end
        
        settings.Executable = ""
        for i,v in pairs(DecodedTable) do
            if (game.PlaceId == tonumber(i) and v.name and v.Working) then
                PLACE_ID = tonumber(i)
                local connection = pcall(function() 
                    settings.Executable = game:HttpGet(v.Script) 
                end);
                
                GAME_NAME = v.name
            end
        end
    end

    spawn(function()
        local SeraphHubLoader = Instance.new("ScreenGui")
        local Loader = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local Menu = Instance.new("Frame")
        local Title = Instance.new("TextLabel")
        local LoadBar = Instance.new("Frame")
        local Bar = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local UICorner_3 = Instance.new("UICorner")
        local Message = Instance.new("TextLabel")
        local Shadow = Instance.new("ImageLabel")

        SeraphHubLoader.Name = "SeraphHubLoader"
        SeraphHubLoader.Parent = coreGui
        SeraphHubLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        SeraphHubLoader.ResetOnSpawn = false

        Loader.Name = "Loader"
        Loader.Parent = SeraphHubLoader
        Loader.AnchorPoint = Vector2.new(0.5, 0.5)
        Loader.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Loader.BorderSizePixel = 0
        Loader.Position = UDim2.new(0.5, 0, 0.5, 0)
        Loader.Size = UDim2.new(0, 0, 0, 0)

        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = Loader

        Menu.Name = "Menu"
        Menu.Parent = Loader
        Menu.AnchorPoint = Vector2.new(0.5, 0.5)
        Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Menu.BackgroundTransparency = 1.000
        Menu.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Menu.Position = UDim2.new(0.5, 0, 0.5, 0)
        Menu.Size = UDim2.new(1, -4, 1, -4)

        Title.Name = "Title"
        Title.Parent = Menu
        Title.AnchorPoint = Vector2.new(0.5, 0)
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0.5, 0, 0, 4)
        Title.Size = UDim2.new(0, 200, 0, 50)
        Title.ZIndex = 4
        Title.Font = Enum.Font.GothamSemibold
        Title.Text = "Seraph Hub"
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 22.000
        Title.TextTransparency = 1

        LoadBar.Name = "LoadBar"
        LoadBar.Parent = Menu
        LoadBar.AnchorPoint = Vector2.new(0.5, 0)
        LoadBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        LoadBar.Position = UDim2.new(0.5, 0, 1, -28)
        LoadBar.Size = UDim2.new(1, -28, 0, 20)
        LoadBar.ZIndex = 4
        LoadBar.BackgroundTransparency = 1

        Bar.Name = "Bar"
        Bar.Parent = LoadBar
        Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Bar.BorderSizePixel = 0
        Bar.Size = UDim2.new(0, 0, 1, 0)
        Bar.BackgroundTransparency = 1

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = Bar

        UICorner_3.CornerRadius = UDim.new(0, 4)
        UICorner_3.Parent = LoadBar

        Message.Name = "Message"
        Message.Parent = Menu
        Message.AnchorPoint = Vector2.new(0.5, 0)
        Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Message.BackgroundTransparency = 1.000
        Message.Position = UDim2.new(0.5, 0, 0, 35)
        Message.Size = UDim2.new(1, -28, 0, 28)
        Message.SizeConstraint = Enum.SizeConstraint.RelativeXX
        Message.ZIndex = 4
        Message.Font = Enum.Font.Gotham
        Message.TextColor3 = Color3.fromRGB(255, 255, 255)
        Message.TextSize = 18.000
        Message.TextTransparency = 1
        Message.Text = "..."

        Shadow.Name = "Shadow"
        Shadow.Parent = SeraphHubLoader
        Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
        Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Shadow.BackgroundTransparency = 1.000
        Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
        Shadow.Size = UDim2.new(0,0,0,0)
        Shadow.Image = "rbxassetid://6105530152"
        Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
        Shadow.ImageTransparency = 0.200

        local TweenService = game:GetService("TweenService")
        
        spawn(function()
            while wait() do
                if Loader.Position == UDim2.new(0.5, 0, 0.5, 0) then
                    
                else
                    TweenService:Create(
                        Loader,
                        TweenInfo.new(.5, Enum.EasingStyle.Quart),
                        {Position = UDim2.new(0.5, 0, 0.5, 0)}
                    ):Play()
                    TweenService:Create(
                        Shadow,
                        TweenInfo.new(.5, Enum.EasingStyle.Quart),
                        {Position = UDim2.new(0.5, 0, 0.5, 0)}
                    ):Play()
                end
        end
        end)

        wait(1)

        createTween(Loader,{Size = UDim2.new(0, 280, 0, 98)}, {
            Style = Enum.EasingStyle.Quart,
            Direction = Enum.EasingDirection.Out,
            TIME = .5
        })
        createTween(Shadow,{Size = UDim2.new(0, 305, 0, 114)}, {
            Style = Enum.EasingStyle.Quart,
            Direction = Enum.EasingDirection.Out,
            TIME = .5
        })
        wait(0.5)

        createTween(Title,{TextTransparency = 0}, {
            Style = Enum.EasingStyle.Quart,
            Direction = Enum.EasingDirection.Out,
            TIME = .5
        })
        createTween(Message,{TextTransparency = 0}, {
            Style = Enum.EasingStyle.Quart,
            Direction = Enum.EasingDirection.Out,
            TIME = .5
        }).Completed:Wait(1)
        createTween(LoadBar,{BackgroundTransparency = 0}, {
            Style = Enum.EasingStyle.Quart,
            Direction = Enum.EasingDirection.Out,
            TIME = .5
        })
        wait(0.2)

        createTween(Bar,{BackgroundTransparency = 0}, {
            Style = Enum.EasingStyle.Quart,
            Direction = Enum.EasingDirection.Out,
            TIME = .5
        })

        function setSize(int)
            local number = tonumber(int)
            local percent = 1 - ((100 - int) / (100 - 0));
            
            createTween(Bar, {Size = UDim2.new(percent, 0, 1, 0)}, {
                Style = Enum.EasingStyle.Quart,
                Direction = Enum.EasingDirection.Out,
                TIME = .5
            })
        end
        
        wait(1)
        createTween(Message,{TextTransparency = 0.5}, {
            Style = Enum.EasingStyle.Quart,
            Direction = Enum.EasingDirection.Out,
            TIME = .5
        }).Completed:Wait(0.5)
        setSize(20)
        createTween(Message,{TextTransparency = 0}, {
            Style = Enum.EasingStyle.Quart,
            Direction = Enum.EasingDirection.Out,
            TIME = .5
        })
        Message.Text = "Checking"

        wait(0.5)

        if Status == "true" then
            createTween(Message,{TextTransparency = 0.5}, {
                Style = Enum.EasingStyle.Quart,
                Direction = Enum.EasingDirection.Out,
                TIME = .5
            }).Completed:Wait(0.5)
            if game.PlaceId == PLACE_ID then
                setSize(60)
                createTween(Message,{TextTransparency = 0}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                })
                Message.Text = "Loading"
                wait(0.5)
                createTween(Message,{TextTransparency = 0.5}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                }).Completed:Wait(0.5)
                setSize(100)
                createTween(Message,{TextTransparency = 0}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                })
                Message.Text = "Loaded"
                wait(0.5)
                createTween(Bar,{BackgroundTransparency = 1}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                })
                wait(0.2)
                createTween(LoadBar,{BackgroundTransparency = 1}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                })
                wait(0.2)
                createTween(Message,{TextTransparency = 1}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                })
                createTween(Shadow,{ImageTransparency = 1}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                })

                TweenService:Create(
                        Title,
                        TweenInfo.new(.5, Enum.EasingStyle.Quart),
                        {Position = UDim2.new(0.5, 0, 0.191, 4)}
                ):Play()
                createTween(Title,{TextTransparency = 0.5}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                }).Completed:Wait(0.5)
                createTween(Title,{TextTransparency = 0}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                })
                Title.Text = "Seraph Hub"
                wait(1)
                createTween(Title,{TextTransparency = 1}, {
                    Style = Enum.EasingStyle.Quart,
                    Direction = Enum.EasingDirection.Out,
                    TIME = .5
                }).Completed:Wait(0.2)
                TweenService:Create(
                        Loader,
                        TweenInfo.new(.5, Enum.EasingStyle.Quart),
                        {Size = UDim2.new(0,0,0,0)}
                ):Play().Completed:Wait()
                SeraphHubLoader:Destroy()

                loadstring(settings.Executable)()

            else
                setSize(0)
                print("Something wrong when checking game and script. " .. "Not Supported Game")
            end
        else
            setSize(0)
            print("Something wrong when checking status. " .. Status)
        end

        wait(5)
        SeraphHubLoader:Destroy()
    end)
end

return RUN_FUNCTION
