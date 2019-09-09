///addWall(arr_iso_index, TERRAIN_WALL_, *noverflow, *ds_generated_loot)
var ii = argument[0];
var type = argument[1];
var noverflow = false; //No overflow prevents from creating stuff outside the grid
if (argument_count > 2){
    noverflow = argument[2];
}

if (!onChunk(ii, object_cannotgo)){
    createVisualWall(ii, type, global.terrain_walls, noverflow);
    if (type != TERRAIN_WALL_CLEAR && 
        instance_exists(object_drillman) && 
        ds_grid_get(global.terrain, ii[0], ii[1]) != TYPE_VOID){
        
        // Generate if not already generated
        if (getWall(ii) < 0){
            var generated = noone;
            if (argument_count > 3 && ds_exists(argument[3], ds_type_map)){
                generated = genWall(type, argument[3]);
            }
            else{
                generated = genWall(type);
            }
            ds_grid_set(object_drillman.wallsGrid, ii[0], ii[1], generated);
        }
        instance_create(ii[0]*G_CELLSIZE, ii[1]*G_CELLSIZE, object_cannotgo);
        refreshPathfinder();
    }
}
