///getWall(array_iso_index)
if (instance_exists(object_drillman) && 
    isClamped(argument0[0], 0, ds_grid_width(object_drillman.wallsGrid)-1) &&
    isClamped(argument0[1], 0, ds_grid_height(object_drillman.wallsGrid)-1)){
    
    var grid = object_drillman.wallsGrid;
    var wall = ds_grid_get(grid, argument0[0], argument0[1]);
    if (is_undefined(wall) || wall == false){
        wall = noone;
    }
    return wall;
}
return noone;
