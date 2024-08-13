local composer = require( "composer" )
local widget = require("widget")
local changeSet = require("code.scripts.changeSettings")


local scene = composer.newScene()

_H = display.contentHeight --Высота
_W = display.contentWidth --Ширина
_CX = display.contentCenterX
_CY = display.contentCenterY


function scene:create( event )

	local sceneGroup = self.view
    changeSet.initSetFile()

end



function scene:show( event )

	local sceneGroup = self.view
	    sceneGroup.x, sceneGroup.y = _CX, _CY
	local phase = event.phase

	if ( phase == "will" ) then
		local difficulty = "medium"
	local background = display.newImageRect( sceneGroup, "assets/Backgrounds/BGSettings.png", _W, _H  )
		background.x, background.y = 0, 0
		local function difficultyListener( event )
			if event.phase == "ended" then
				local difficultyChange = {
					[0] = function() difficulty = "easy" end,
					[50] = function() difficulty = "medium" end,
					[100] = function() difficulty = "difficult" end,
				}
				difficultyChange[event.value]()
				changeSet.insertSet("difficulty", difficulty)
				print(difficulty)

			elseif event.phase == "moved" then
				if event.value <= 25 then
					difficultySlider:setValue( 0 )
				elseif event.value >= 25 and event.value <= 75 then
					difficultySlider:setValue( 50 )
				elseif event.value >= 75 then
					difficultySlider:setValue( 100 )
				end

			end
		end
		local difficultyChangeText = display.newText( sceneGroup, "Сложность", 0, 0, "assets/Fonts/HVR.otf", 36)
        difficultyChangeText.x, difficultyChangeText.y = 0-_W/3, 0-_H/3
        difficultySlider = widget.newSlider(
            {
                x = difficultyChangeText.x + 250,
                y = difficultyChangeText.y,
                width = 200,
                value = 50,  -- Start slider at 10% (optional)
                listener = difficultyListener
            }
        )
		sceneGroup:insert(difficultySlider)
			local difficultyText = display.newText( sceneGroup, "Лёгкая Средняя Тяжёлая", 0, 0, "assets/Fonts/HVR.otf", 20)
        		difficultyText.x, difficultyText.y = difficultySlider.x + difficultySlider.width/2, difficultySlider.y + difficultySlider.height/2
				
				
		local function handleButtonEvent( event )
		 
			if ( "ended" == event.phase ) then
		
				composer.gotoScene( "code.scenes.game")
			end
		end
			
		local startBtn = widget.newButton(
			{
				x = 0,
				y = 200,
				width = 250,
				height = 60,
				defaultFile = "assets/Buttons/buttonMenu.png",
				overFile = "assets/Buttons/buttonMenu_rel.png",
				label = "Начать",
				labelColor = { default={ 0.5, 0.5, 0.4 }, over={ 0.5, 0.5, 0.4, 0.75 } },
				font = "assets/Fonts/HVR.otf",
				fontSize = 35,
				id = "startGame",
				onEvent = handleButtonEvent
			}
		)
		sceneGroup:insert(startBtn)
	elseif ( phase == "did" ) then

	end
end



function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then

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