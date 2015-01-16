#NoEnv
#SingleInstance
{
FileInstall, replace.png, replace.png
FileCreateDir, C:\Followpoints\
FileInstall, No1.png, C:\Followpoints\No1.png
FileInstall, No2.png, C:\Followpoints\No2.png
FileInstall, No3.png, C:\Followpoints\No3.png
FileInstall, No4.png, C:\Followpoints\No4.png
FileInstall, No5.png, C:\Followpoints\No5.png
FileInstall, No6.png, C:\Followpoints\No6.png
FileInstall, No7.png, C:\Followpoints\No7.png
FileInstall, No8.png, C:\Followpoints\No8.png
FileInstall, No9.png, C:\Followpoints\No9.png
FileInstall, No10.png, C:\Followpoints\No10.png
FileInstall, No11.png, C:\Followpoints\No11.png
FileInstall, No12.png, C:\Followpoints\No12.png
FileInstall, No13.png, C:\Followpoints\No13.png
FileInstall, No14.png, C:\Followpoints\No14.png
FileInstall, No15.png, C:\Followpoints\No15.png
FileInstall, No16.png, C:\Followpoints\No16.png
FileInstall, replace.png, C:\Followpoints\NO_FP.png
}

MsgBox, 0, Followpoints, In "C:\Followpoints" are 16 different followpoints delivered by this programm. If you like`, you can use them.

FileSelectFile, var,,C:\Followpoints\,Select your followpoint you want to set, *.png

FileSelectFolder, folder,,,Select your skin folder

{
FileDelete, %folder%\followpoint.png
FileDelete, %folder%\followpoint-1.png
FileDelete, %folder%\followpoint-2.png
FileDelete, %folder%\followpoint-3.png
FileDelete, %folder%\followpoint-4.png
FileDelete, %folder%\followpoint-5.png
FileDelete, %folder%\followpoint-6.png
FileDelete, %folder%\followpoint-7.png
FileDelete, %folder%\followpoint-8.png
FileDelete, %folder%\followpoint-9.png
FileDelete, %folder%\followpoint-0.png
}
Length := 3
Begin := 4

Gui, Add, Text, x32 y40 w100 h30 , How long should the followline be?
Gui, Add, Edit, x142 y20 w15 h15 vEdit1 +ReadOnly, %length%
Gui, Add, Slider, x142 y40 w180 h30 line1 gUpdate Range1-8 vLength, %length%

Gui, Add, Text, x32 y100 w100 h30 , How early should the followline begin?
Gui, Add, Edit, x142 y80 w15 h15 vEdit2 +ReadOnly, %begin%
Gui, Add, Slider, x142 y100 w180 h30 line1 gUpdate Range1-9 vBegin, %begin%

Gui, Add, Button, x340 y70 w30 h30 gGo, Start
; Generated using SmartGUI Creator for SciTE
Gui, Show, w392 h165, Followline Edit
return

Update:
Gui, Submit
GuiControl,,Edit1, %length%
GuiControl,,Edit2, %begin%
Gui, Show
return

Go:
Gui, Submit

if((length + begin) > 10)
{
	MsgBox, 0, You selected false setting, Make sure you keep your length and begin added together under 10.
	ExitApp
}
EmptyMem()

FileCopy, %var%, %A_Temp%\filetowrite.png

Loop, 12
{
	FileDelete, %folder%\followpoint.png
	l := A_Index - 1
	FileDelete, %folder%\followpoint-%l%.png
}

EmptyMem()

loop, %length%
{
	newvar := A_Index + begin - 1
	FileCopy, %A_Temp%\filetowrite.png, %folder%\followpoint-%newvar%.png
}

FileCopy, replace.png, %folder%\followpoint.png

EmptyMem()

Loop, 10
{
	a := A_Index - 1
	If(!FileExist(folder . "\followpoint-" . a . ""))
		FileCopy, replace.png, %folder%\followpoint-%a%.png
}

FileDelete, replace.png

MsgBox, 0, Reload your skin, To make this work`, reload your skin ingame.

EmptyMem()


GuiClose:
FileDelete, replace.png
FileDelete, %A_Temp%\filetowrite.png
ExitApp
