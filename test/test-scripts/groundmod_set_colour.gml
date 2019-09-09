///groundmod_set_colour(array_iso_index, color)
var ii = argument[0];
if (instance_exists(object_gridman) && 
    tile_exists(ds_grid_get(object_gridman.groundmodTilesGrid, ii[0], ii[1]))){
    
    tile_set_blend(ds_grid_get(object_gridman.groundmodTilesGrid, ii[0], ii[1]), argument[1]);
}
