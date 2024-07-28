
local M = {}

local lfs = require( "lfs" )


M.Write = function( saveData, path_)

    local path = system.pathForFile( path_, system.DocumentsDirectory )
 
    local file, errorString = io.open( path, "w" )
 
    if not file then
        print( "File error: " .. errorString )
    else
        file:write( saveData )
        io.close( file )
    end
 
    file = nil
    return true
end

M.Read = function(path_)
    
    local path = system.pathForFile( path_, system.DocumentsDirectory )

    local file, errorString = io.open( path, "r" )
 
    if not file then
        print( "File error: " .. errorString )
        return false
    else
        local contents = file:read( "*a" )
        io.close( file )
            return contents
    end
 
    file = nil

end


M.SFC = function(dname)
    local docs_path = system.pathForFile( "", system.DocumentsDirectory )
 
    local success = lfs.chdir( docs_path )
 
    local new_folder_path
 
    if ( success ) then
        lfs.mkdir( dname )
        new_folder_path = lfs.currentdir() .. "/" .. dname
    end
    return true
end


 return M