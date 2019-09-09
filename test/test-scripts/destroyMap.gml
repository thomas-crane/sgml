///destroyMap()

var toDestroy = array(  global.terrain_loot, 
                        global.terrain_gravel,
                        object_drillman.wallsGrid,
                        );

                        
for (var a = 0; a < array_length_1d(toDestroy); a++){
    var grid = toDestroy[a];
    if (ds_exists(grid, ds_type_grid)){
        for (var b = 0; b < ds_grid_width(grid); b++){
            for (var c = 0; c < ds_grid_height(grid); c++){
                var cell = ds_grid_get(grid, b, c);
                if (ds_exists(cell, ds_type_map)){
                    log("Destroying cell ["+string(cell)+"].["+json_encode(cell)+"] from grid "+string(a));
                    ds_map_logdestroy(cell);
                }
            }
        }
    }
}

ds_grid_destroy(global.terrain);
ds_grid_destroy(global.terrain_objects);
ds_grid_destroy(global.terrain_loot);
ds_grid_destroy(global.terrain_walls);
ds_grid_destroy(global.terrain_gravel);
