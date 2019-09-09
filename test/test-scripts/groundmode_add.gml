///groundmode_add(array_iso_index, tile_)
var ii = argument[0];
if (instance_exists(object_gridman)){
    
    ds_grid_set(object_gridman.groundmodTilesGrid, ii[0], ii[1], 
                    tile_add(
                        argument[1], 
                        0, 
                        0, 
                        G_CELLSIZE*G_RATIO, 
                        G_CELLSIZE, 
                        sysToDisplayX(ii[0]*G_CELLSIZE-G_CELLSIZE/2, ii[1]*G_CELLSIZE+G_CELLSIZE/2), 
                        sysToDisplayY(ii[0]*G_CELLSIZE-G_CELLSIZE/2, ii[1]*G_CELLSIZE+G_CELLSIZE/2), 
                        LAYER_LOW));
}
