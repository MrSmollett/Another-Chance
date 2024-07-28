
M = {}


M.LoadMap = function(mapNum)
    LFW = require("code.libs.libFileWork")
    CM = require("code.libs.CreateMap")
    json = require("json")


    map = { 
        map1 = {"0011100",
                "0010100",
                "0010100",
                "0010100",
                "1110111",
                "1000001",
                "11111111111111111111111111111111111111111111111"
                },
        map2 = {"0011100",
                "0010100",
                "0010100",
                "0010100",
                "1110111",
                "1000001",
                "111111111111000000000000001111111111111111111"
                }
      }


    LFW.SFC("maps/")

    local memMap = LFW.Read("maps/map.txt")
        if memMap == false then
            LFW.Write(json.encode( map, { indent=true } ), "maps/map.txt")
        else
            Map = json.decode(memMap)
        end

        MapP="map"..mapNum

        pathCikl = json.encode(Map[MapP])
            pathCikl = json.decode( pathCikl )

        level = #pathCikl

        for lev = 1, level, 1 do
            test = Map[MapP][lev]

            for i = 1, #test do
                local c = test:sub(i,i)
                CM.CreateBlock( lev, c, #test)
            end
        end
    end


    return M