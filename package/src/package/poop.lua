local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")

-- Simple UI Framework
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ObjectClonerUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Object Cloner"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.BackgroundTransparency = 1
title.Parent = mainFrame

-- Input fields
local pathToCloneLabel = Instance.new("TextLabel")
pathToCloneLabel.Size = UDim2.new(1, -20, 0, 20)
pathToCloneLabel.Position = UDim2.new(0, 10, 0, 40)
pathToCloneLabel.Text = "Path to clone:"
pathToCloneLabel.TextColor3 = Color3.new(1, 1, 1)
pathToCloneLabel.Font = Enum.Font.SourceSans
pathToCloneLabel.TextSize = 14
pathToCloneLabel.BackgroundTransparency = 1
pathToCloneLabel.TextXAlignment = Enum.TextXAlignment.Left
pathToCloneLabel.Parent = mainFrame

local pathToCloneBox = Instance.new("TextBox")
pathToCloneBox.ClearTextOnFocus = false
pathToCloneBox.Size = UDim2.new(1, -20, 0, 25)
pathToCloneBox.Position = UDim2.new(0, 10, 0, 60)
pathToCloneBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
pathToCloneBox.BorderSizePixel = 0
pathToCloneBox.Text = ""
pathToCloneBox.TextColor3 = Color3.new(1, 1, 1)
pathToCloneBox.Font = Enum.Font.SourceSans
pathToCloneBox.TextSize = 14
pathToCloneBox.Parent = mainFrame

local buildPathLabel = Instance.new("TextLabel")
buildPathLabel.Size = UDim2.new(1, -20, 0, 20)
buildPathLabel.Position = UDim2.new(0, 10, 0, 90)
buildPathLabel.Text = "Path to build from:"
buildPathLabel.TextColor3 = Color3.new(1, 1, 1)
buildPathLabel.Font = Enum.Font.SourceSans
buildPathLabel.TextSize = 14
buildPathLabel.BackgroundTransparency = 1
buildPathLabel.TextXAlignment = Enum.TextXAlignment.Left
buildPathLabel.Parent = mainFrame

local buildPathBox = Instance.new("TextBox")
pathToCloneBox.ClearTextOnFocus = false
buildPathBox.Size = UDim2.new(1, -20, 0, 25)
buildPathBox.Position = UDim2.new(0, 10, 0, 110)
buildPathBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
buildPathBox.BorderSizePixel = 0
buildPathBox.Text = ""
buildPathBox.TextColor3 = Color3.new(1, 1, 1)
buildPathBox.Font = Enum.Font.SourceSans
buildPathBox.TextSize = 14
buildPathBox.Parent = mainFrame

-- ✅ ADD THIS FIX
buildPathBox.ClearTextOnFocus = false

-- Buttons
local cloneButton = Instance.new("TextButton")
cloneButton.Size = UDim2.new(0.45, 0, 0, 30)
cloneButton.Position = UDim2.new(0.025, 0, 0, 145)
cloneButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
cloneButton.BorderSizePixel = 0
cloneButton.Text = "Clone"
cloneButton.TextColor3 = Color3.new(1, 1, 1)
cloneButton.Font = Enum.Font.SourceSans
cloneButton.TextSize = 14
cloneButton.Parent = mainFrame

local buildButton = Instance.new("TextButton")
buildButton.Size = UDim2.new(0.45, 0, 0, 30)
buildButton.Position = UDim2.new(0.525, 0, 0, 145)
buildButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
buildButton.BorderSizePixel = 0
buildButton.Text = "Build"
buildButton.TextColor3 = Color3.new(1, 1, 1)
buildButton.Font = Enum.Font.SourceSans
buildButton.TextSize = 14
buildButton.Parent = mainFrame

-- Properties table (empty as requested)
local properties_tbl = {}

-- Core functionality
local function getInstanceFromPath(path)
    local current = game
    for part in path:gmatch("[^%.]+") do
        if part ~= "game" then
            current = current:FindFirstChild(part)
            if not current then return nil end
        end
    end
    return current
end

local function extractProperties(instance)
    local class_name = instance.ClassName
    local to_extract = properties_tbl[class_name] or {}
    
    local data = {}
    for _, prop_name in ipairs(to_extract) do
        data[prop_name] = instance[prop_name]
    end
    return data
end

local function applyProperties(instance, properties)
    for prop, value in pairs(properties) do
        pcall(function()
            instance[prop] = value
        end)
    end
end

local function buildTree(instance)
    local tree = {
        class_name = instance.ClassName,
        name = instance.Name,
        properties = extractProperties(instance),
        children = {},
    }

    for _, child in ipairs(instance:GetChildren()) do
        table.insert(tree.children, buildTree(child))
    end

    return tree
end

local function writeTreeIntoInstance(parent, tree)
    local instance = Instance.new(tree.class_name)
    instance.Name = tree.name
    applyProperties(instance, tree.properties)
    
    for _, childTree in ipairs(tree.children) do
        writeTreeIntoInstance(instance, childTree)
    end
    
    instance.Parent = parent
    return instance
end

-- Button actions
cloneButton.MouseButton1Click:Connect(function()
    local path = pathToCloneBox.Text
    if path == "" then return end
    
    local instance = getInstanceFromPath(path)
    if instance then
        local tree = buildTree(instance)
        buildPathBox.Text = path

        -- ✅ FIX HERE: avoid focus issues before setting text
        UserInputService:SetFocusedTextBox(nil)
        task.defer(function()
            pathToCloneBox.Text = HttpService:JSONEncode(tree)
        end)

        setclipboard(tostring(tree))
    else
        warn("Path not correct: cannot find instance to clone")
    end
end)

buildButton.MouseButton1Click:Connect(function()
    local buildPath = buildPathBox.Text
    if buildPath == "" then return end
    
    local instance = getInstanceFromPath(buildPath)
    if not instance then
        warn("Build path not correct: instance not found")
        return
    end

    local success, tree = pcall(function()
        return HttpService:JSONDecode(pathToCloneBox.Text)
    end)

    if success and tree then
        writeTreeIntoInstance(instance, tree)
    else
        warn("Failed to decode tree JSON")
    end
end)

-- Simple draggable window
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
