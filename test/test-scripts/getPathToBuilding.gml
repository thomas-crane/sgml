///getPathToBuilding(object_building_)
var anypath = path_add();
var thisBuild = argument[0];

var arounds = getSurroundingsIndex(thisBuild.ownIsoIndex, 1);
for (i = 0; i < array_length_1d(arounds); i++){
    var thisAround = arounds[i];
    
    if (canGo(array(
                lerp(thisAround[0]*G_CELLSIZE+G_CELLSIZE/2, thisBuild.x+G_CELLSIZE/2, 0.45), 
                lerp(thisAround[1]*G_CELLSIZE+G_CELLSIZE/2, thisBuild.y+G_CELLSIZE/2, 0.45)
        ))){
        
        mp_grid_path(global.grid, anypath,x, y, 
                    lerp(thisAround[0]*G_CELLSIZE+G_CELLSIZE/2, thisBuild.x+G_CELLSIZE/2, 0.45),  
                    lerp(thisAround[1]*G_CELLSIZE+G_CELLSIZE/2, thisBuild.y+G_CELLSIZE/2, 0.45),
                true);
        break;
    }
}
return anypath;
