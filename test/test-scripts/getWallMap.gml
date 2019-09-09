///getWallMap(array_iso_index)
if (instance_exists(object_drillman)){
    var grid = object_drillman.wallsGrid;
    var wall = ds_grid_get(grid, argument0[0], argument0[1]);
    if (wall != noone && !is_undefined(wall)){
        return wall;
    }
}
return false;
