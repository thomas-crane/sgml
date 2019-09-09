///addGravel(arr_iso_index, *loot)
var ii = argument[0];
var world = global.currentCave[? CAVE_WORLD];
if (argument_count > 1){
    if (instance_exists(object_gravelman)){
        var loot = argument[1];
        var rsc = getRessources();
        for (var i = 0; i < array_length_1d(rsc); i++){
            if (is_undefined(ds_map_find_value(loot, rsc[i]))){
                ds_map_add(loot, rsc[i], 0);
            }
        }
        ds_grid_set(object_gravelman.gravelGrid, ii[0], ii[1], genGravel(loot));    
        groundmode_add(ii, getWorld(world, GRAVEL));
    }
}
else{
    if (instance_exists(object_gravelman)){
        ds_grid_set(object_gravelman.gravelGrid, ii[0], ii[1], genGravel());    
        groundmode_add(ii, getWorld(world, GRAVEL));
    }

}
    
