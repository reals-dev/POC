local player = game.Players.LocalPlayer

local LettersOnTop = {'Q','W','E','R','T','Y','U','I','O','P'}
local LettersOnMiddle = {'A','S','D','F','G','H','J','K','L'}
local LettersOnBottom = {'Z','X','C','V','B','N','M'}

function createFrame(parent: Instance, name: string)
	local tempFrame = Instance.new('Frame')
	tempFrame.Name = name
	tempFrame.Parent = parent
	return tempFrame
end

function createLetterDisplay(parent: Instance, interation: number)
	local newFrame = createFrame(parent, 'LetterDisplay'..tostring(interation))
	newFrame.BorderSizePixel = 0
	newFrame.Size = UDim2.new(1, 0, 0.175, 0)
	newFrame.LayoutOrder = interation
	newFrame.BackgroundTransparency = 1
	
	local ListLayout = Instance.new('UIListLayout')
	ListLayout.Padding = UDim.new(0.02, 0)
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	ListLayout.FillDirection = Enum.FillDirection.Horizontal
	
	ListLayout.Parent = newFrame
	
	for i = 1, 5, 1 do
		local letterBox = createFrame(newFrame, i)
		letterBox.LayoutOrder = i
		letterBox.Name = tostring(i)
		letterBox.Size = UDim2.new(1, 0, 1, 0)
		letterBox.BackgroundColor3 = Color3.fromRGB(255, 249, 245)
		
		local uiaspect = Instance.new('UIAspectRatioConstraint')
		uiaspect.Parent = letterBox
		uiaspect.DominantAxis = Enum.DominantAxis.Width
		uiaspect.AspectRatio = 1
		
		local corner = Instance.new('UICorner')
		corner.Parent = letterBox
		
		letterBox.Parent = newFrame
	end
end


local Master = Instance.new('ScreenGui')
Master.Parent = player:WaitForChild('PlayerGui')
Master.Name = 'Master'
Master.DisplayOrder = 100
Master.ResetOnSpawn = false
Master.ClipToDeviceSafeArea = false
Master.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
Master.ScreenInsets = Enum.ScreenInsets.None

local MainContainer = createFrame(Master, 'MainContainer')
MainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
MainContainer.Size = UDim2.new(1, 0, 1, 0)
MainContainer.BorderSizePixel = 0
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
MainContainer.BackgroundColor3 = Color3.fromRGB(240, 234, 227)

local Middle = createFrame(MainContainer, 'Middle')
Middle.Position = UDim2.new(0.5, 0, 0.5, 0)
Middle.Size = UDim2.new(0.8, 0, 0.75, 0)
Middle.BorderSizePixel = 0
Middle.AnchorPoint = Vector2.new(0.5, 0.5)
Middle.BackgroundTransparency = 1

local Title = Instance.new('TextLabel')
Title.Parent = Middle
Title.Size = UDim2.new(0.4, 0, 0.076, 0)
Title.Position = UDim2.new(0.5, 0, -0.15, 0)
Title.Text = 'WORDLE'
Title.TextColor3 = Color3.fromRGB(53, 45, 35)
Title.BackgroundTransparency = 1
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.TextScaled = true
Title.Font = Enum.Font.BuilderSansExtraBold

local Frame = createFrame(Middle, 'DisplayHolder')
Frame.Position = UDim2.new(0, 0, -0.074, 0)
Frame.Size = UDim2.new(1, 0, 0.674, 0)
Frame.BackgroundTransparency = 1

local ListLayout = Instance.new('UIListLayout')
ListLayout.Padding = UDim.new(0.03, 0)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = Frame

for i = 1,6,1 do
	createLetterDisplay(Frame, i)
end









-- KEYBOARD

function createKeys(parent: Instance, letter: string, special: boolean?)
	local Letter = createFrame(parent, letter)
	Letter.Size = if special then UDim2.new(0.12, 0, 1, 0) else UDim2.new(0.07, 0, 1, 0)
	Letter.BackgroundColor3 = Color3.fromRGB(204, 199, 196)
	Letter.BorderSizePixel = 0
	
	local Corner = Instance.new('UICorner')
	Corner.Parent = Letter
	
	local Button = Instance.new('TextButton')
	Button.BackgroundTransparency = 1
	Button.Text = ''
	Button.Size = UDim2.new(1,0,1,0)
	
	local Label = Instance.new('TextLabel')
	Label.AnchorPoint = Vector2.new(0.5, 0.5)
	Label.BackgroundTransparency = 1
	Label.BorderSizePixel = 0
	Label.Position = UDim2.new(0.5, 0, 0.5, 0)
	Label.Size = UDim2.new(0.5, 0, 0.5, 0)
	Label.Font = Enum.Font.BuilderSansExtraBold
	Label.TextColor3 = Color3.fromRGB(53, 45, 35)
	Label.TextScaled = true
	Label.TextWrapped = true
	Label.Parent = Letter
	Label.Text = letter
end

local Keyboard = createFrame(Middle, 'Keyboard')
Keyboard.AnchorPoint = Vector2.new(0.5, 1)
Keyboard.BackgroundColor3 = Color3.fromRGB(255,255,255)
Keyboard.BackgroundTransparency = 1
Keyboard.BorderSizePixel = 0
Keyboard.Position = UDim2.new(0.5, 0, 1.1, 0)
Keyboard.Size = UDim2.new(0.8, 0, 0.4, 0)

local ListLayout = Instance.new('UIListLayout')
ListLayout.Padding = UDim.new(0.05, 0)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ListLayout.Parent = Keyboard

local uiscale = Instance.new('UIScale')
uiscale.Scale = 0.8
uiscale.Parent = Keyboard



local BottomKeys = createFrame(Keyboard, 'BottomKeys')
BottomKeys.BackgroundTransparency = 1
BottomKeys.BorderSizePixel = 0
BottomKeys.Size = UDim2.new(1, 0, 0.3, 0)
BottomKeys.LayoutOrder = 3

local ListLayout = Instance.new('UIListLayout')
ListLayout.Padding = UDim.new(0.01, 0)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ListLayout.FillDirection = Enum.FillDirection.Horizontal
ListLayout.Parent = BottomKeys

createKeys(BottomKeys, 'ENTER', true)

for _, letter in LettersOnBottom do
	createKeys(BottomKeys, letter)
end

createKeys(BottomKeys, 'DEL', true)

local MiddleKeys = createFrame(Keyboard, 'MiddleKeys')
MiddleKeys.BackgroundTransparency = 1
MiddleKeys.BorderSizePixel = 0
MiddleKeys.Size = UDim2.new(1, 0, 0.3, 0)
MiddleKeys.LayoutOrder = 2

local ListLayout = Instance.new('UIListLayout')
ListLayout.Padding = UDim.new(0.01, 0)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ListLayout.FillDirection = Enum.FillDirection.Horizontal
ListLayout.Parent = MiddleKeys

for _, letter in LettersOnMiddle do
	createKeys(MiddleKeys, letter)
end



local TopKeys = createFrame(Keyboard, 'TopKeys')
TopKeys.BackgroundTransparency = 1
TopKeys.BorderSizePixel = 0
TopKeys.Size = UDim2.new(1, 0, 0.3, 0)
TopKeys.LayoutOrder = 1

local ListLayout = Instance.new('UIListLayout')
ListLayout.Padding = UDim.new(0.01, 0)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ListLayout.FillDirection = Enum.FillDirection.Horizontal
ListLayout.Parent = TopKeys

for _, letter in LettersOnTop do
	createKeys(TopKeys, letter)
end
