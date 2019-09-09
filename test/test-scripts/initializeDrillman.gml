///initializeDrillman(caveSize, *lootMultiplier)
with(object_drillman){
    ds_grid_destroy(wallsGrid);
    ds_list_destroy(dynamiteObjectives);
    ds_list_destroy(drillObjectives);
    instance_destroy();
}
instance_create(0,0, object_drillman);
with object_drillman{
    var size = argument[0];
    wallsGrid = ds_grid_create(size[0], size[1]);
    
    var lootMultiplier = 1;
    if (argument_count > 1){
        lootMultiplier = argument[1];
    }
    
    ds_grid_clear(wallsGrid, noone);
    
    for (var i = 0; i < ds_grid_width(global.terrain_walls); i++){
        for (var j = 0;  j< ds_grid_height(global.terrain_walls); j++){
            var thisWall = ds_grid_get(global.terrain_walls, i, j);
            
            if (thisWall != TERRAIN_WALL_UNBREAKABLE && thisWall != TERRAIN_WALL_CLEAR && !is_undefined(thisWall)){
                thisWall = genWall(thisWall, ds_grid_get(global.terrain_loot, i, j), true, lootMultiplier);
            }
            else{
                thisWall = noone;
            }
            ds_grid_set(wallsGrid, i, j, thisWall);
        }
    }
    
}
