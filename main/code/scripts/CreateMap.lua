M = {}
compLenghtXMap = 0
compLenghtYMap = 0
compLenghtX1Map = 0
compLenghtY1Map = 0
M.CreateBlock = function(level, IDBlock, lenghtMap, bottomLayer, middleLayer, mapName)
    IDBlock = IDBlock:gsub( " ", "S", 999 )
    pathTexture = {}
    if mapName == "mapGround" then
        pathTexture = {
            ["0"] = "assets/Texture/grass.png",
            ["1"] = "assets/Texture/dirt.png",
            ["2"] = "assets/Texture/grass.png",
            ["3"] = "assets/Texture/grass.png"
        }
    elseif mapName == "mapObject" then
        pathTexture = {
            ["0"] = "0",
            ["1"] = "assets/Texture/pineTree.png",
            ["2"] = "assets/Texture/bush.png",
            ["3"] = "assets/Texture/border.png",
            ["4"] = "assets/Texture/barrier.png",
            ["5"] = "assets/Texture/portal.png"
        }
    end
    local rotateList = {
        ["1"] = 90,
        ["2"] = 180,
        ["3"] = 270,
        ["4"] = 360
        
    }
 
    if IDBlock ~= "S" then
        if mapName == "mapObject" then
            print( mapName )
            if compLenghtX1Map == lenghtMap then
                compLenghtX1Map = 0
                compLenghtY1Map = compLenghtY1Map+1
            end
    
            test11 = tostring(IDBlock)
            path = pathTexture[test11]

            if path == "0" then
                compLenghtX1Map = compLenghtX1Map+1
            elseif path ~= "0" then
                name1 = compLenghtX1Map..compLenghtY1Map

                name1 = display.newImageRect( middleLayer, path, 100, 100 )
                    name1.x, name1.y = compLenghtX1Map*100, compLenghtY1Map*100
                compLenghtX1Map = compLenghtX1Map+1
            end
        else
            print( mapName )
            if compLenghtXMap == lenghtMap then
                compLenghtXMap = 0
                compLenghtYMap = compLenghtYMap+1
            end
    
            test11 = tostring(IDBlock)
            path = pathTexture[test11]

            test1 = tostring(math.random(4))
            rotL = rotateList[test1]

            name = compLenghtXMap..compLenghtYMap

            name = display.newImageRect( bottomLayer, path, 100, 100 )
                name.x, name.y = compLenghtXMap*100, compLenghtYMap*100
                name:rotate(rotL)

            compLenghtXMap = compLenghtXMap+1
        end
    end


end

    return M
