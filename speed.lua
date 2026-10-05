local P=game.Players.LocalPlayer
local G=Instance.new("ScreenGui",P.PlayerGui)
G.ResetOnSpawn=false
G.IgnoreGuiInset=true

-- ใส่ Roblox Image Asset ID ของรูปตัวละคร
local IMAGE_ID="rbxassetid://ใส่_ID_รูปตรงนี้"

--------------------------------------------------
-- ❄️ BACKGROUND หิมะ
--------------------------------------------------

local SnowBG=Instance.new("Frame",G)
SnowBG.Size=UDim2.fromScale(1,1)
SnowBG.Position=UDim2.fromScale(0,0)
SnowBG.BackgroundColor3=Color3.fromRGB(8,10,25)
SnowBG.BorderSizePixel=0
SnowBG.ZIndex=0

local Grad=Instance.new("UIGradient",SnowBG)
Grad.Color=ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.fromRGB(15,20,45)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(35,15,55))
})

-- หิมะตก + ส่ายไปมา
task.spawn(function()
	while G.Parent do

		local Snow=Instance.new("TextLabel",SnowBG)
		Snow.BackgroundTransparency=1
		Snow.Text="❄"
		Snow.TextColor3=Color3.fromRGB(240,245,255)
		Snow.TextTransparency=math.random(0,30)/100
		Snow.Font=Enum.Font.GothamBold
		Snow.TextSize=math.random(10,24)
		Snow.ZIndex=1

		local x=math.random(0,100)/100
		local y=-0.08
		local duration=math.random(5,10)
		local start=os.clock()

		Snow.Position=UDim2.fromScale(x,y)

		task.spawn(function()
			while Snow.Parent do
				local t=(os.clock()-start)/duration

				if t>=1 then
					Snow:Destroy()
					break
				end

				local wave=math.sin(t*math.pi*4)*0.035

				Snow.Position=UDim2.fromScale(
					x+wave,
					y+(t*1.15)
				)

				task.wait()
			end
		end)

		task.wait(0.08)
	end
end)

--------------------------------------------------
-- 🟣 MAIN MENU
--------------------------------------------------

local F=Instance.new("Frame",G)
F.Size=UDim2.fromScale(.42,.45)
F.Position=UDim2.fromScale(.29,.27)
F.BackgroundColor3=Color3.fromRGB(25,15,45)
F.BackgroundTransparency=.08
F.BorderSizePixel=0
F.ZIndex=2

Instance.new("UICorner",F).CornerRadius=UDim.new(0,16)

-- ขอบม่วง
local Stroke=Instance.new("UIStroke",F)
Stroke.Color=Color3.fromRGB(150,80,255)
Stroke.Thickness=2
Stroke.Transparency=.25

--------------------------------------------------
-- ⚡ TITLE
--------------------------------------------------

local T=Instance.new("TextLabel",F)
T.Size=UDim2.fromScale(.9,.15)
T.Position=UDim2.fromScale(.05,.02)
T.BackgroundTransparency=1
T.Text="紫雷天速"
T.TextColor3=Color3.fromRGB(220,160,255)
T.TextScaled=true
T.Font=Enum.Font.GothamBold
T.ZIndex=3

local Credit=Instance.new("TextLabel",F)
Credit.Size=UDim2.fromScale(.9,.08)
Credit.Position=UDim2.fromScale(.05,.15)
Credit.BackgroundTransparency=1
Credit.Text="制作者 : Mik"
Credit.TextColor3=Color3.fromRGB(180,160,220)
Credit.TextScaled=true
Credit.Font=Enum.Font.Gotham
Credit.ZIndex=3

--------------------------------------------------
-- 📜 SCROLL MENU
--------------------------------------------------

local Scroll=Instance.new("ScrollingFrame",F)
Scroll.Size=UDim2.fromScale(.9,.68)
Scroll.Position=UDim2.fromScale(.05,.25)
Scroll.BackgroundTransparency=1
Scroll.BorderSizePixel=0
Scroll.ScrollBarThickness=5
Scroll.ScrollBarImageColor3=Color3.fromRGB(150,80,255)
Scroll.CanvasSize=UDim2.new(0,0,0,0)
Scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
Scroll.ScrollingDirection=Enum.ScrollingDirection.Y
Scroll.ZIndex=3

local Layout=Instance.new("UIListLayout",Scroll)
Layout.Padding=UDim.new(0,12)
Layout.HorizontalAlignment=Enum.HorizontalAlignment.Center

--------------------------------------------------
-- SPEED
--------------------------------------------------

local S=Instance.new("TextBox",Scroll)
S.Size=UDim2.new(.9,0,0,55)
S.Text="1000"
S.PlaceholderText="Speed 1-1000"
S.TextScaled=true
S.BackgroundColor3=Color3.fromRGB(45,25,70)
S.TextColor3=Color3.new(1,1,1)
S.ClearTextOnFocus=false
S.ZIndex=4

Instance.new("UICorner",S).CornerRadius=UDim.new(0,10)

--------------------------------------------------
-- FLY
--------------------------------------------------

local Fly=Instance.new("TextButton",Scroll)
Fly.Size=UDim2.new(.9,0,0,55)
Fly.Text="🪽 FLY : OFF"
Fly.TextScaled=true
Fly.BackgroundColor3=Color3.fromRGB(100,45,180)
Fly.TextColor3=Color3.new(1,1,1)
Fly.ZIndex=4

Instance.new("UICorner",Fly).CornerRadius=UDim.new(0,10)

--------------------------------------------------
-- INFO
--------------------------------------------------

local Info=Instance.new("TextLabel",Scroll)
Info.Size=UDim2.new(.9,0,0,100)
Info.BackgroundColor3=Color3.fromRGB(35,20,55)
Info.Text="紫雷天速\n\nSpeed / Fly\n制作者 : Mik"
Info.TextColor3=Color3.fromRGB(220,200,255)
Info.TextScaled=true
Info.Font=Enum.Font.GothamBold
Info.ZIndex=4

Instance.new("UICorner",Info).CornerRadius=UDim.new(0,10)

--------------------------------------------------
-- CLOSE
--------------------------------------------------

local Close=Instance.new("TextButton",Scroll)
Close.Size=UDim2.new(.9,0,0,50)
Close.Text="CLOSE"
Close.TextScaled=true
Close.BackgroundColor3=Color3.fromRGB(55,30,70)
Close.TextColor3=Color3.new(1,1,1)
Close.ZIndex=4

Instance.new("UICorner",Close).CornerRadius=UDim.new(0,10)

--------------------------------------------------
-- 👤 รูปตัวละครแทน ⚡
--------------------------------------------------

local Open=Instance.new("ImageButton",G)
Open.Size=UDim2.fromOffset(70,70)
Open.Position=UDim2.fromScale(.05,.5)
Open.Image=IMAGE_ID
Open.BackgroundColor3=Color3.fromRGB(120,50,220)
Open.ScaleType=Enum.ScaleType.Crop
Open.ZIndex=5

Instance.new("UICorner",Open).CornerRadius=UDim.new(1,0)

local OpenStroke=Instance.new("UIStroke",Open)
OpenStroke.Color=Color3.fromRGB(210,150,255)
OpenStroke.Thickness=2

--------------------------------------------------
-- OPEN / CLOSE
--------------------------------------------------

Close.MouseButton1Click:Connect(function()
	F.Visible=false
	Open.Visible=true
end)

Open.MouseButton1Click:Connect(function()
	F.Visible=true
	Open.Visible=false
end)

--------------------------------------------------
-- 🪽 FLY
--------------------------------------------------

local flying=false
local bv,bg

Fly.MouseButton1Click:Connect(function()

	flying=not flying
	Fly.Text=flying and "🪽 FLY : ON" or "🪽 FLY : OFF"

	local C=P.Character or P.CharacterAdded:Wait()
	local Root=C:WaitForChild("HumanoidRootPart")

	if flying then

		bv=Instance.new("BodyVelocity",Root)
		bg=Instance.new("BodyGyro",Root)

		bv.MaxForce=Vector3.new(1e5,1e5,1e5)
		bg.MaxTorque=Vector3.new(1e5,1e5,1e5)

		task.spawn(function()

			while flying and Root.Parent do

				local cam=workspace.CurrentCamera

				local speed=math.clamp(
					tonumber(S.Text) or 1000,
					1,
					1000
				)

				bv.Velocity=cam.CFrame.LookVector*speed
				bg.CFrame=cam.CFrame

				task.wait()
			end

		end)

	else

		if bv then
			bv:Destroy()
			bv=nil
		end

		if bg then
			bg:Destroy()
			bg=nil
		end

	end
end)
