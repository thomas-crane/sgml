///refreshVision(*array_x1y1x2y2)
with (object_visionman){
    
    var xStart = 0;
    var yStart = 0;
    var w = ds_grid_width(global.terrain);
    var h = ds_grid_height(global.terrain);
    
    if (argument_count > 0){
        var roomToExplore = argument[0];
        xStart = roomToExplore[0]-1;
        yStart = roomToExplore[1]-1;
        w = roomToExplore[2]+2;
        h = roomToExplore[3]+2;
    }
    
    for (var i = xStart; i < w; i++){
        for (var j = yStart; j < h; j++){
            if (!isVisible(array(i,j))){
                terrain_set_colour(global.terrain_walls, i, j, c_black);
                if (!isVisible(array(i-1, j)) && 
                    !isVisible(array(i-1, j+1)) && 
                    !isVisible(array(i-1, j-1)) && 
                    !isVisible(array(i, j-1)) &&
                    !isVisible(array(i, j+1)) && 
                    !isVisible(array(i+1, j-1)) && 
                    !isVisible(array(i+1, j+1)) && 
                    !isVisible(array(i+1, j))){
                    terrain_set_alpha(global.terrain_walls, i, j, 0);
                }
                else{
                    terrain_set_alpha(global.terrain_walls, i, j, 1);
                }
                var tile = ds_grid_get(object_gridman.tilesGrid, i, j);
                if (!is_undefined(tile) && tile_exists(tile)){
                    tile_set_alpha(ds_grid_get(object_gridman.tilesGrid, i, j), 0);
                    //tile_set_blend(ds_grid_get(object_gridman.tilesGrid, i, j), c_black);
                }
                groundmod_set_alpha(array(i,j), 0);
            }
            else if (isVisible(array(i,j))){
                if (wallExists(array(i,j))){
                    if (isSelectedWall(array(i,j))){
                        terrain_set_colour(global.terrain_walls, i, j, selectionColor());
                    }
                    else{
                        revertWallColor(array(i,j));
                    }
                }
                /*
                if (isVisible(array(i-1, j-1)) && 
                    !isTypeSolid(getType(array(i-1, j-1))) && 
                    getType(array(i-1, j-1), global.terrain) != TYPE_VOID && 
                    !wallExists(array(i-1, j-1))){
                    terrain_set_alpha(global.terrain_walls, i, j, 1, 1);
                    terrain_set_alpha(global.terrain_walls, i, j, 0.7, 0);
                }
                else {
                    */
                    terrain_set_alpha(global.terrain_walls, i, j, 1);
                    /*
                }
                */
                var tile = ds_grid_get(object_gridman.tilesGrid, i, j);
                if (!is_undefined(tile) && tile_exists(tile) && !wallExists(array(i,j))){
                    tile_set_blend(ds_grid_get(object_gridman.tilesGrid, i, j), c_white);
                    tile_set_alpha(ds_grid_get(object_gridman.tilesGrid, i, j), 1);
                }
                if (groundmod_get_alpha(array(i, j)) <= 0){
                    groundmod_set_alpha(array(i,j), 1);
                }
            }
        }
    }
}
