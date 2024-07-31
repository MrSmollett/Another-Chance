local composer = require( "composer" )
local changeSet = require("code.scripts.changeSettings")
local widget = require("widget")

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
		local background = display.newImageRect( sceneGroup, "assets/Backgrounds/BGSettings.png", _W, _H  )
            background.x, background.y = 0, 0
            -- Slider listener
    local function volumeListener( event )
        if event.phase == "ended" then
            changeSet.insertSet("volume", event.value)
        end
    end
 
-- Create the widget
    local volChangeText = display.newText( sceneGroup, "Громкость", 0, 0, "assets/Fonts/HVR.otf", 36)
        volChangeText.x, volChangeText.y = 0-_W/3, 0-_H/3
        local volSlider = widget.newSlider(
            {
                x = volChangeText.x + 250,
                y = volChangeText.y,
                width = 200,
                value = settings.volume,  -- Start slider at 10% (optional)
                listener = volumeListener
            }
        )

    local graphicsChangeText = display.newText( sceneGroup, "Графика", 0, 0, "assets/Fonts/HVR.otf", 36)
        graphicsChangeText.x, graphicsChangeText.y = volChangeText.x, volChangeText.y + 50

    local devModChangeText = display.newText( sceneGroup, "   Режим \nразработчика", 0, 0, "assets/Fonts/HVR.otf", 36)
        devModChangeText.x, devModChangeText.y = graphicsChangeText.x, graphicsChangeText.y + 65   
    
        local function handleButtonEvent( event )
		 
			if ( "ended" == event.phase ) then

                composer.gotoScene( "code.scenes.menu")
			end
		end
    
    local exitBtn = widget.newButton(
        {
            x = _W/2.5,
            y = -_H/3,
            width = 100,
            height = 100,
            defaultFile = "assets/Buttons/buttonExit.png",
            overFile = "assets/Buttons/buttonExit_rel.png",
            onEvent = handleButtonEvent
        }
    )
            sceneGroup:insert(volSlider)
            sceneGroup:insert(exitBtn)
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