///wallExists(array_iso_index, *visibilityCheck=false)
if (instance_exists(object_drillman) && isInGrid(argument[0])){
    var grid = global.terrain_walls;
    var pos = argument[0];
    var wall = ds_grid_get(grid, pos[0], pos[1]);
    if (wall == TERRAIN_WALL_CLEAR){
        wall = false;
    }
    else{
        wall = true;
    }
    if (argument_count > 1 && argument[1]){
        wall = (wall || !isVisible(pos));
    }
    return wall;
}
return false;
