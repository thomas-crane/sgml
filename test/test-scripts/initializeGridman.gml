///initializeGridman(size)
with (object_gridman){
    ds_grid_destroy(tilesGrid);
    ds_grid_destroy(groundmodTilesGrid);
    ds_list_destroy(chunkList);
    ds_list_destroy(chunkColorList);
    ds_list_destroy(chunkAlphaList);
    instance_destroy();
}
instance_create(0,0,object_gridman);
with (object_gridman){
    var world = global.currentCave[? CAVE_WORLD];
    tilesGrid = ds_grid_create(argument0[0],argument0[1]);
    groundmodTilesGrid = ds_grid_create(argument0[0],argument0[1]);
    
    for (var i = 0; i < ds_grid_width(global.terrain_objects); i++){
        for (var j = 0; j < ds_grid_height(global.terrain_objects); j++){
        
            var thisTerrain = ds_grid_get(global.terrain, i, j);
            var thisWall = ds_grid_get(global.terrain_walls, i, j);
            
            ds_grid_set(tilesGrid, i, j, 
                tile_add(
                    getWorld(world, TERRAIN_WALL_CLEAR), 
                    thisTerrain*G_CELLSIZE*G_RATIO, 
                    0, 
                    G_CELLSIZE*G_RATIO, 
                    G_CELLSIZE, 
                    sysToDisplayX(i*G_CELLSIZE-G_CELLSIZE/2, j*G_CELLSIZE+G_CELLSIZE/2), 
                    sysToDisplayY(i*G_CELLSIZE-G_CELLSIZE/2, j*G_CELLSIZE+G_CELLSIZE/2), 
                    LAYER_LOW));
                    
                    
            if (getGravel(array(i,j)) != noone){
                ds_grid_set(groundmodTilesGrid, i, j, 
                    tile_add(
                        getWorld(world, GRAVEL), 
                        0, 
                        0, 
                        G_CELLSIZE*G_RATIO, 
                        G_CELLSIZE, 
                        sysToDisplayX(i*G_CELLSIZE-G_CELLSIZE/2, j*G_CELLSIZE+G_CELLSIZE/2), 
                        sysToDisplayY(i*G_CELLSIZE-G_CELLSIZE/2, j*G_CELLSIZE+G_CELLSIZE/2), 
                        LAYER_LOW-1));
            }
            
            var oChunk = ds_grid_get(global.terrain_objects, i, j);
            
            
            if (object_exists(oChunk)){
                if (isBuilding(oChunk)){
                    remHardStock(oChunk, 1);
                }
                instance_create(i*G_CELLSIZE, j*G_CELLSIZE, oChunk);
            }
            
            if (thisWall != TERRAIN_WALL_CLEAR && !is_undefined(thisWall)){
                addWall(array(i,j), thisWall, true);
            }
        }
    }
    terrain_update_region(global.terrain_walls,0,0, argument0[0], argument0[1]);
    
}
