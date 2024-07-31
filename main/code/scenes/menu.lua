
local composer = require( "composer" )
local widget = require( "widget" )
widget.setTheme( "widget_theme_android_holo_dark" )

local scene = composer.newScene()

_H = display.contentHeight --Высота
_W = display.contentWidth --Ширина
_CX = display.contentCenterX
_CY = display.contentCenterY--явсе поломал


function scene:create( event )

	local sceneGroup = self.view


end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		local background = display.newImageRect( sceneGroup, "assets/Backgrounds/BGMenu.png", _W, _H )
			background.x, background.y = _CX, _CY
	local nameApp = display.newText( sceneGroup, "Another Chance", _CX, _CY-_H/3, "assets/Fonts/HVR.otf", 96 )
		nameApp:setFillColor(0.8, 0.8, 0.7)
	buttons = display.newGroup()
		buttons.x, buttons.y = _CX, _CY+50
 
		-- Function to handle button events
		local function handleButtonEvent( event )
		 
			if ( "ended" == event.phase ) then
				local relBtn = {
					["newGame"] = function() composer.gotoScene( "code.scenes.newGame" ) end,
					["resume"] = function() composer.gotoScene( "code.scenes.game" ) end,
					["settings"] = function() composer.gotoScene( "code.scenes.settings" ) end,
					["quit"] = function() native.requestExit() end
				}
				relBtn[event.target.id]()
			end
		end
		 
		-- Create the widget
		local newGameBtn = widget.newButton(
			{
				x = 0,
				y = -85,
				width = 350,
				height = 80,
				defaultFile = "assets/Buttons/buttonMenu.png",
				overFile = "assets/Buttons/buttonMenu_rel.png",
				label = "Новая игра",
				labelColor = { default={ 0.5, 0.5, 0.4 }, over={ 0.5, 0.5, 0.4, 0.75 } },
				font = "assets/Fonts/HVR.otf",
				fontSize = 50,
				id = "newGame",
				onEvent = handleButtonEvent
			}
		)

		local resumeBtn = widget.newButton(
			{
				x = 0,
				y = -85,
				width = 500,
				height = 80,
				defaultFile = "assets/Buttons/buttonMenu.png",
				overFile = "assets/Buttons/buttonMenu_rel.png",
				label = "Продолжить игру",
				labelColor = { default={ 0.5, 0.5, 0.4 }, over={ 0.5, 0.5, 0.4, 0.75 } },
				font = "assets/Fonts/HVR.otf",
				fontSize = 50,
				id = "resume",
				onEvent = handleButtonEvent
			}
		)
			resumeBtn.isVisible = false

		local settingsBtn = widget.newButton(
			{
				x = 0,
				y = 0,
				width = 350,
				height = 80,
				defaultFile = "assets/Buttons/buttonMenu.png",
				overFile = "assets/Buttons/buttonMenu_rel.png",
				label = "Настройки",
				labelColor = { default={ 0.5, 0.5, 0.4 }, over={ 0.5, 0.5, 0.4, 0.75 } },
				font = "assets/Fonts/HVR.otf",
				fontSize = 50,
				id = "settings",
				onEvent = handleButtonEvent
			}
		)

		local quitBtn = widget.newButton(
			{
				x = 0,
				y = 85,
				width = 350,
				height = 80,
				defaultFile = "assets/Buttons/buttonMenu.png",
				overFile = "assets/Buttons/buttonMenu_rel.png",
				label = "Выйти",
				labelColor = { default={ 0.5, 0.5, 0.4 }, over={ 0.5, 0.5, 0.4, 0.75 } },
				font = "assets/Fonts/HVR.otf",
				fontSize = 50,
				id = "quit",
				onEvent = handleButtonEvent
			}
		)

		buttons:insert(newGameBtn)
		buttons:insert(resumeBtn)
		buttons:insert(settingsBtn)
		buttons:insert(quitBtn)
		

	elseif ( phase == "did" ) then

	end
end



function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		buttons.isVisible = false
	elseif ( phase == "did" ) then

	end
end



function scene:destroy( event )

	local sceneGroup = self.view

end




scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene