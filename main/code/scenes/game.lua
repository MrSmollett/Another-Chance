
local composer = require( "composer" )
local loadMap = require("code.scripts.LoadMap")

local scene = composer.newScene()

_H = display.contentHeight --Высота
_W = display.contentWidth --Ширина
_CX = display.contentCenterX
_CY = display.contentCenterY


function scene:create( event )

	local sceneGroup = self.view

    bottomLayer = display.newGroup()
    middleLayer = display.newGroup()
    characterLayer = display.newGroup()
    itemLayer = display.newGroup()
    interfaceLayer = display.newGroup()

    sceneGroup:insert(bottomLayer)
    sceneGroup:insert(middleLayer)
    sceneGroup:insert(characterLayer)
    sceneGroup:insert(itemLayer)
    sceneGroup:insert(interfaceLayer)

end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		loadMap.LoadMap(1, bottomLayer, middleLayer)
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