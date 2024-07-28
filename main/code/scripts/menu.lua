
local composer = require( "composer" )

local scene = composer.newScene()

_H = display.contentHeight
_W = display.contentWidth
_CX = display.contentCenterX
_CY = display.contentCenterY


function scene:create( event )

	local sceneGroup = self.view


end



function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		local background = display.newImageRect( sceneGroup, "assets/Backgrounds/BGMenu.png", _W, _H )
			background.x, background.y = _CX, _CY
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