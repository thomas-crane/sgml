///groundmod_set_alpha(array_iso_index, int_alpha)
var ii = argument[0];
if (instance_exists(object_gridman) && 
    !is_undefined(ds_grid_get(object_gridman.groundmodTilesGrid, ii[0], ii[1])) &&
    tile_exists(ds_grid_get(object_gridman.groundmodTilesGrid, ii[0], ii[1]))){
    
    tile_set_alpha(ds_grid_get(object_gridman.groundmodTilesGrid, ii[0], ii[1]), argument[1]);
}
