--TOC_HUD Build V1.0

--Data Isolation



--Initial Varibles

local Version = 1.0
local line = {"RT","GT","BT","OT","RB","GB","BB","OB"}
local settings = {}
local left = {}
local right = {}
local down = {}
local index = {95,50,25,45,30,}
			-- T  F  T  C  
local dynamic_index = { 5*string.len(os.date("%m-%d %a %X")), 0,
						5*string.len(tpt.get_property("type", x, y)), 10,
						5*string.len(tpt.get_property("life", x, y)), 5*string.len(tpt.get_property("pressure", x, y))),
						,}
--Initial Function
	--mix ceil and floor(don't know if it's more accurate)


local function ceil_floor(num, digital)
    local ceil_sub = math.abs(math.ceil(num) - num)
    local floor_sub = math.abs(math.floor(num) - num)

    if ceil_sub <= floor_sub then
        return ceil_sub
    else
		return floor_sub 
	end
end

local function save(string,value)
	local index_num = 1;
	if MANAGER then return nil end
	settings[string] = value
	save_last()
end

local function save_last()
	f = io.open("TOC_Settings.txt", w)
	io.write(settings)
end

local function load_last()
	local index = 1
	if MANAGER then return nil end
	if f = io.open("TOC_Settings.txt",r) then
		for line in io.lines("*l") do
			settings[lines[index]] = line
			index = index + 1
		end
	end
	return nil
end

local fuction draw_hud()	--Maybe add some arguments
	
end

tpt.hud(0)
load_last()

--Pages
	--Main Window
local MainPage = Window:new(-1, -1, 400, 300)
local MainPage_Title = Label:new(110, 10, (select(1, MainPage:size()/2))-20, 16, "\boT O C   H U D")     --Component return a table with 2 data which are hight and weight   What's main_curY?
local MainPage_Intro = Label:new(180, 100, 100, 16, "Thanks for using TOC HUD, \nthis script provide a better HUD.
\nYou can set the HUD by pressing the button left.\nVersion:\bl"..Version.."\bz\n\btQQ Group:\bw458094899")
local MainPage_TOC = Label:new(300, 250, 100, 16, "TOC 2019 Powered By Lua")

MainPage:addComponent(MainPage_Title)
MainPage:addComponent(MainPage_Intro)
MainPage:addComponent(MainPage_TOC)

local OpenSettings = Button:new(0, 0, 15, 15, "X", "Open HUD settings.")	--the Y has not been check
	ui.addComponent(OpenSettings)
	OpenSettings:visible(false)
	OpenSettings:action(
		function() 
			ui.showWindow(MainPage) 
			icon = true 
		end)

local QuitSettings = Button:new(340, 270, 50, 20, "Close")        --Buttons are already declared in the definition
	MainPage:addComponent(QuitSettings)
	QuitSettings:action(
 	   function()
   	    	ui.closeWindow(MainPage)
    	    icon = false 
		end)

	--Colour Page

local ColourPage = Window:new(-1, -1, 400, 300)
local ColourPage_Title = Label:new(110, 40, (select(1, MainPage:size()/2))-20, 16, "\boHUD  Colour  Set")

ColourPage:addComponent(ColourPage_Title)

local ColourSettings = Button:new(15, 20, 80, 20, "Colour Settings")
	MainPage:addComponent(ColourSettings)
		ColourSettings:action(
    		function()
        	    ui.showWindow(ColourSettings)
        	    icon = false 
			end)
		
local ColourSettingsQuit = Button:new(340, 270, 50, 20, "Close")
	ColourPage:addComponent(ColourSettingsQuit)
	ColourSettingsQuit:action(
		function()
			ui.closeWindow(ColourSettingsQuit)
			icon = false
		end)

--HUD settings Page

local HUDSetPage = Window:new(-1, -1, 400, 300)
local HUDSetPage_Title = Label:new(110, 60, (select(1, MainPage:size()/2))-20, 16, "\boHUD Set")

HUDSetPage:addComponent(HUDSetPage_Title)

local GUISettings = Button:new(15, 40, 80, 20, "HUD settings")
	HUDSetPage:addComponent(GUISettings)
	GUISettings:action(
			function()
				ui.showWindow(HUDSetPage)
				icon = false 
			end)

local GUISettingsQuit=Button:new(340, 270, 50, 20, "Close")
	HUDSetPage:addComponent(GUISettingsQuit)
	GUISettingsQuit:action(
		function()
			ui.closeWindow(GUISettings)
			icon = false
		end)

--Infomation Page

local InfoPage = Window:new(-1, -1, 400, 300)
local InfoPage_Title = Label:new(110, 80, (select(1, MainPage:size())/2)-20, 16, "\boAbout")

InfoPage:addComponent(InfoPage_Title)

local Info=Button:new(15, 60, 80, 20, "About")
	InfoPage:addComponent(GUISettingsQuit)
	Info:action(
		function()
			ui.showWindow(InfoPage)
			icon = false
		end)

local InfoQuit=Button:new(340, 270, 50, 20, "Close")
	InfoPage:addComponent(InfoQuit)
	InfoQuit:action(
		function()
			ui.closeWindow(InfoPage)
			icon = false 
		end)


--Colour Set
ColourSet_1 = Lable:new((10, 30, 150, 15, "Text colour and opacity:"))
colourSet_2 = Label:new(10, 130, 150, 15, "HUD's background colour and opacity:")
local RedText_1 =Label:new(210, 50, 50, 15, "Red")
local GreText_1 =Label:new(210, 70, 50, 15, "Green")
local BluText_1 = Label:new(210, 90, 50, 15, "Blue")
local OpaText_1 = Label:new(210, 110, 50, 15, "Opacity")
local RedBack_2 = Label:new(210, 150, 50, 15, "Red")
local GreBack_2 = Label:new(210, 170, 50, 15, "Green")
local BluBack_2 = Label:new(210, 190, 50, 15, "Blue")
local OpaBack_2 = Label:new(210, 210, 50, 15, "Opacity")

Red_1=Label:new(200, 50, 20, 15, "0")
GreTxt=Label:new(200, 70, 20, 15, "255")
BluTxt=Label:new(200, 90, 20, 15, "165")
OpaTxt=Label:new(200, 110, 20, 15, "80")

redBgd=Label:new(200, 150, 20, 15, "0")
greBgd=Label:new(200, 170, 20, 15, "0")
bluBgd=Label:new(200, 190, 20, 15, "0")
filBgLabel:new(200, 210, 20, 15, "0")

RedSliTxt = Slider:new(10, 50, 180, 15, 255, 20)
GreSliTxt = Slider:new(10, 70, 180, 15, 255, 255)
BluSliTxt = Slider:new(10, 90, 180, 15, 255, 180)
OpaSliTxt = Slider:new(10, 110, 180, 15, 255, 80)
RedSliBgd = Slider:new(10, 150, 180, 15, 255, 0)
GreSliBgd = Slider:new(10, 170, 180, 15, 255, 0)
BluSliBgd = Slider:new(10, 190, 180, 15, 255, 0)
OpaSliBgd = Slider:new(10, 210, 180, 15, 255, 0)

--Check if Script Manager Exists
if MANAGER then
RedSliTxt:onValueChanged(		--Kinda of messy
	function()
		MANAGER.savesetting("TOC_HUD", "redt", RedSliTxt:value())
		RedSliTxt:text(RedSliTxt:value())										--IF THE text changes via values
	end)
if MANAGER.getsetting("TOC_HUD","redt") == nil then			--Delete useless varibles
	RedSliTxt:value(20)															--Repalced by :value
else
	RedSliTxt:value(MANAGER.getsetting("TOC_HUD", "redt"))
end

GreSliTxt:onValueChanged(
	function() 
		MANAGER.savesetting("TOC_HUD", "gret", GreSliTxt:value())
		GreSliTxt:text(GreSliTxt:value())
	end)
if MANAGER.getsetting("TOC_HUD", "gret") == nil then
	GreSliTxt:value(225)
else
	GreSliTxt:value(MANAGER.getsetting("TOC_HUD", "gret"))
end

BluSliTxt:onValueChanged(
	function()
		MANAGER.savesetting("TOC_HUD", "blut", BluSliTxt:value())
		BluSliTxt:text(BluSliTxt:value())
	end)
if MANAGER.getsetting("TOC_HUD", "blut") ==nil then
	BluSliTxt:value(180)
else
	BluSliTxt:value(MANAGER.getsetting("TOC", "blut"))
end

OpaSliTxt:onValueChanged(
	function() 
		MANAGER.savesetting("TOC_HUD", "opat", OpaSliTxt:value())
		OpaSliTxt:text(OpaSliTxt:value())
	end)
if MANAGER.getsetting("TOC_HUD", "opat") == nil then
	OpaSliTxt:value(180)
else
	filSlider:value(MANAGER.getsetting("TOC_HUD", "opa"))
end

RedSliBgd:onValueChanged(
	function()
		MANAGER.savesetting("TOC_HUD", "redb", RedSliBgd:value())
		RedSliBgd:text(RedSliBgd)
	end)
if MANAGER.getsetting("TOC_HUD", "redb") == nil then
	RedSliBgd:value(180)
else
	RedSliBgd:value(MANAGER.getsetting("TOC_HUD", "redb"))
end

GreSliBgd:onValueChanged(
	function()
		MANAGER.savesetting("TOC_HUD", "greb", GreSliBgd:value())
		GreSliBgd:text(GreSliBgd:value())
	end)
if MANAGER.getsetting("TOC_HUD", "greb") == nil then
	greBSlider:value(180)
else
	greBSlider:value(MANAGER.getsetting("TOC_HUD", "greb"))
end

BluSliBgd:onValueChanged(
	function()
		MANAGER.savesetting("TOC_HUD", "blub", BluSliBgd:value())			--bulb what? LOL
		BluSliBgd:text(BluSliBgd:value())
	end)
if MANAGER.getsetting("TOC_HUD", "blub") == nil then
	BluSliBgd:value(180)
else
	BluSliBgd:value(MANAGER.getsetting("TOC_HUD", "blub"))
end

OpaSliBgd:onValueChanged(
	function() 
		MANAGER.savesetting("TOC_HUD", "opab", OpaSliBgd:value()) 
		filBack:text(OpaSliBgd:value()) 
	end)
if MANAGER.getsetting("TOC_HUD", "opab") == nil then 
	filBSlider:value(180) 
else
	filBSlider:value(MANAGER.getsetting("TOC", "opab"))
end

else								--In-build save fuction

RedSliTxt:onValueChanged(
	function()
		save("RT", RedSliTxt:value())
		RedSliTxt:text(RedSliTxt:value())
	end)
GreSliTxt:onValueChanged(
	function() 
		save("GT", GreSliTxt:value())
		GreSliTxt:text(GreSliTxt:value())
	end)
BluSliTxt:onValueChanged(
	function() 
		save("BT", BluSliTxt:value())
		BluSliTxt:text(BluSliTxt:value())
	end)
OpaSliTxt:onValueChanged(
	function() 
		save("OT", OpaSliTxt:value())
		OpaSliTxt:text(OpaSliTxt:value())
	end)
RedSliBgd:onValueChanged(
	function() 
		save("RB", RedSliBgd:value())
		RedSliBgd:text(RedSliBgd:value())
	end)
GreSliBgd:onValueChanged(
	function() 
		save("GB", GreSliBgd:value())
		GreSliBgd:text(GreSliBgd:value())
	end)
BluSliBgd:onValueChanged(
	function() 
		save("BB", BluSliBgd:value())
		BluSliBgd:text(BluSliBgd:value())
	end)
OpaSliBgd:onValueChanged(
	function() 
		save("OB", OpaSliBgd:value())
		OpaSliBgd:text(OpaSliBgd:value())
	end)
end

--HUD SET

local HUDSet_Left = Label:new(10,30,50,16,"Top left:")
local HUDSet_Right = Label:new(103,30,50,16,"Top right:")
local HUDSet_Down = Label:new(196,30,50,16,"Lower left:")
local HUDSet_Temp = Label:new(10,230,50,16,"Temperature scale graph:")

--TIME FPS
--TYPE(CTYPE) TEMP(Colour) Pressure LIFE (Tmp Tmp2 VX VY)
--PARTS # X Y
local CheckBox_Time = Checkbox:new(10,50,15,15,"Time")				--Y step is 20
local CheckBox_FPS = Checkbox:new(10,70,15,15,"FPS")

local CheckBox_Type = Checkbox:new(103,50,15,15,"Type")
local CheckBox_CType = Checkbox:new(103,70,15,15,"CType")
local CheckBox_Temp = Checkbox:new(103,90,15,15,"Temperature")
local CheckBox_Pres = Checkbox:new(103,110,15,15,"Pressure")
local CheckBox_Life = Checkbox:new(103,130,15,15,"Life")
local CheckBox_Tmp = Checkbox:new(103,150,15,15,"Tmp")
local CheckBox_Tmp2 = Checkbox:new(103,170,15,15,"Tmp2")
local CheckBox_VX = Checkbox:new(103,190,15,15,"VX")
local CheckBox_VY = Checkbox:new(103,210,15,15,"VY")

local CheckBox_Part = Checkbox:new(196,50,15,15,"Parts")
local CheckBox_Numi = Checkbox:new(196,70,15,15,"Index")
local CheckBox_X = Checkbox:new(196,90,15,15,"X")
local CheckBox_Y = Checkbox:new(196,110,15,15,"Y")

local CheckBox_Log = Checkbox:new(10,250,50,16,"Logarithmic")
local CheckBox_Line = Checkbox:new(70,250,50,16,"Linear")

--table.insert (table, [pos,] value):
CheckBox_Time:action(
	function(sender,checked)
		if checked and HUDSet_Left[1] ~= "Time" then
			table.insert( HUDSet_Left, 1, "Time")
		elseif not checked and HUDSet_Left[1] = "Time" then
			table.remove( HUDSet_Left, 1)
		end
	end
)
CheckBox_FPS:action(
	function(sender,checked)
		if checked and HUDSet_Left[2] ~= "FPS" then
			table.insert( HUDSet_Left, 2, "FPS")
		elseif not checked and HUDSet_Left[2] = "FPS" then
			table.remove( HUDSet_Left, 2)
		end
	end
)
CheckBox_Type:action(
	function(sender,checked)
		if checked and HUDSet_Right[1] ~= "Type" then
			table.insert( HUDSet_Right, 1, "Type")
		elseif not checked and HUDSet_Right[1] = "Type" then
			table.remove( HUDSet_Right, 1)
		end
	end
)
CheckBox_CType:action(
	function(sender,checked)
		if checked and HUDSet_Right[2] ~= "CType" then
			table.insert( HUDSet_Right, 2, "CType")
		elseif not checked and HUDSet_Right[2] = "CType" then
			table.remove( HUDSet_Right, 2)
		end
	end
)
CheckBox_Temp:action(
	function(sender,checked)
		if checked and HUDSet_Right[3] ~= "Temperature" then
			table.insert( HUDSet_Right, 3, "Temperature")
		elseif not checked and HUDSet_Right[3] = "Temperature" then
			table.remove( HUDSet_Right, 3)
		end
	end
)
CheckBox_Pres:action(
	function(sender,checked)
		if checked and HUDSet_Right[4] ~= "Pressure" then
			table.insert( HUDSet_Right, 4, "Pressure")
		elseif not checked and HUDSet_Right[4] = "Pressure" then
			table.remove( HUDSet_Right, 4)
		end
	end
)
CheckBox_Life:action(
	function(sender,checked)
		if checked and HUDSet_Right[5] ~= "Life" then
			table.insert( HUDSet_Right, 5, "Life")
		elseif not checked and HUDSet_Right[5] = "Life" then
			table.remove( HUDSet_Right, 5)
		end
	end
)
CheckBox_Tmp:action(
	function(sender,checked)
		if checked and HUDSet_Right[6] ~= "Tmp" then
			table.insert( HUDSet_Right, 6, "Tmp")
		elseif not checked and HUDSet_Right[6] = "Tmp" then
			table.remove( HUDSet_Right, 6)
		end
	end
)
CheckBox_Tmp2:action(
	function(sender,checked)
		if checked and HUDSet_Right[7] ~= "Tmp2" then
			table.insert( HUDSet_Right, 7, "Tmp2")
		elseif not checked and HUDSet_Right[7] = "Tmp2" then
			table.remove( HUDSet_Right, 7)
		end
	end
)
CheckBox_VX:action(
	function(sender,checked)
		if checked and HUDSet_Right[8] ~= "VX" then
			table.insert( HUDSet_Right, 8, "VX")
		elseif not checked and HUDSet_Right[8] = "VX" then
			table.remove( HUDSet_Right, 8)
		end
	end
)
CheckBox_VY:action(
	function(sender,checked)
		if checked and HUDSet_Right[9] ~= "VY" then
			table.insert( HUDSet_Right, 9, "VY")
		elseif not checked and HUDSet_Right[9] = "VY" then
			table.remove( HUDSet_Right, 9)
		end
	end
)
:action(
	function(sender,checked)
		if checked and HUDSet_Down[1] ~= "Parts" then
			table.insert( HUDSet_Down, 1, "Parts")
		elseif not checked and HUDSet_Down[1] = "Parts" then
			table.remove( HUDSet_Down, 1)
		end
	end
)
:action(
	function(sender,checked)
		if checked and HUDSet_Down[2] ~= "Index" then
			table.insert( HUDSet_Down, 2, "Index")
		elseif not checked and HUDSet_Down[2] = "Index" then
			table.remove( HUDSet_Down, 2)
		end
	end
)
:action(
	function(sender,checked)
		if checked and HUDSet_Down[3] ~= "X" then
			table.insert( HUDSet_Down, 3, "X")
		elseif not checked and HUDSet_Down[3] = "X" then
			table.remove( HUDSet_Down, 3)
		end
	end
)
:action(
	function(sender,checked)
		if checked and HUDSet_Down[4] ~= "Y" then
			table.insert( HUDSet_Down, 4, "Y")
		elseif not checked and HUDSet_Down[4] = "Y" then
			table.remove( HUDSet_Down, 4)
		end
	end
)
CheckBox_Log:action(
	function(sender,checked)
		if checked then
			CheckBox_Line(false)			--Add draw fuction after
		else
			CheckBox_Line(true)
		end
	end
)
CheckBox_Line:action(
	function(sender,checked)
		if checked then
			CheckBox_Log(false)
		else
			CheckBox_Line(true)
		end
	end
)

	--Main function
