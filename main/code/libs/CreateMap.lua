M = {}
compLenghtXMap = 0
compLenghtYMap = 0
M.CreateBlock = function(level, IDBlock, lenghtMap)



    if compLenghtXMap == lenghtMap then
        compLenghtXMap = 0
        compLenghtYMap = compLenghtYMap+1
    end

    if IDBlock == "0" then
        compLenghtXMap = compLenghtXMap+1
    else
        name = compLenghtXMap..compLenghtYMap
        print(compLenghtXMap)
        name = display.newRect( compLenghtXMap*15, compLenghtYMap*15, 10, 10 )
        compLenghtXMap = compLenghtXMap+1

    end
end

    return M
