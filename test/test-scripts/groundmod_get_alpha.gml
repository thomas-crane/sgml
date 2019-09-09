///groundmod_get_alpha(array_iso_index)
var ii = argument[0];
if (instance_exists(object_gridman) && 
    tile_exists(ds_grid_get(object_gridman.groundmodTilesGrid, ii[0], ii[1]))){
    
    return tile_get_alpha(ds_grid_get(object_gridman.groundmodTilesGrid, ii[0], ii[1]));
}
