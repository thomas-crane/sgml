///remWall(arr_iso_index)
var ii = argument[0];

clearVisualWall(ii);
ds_map_logdestroy(getWallMap(ii));
ds_grid_set(object_drillman.wallsGrid, ii[0], ii[1], noone);
ds_grid_set(global.terrain_walls, ii[0], ii[1], TERRAIN_WALL_CLEAR);

var col = onChunk(array(ii[0], ii[1]), object_cannotgo);
if (instance_exists(col)){
    with (col){
        instance_destroy();
    }
    refreshPathfinder();
}
