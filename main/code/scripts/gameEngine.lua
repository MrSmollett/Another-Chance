M = {}

local json = require("json")
local widget = require("widget")

_H = display.contentHeight --Высота
_W = display.contentWidth --Ширина
_CX = display.contentCenterX
_CY = display.contentCenterY--явсе поломал
    persData = {
        [1] = {--main
            ["nameCode"] = "mainHeroCam",
            ["nameGame"] = "МаркКамера",
            ["texture"] = "",
            ["posX"] = _CX,
            ["posY"] = _CY,
            ["HP"] = 100,
            ["Group"] = "Camera",
            ["Visible"] = false
        },
        [2] = {--main
            ["nameCode"] = "mainHero",
            ["nameGame"] = "Марк",
            ["texture"] = "",
            ["posX"] = _CX,
            ["posY"] = _CY,
            ["HP"] = 100,
            ["Group"] = "Camera",
            ["Visible"] = true
        },
        [3] = {
            ["nameCode"] = "testNpc",
            ["nameGame"] = "testNpc",
            ["texture"] = "",
            ["posX"] = _CX,
            ["posY"] = _CX,
            ["HP"] = 100,
            ["Group"] = "Camera",
            ["Visible"] = true
        }
    }
    groupData = {
        ["Camera"] = {1,2}
    }
    local groupDChange = {
        [1] = function(i) Camera:insert(hero[i]) end,
        [2] = function(i) Camera:insert(hero[i]) end,
        [3] = function(i) characterLayer:insert(hero[i]) end,
    }
    

    M.persCreate = function(gameType)
        hero = {}
        for i = 1, 3, 1 do
            test = persData[i]["Group"]
            Camera = display.newGroup()
            hero[i] = display.newRect( persData[i]["posX"], persData[i]["posY"], 50, 70 )
                hero[i].isVisible = persData[i]["Visible"]
                groupDChange[i](i)
                
                
            --print( json.encode( hero[1], { indent=true } ) )
        end

    end

    M.createControl = function()
        phaseMov = "stop"
        direction = "stop"
            interfaceLayer.x, interfaceLayer.y = _CX, _CY

		local function handleButtonEvent( event )
		    if ( "began" == event.phase or "moved" == event.phase ) then
                --phaseMov = "began"
                direction = event.target.id
            elseif ( "ended" == event.phase or "cancelled" == event.phase) then
                direction = "stop"
		        --phaseMov = "stop"
			end
		end

        local upBtn = widget.newButton(
			{
				x = -340,
				y = -20,
				width = 100,
				height = 100,
				defaultFile = "assets/Buttons/buttonControl.png",
				overFile = "assets/Buttons/buttonControl_rel.png",
				id = "up",
				onEvent = handleButtonEvent
			}
		)
        local downBtn = widget.newButton(
			{
				x = -340,
				y = 140,
				width = 100,
				height = 100,
				defaultFile = "assets/Buttons/buttonControl.png",
				overFile = "assets/Buttons/buttonControl_rel.png",
				id = "down",
				onEvent = handleButtonEvent
			}
		)
        local rightBtn = widget.newButton(
			{
				x = -260,
				y = 60,
				width = 100,
				height = 100,
				defaultFile = "assets/Buttons/buttonControl.png",
				overFile = "assets/Buttons/buttonControl_rel.png",
				id = "right",
				onEvent = handleButtonEvent
			}
		)
        local leftBtn = widget.newButton(
			{
				x = -420,
				y = 60,
				width = 100,
				height = 100,
				defaultFile = "assets/Buttons/buttonControl.png",
				overFile = "assets/Buttons/buttonControl_rel.png",
				id = "left",
				onEvent = handleButtonEvent
			}
		)

        upBtn:rotate(0)
        downBtn:rotate(180)
        rightBtn:rotate(90)
        leftBtn:rotate(270)

		interfaceLayer:insert(upBtn)
		interfaceLayer:insert(downBtn)
		interfaceLayer:insert(rightBtn)
		interfaceLayer:insert(leftBtn)

        local function updatePosition()
            bottomLayer.x, bottomLayer.y = -hero[1].x, -hero[1].y
            middleLayer.x, middleLayer.y = -hero[1].x, -hero[1].y
            characterLayer.x, characterLayer.y = -hero[1].x, -hero[1].y
            itemLayer.x, itemLayer.y = -hero[1].x, -hero[1].y
            --print(direction)
            if direction == "up" then
                hero[1].y = hero[1].y - 10
            elseif direction == "down" then
                hero[1].y = hero[1].y + 10 
            elseif direction == "right" then
                hero[1].x = hero[1].x + 10 
            elseif direction == "left" then
                hero[1].x = hero[1].x - 10 
            else
                hero[1].x, hero[1].y = hero[1].x+0, hero[1].y+0
            end


            

        end

        Runtime:addEventListener("enterFrame", updatePosition)

    end

    return M