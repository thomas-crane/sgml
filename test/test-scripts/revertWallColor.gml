///revertWallColor(wall_arr_index_xy, *grid)
var lastWall = argument[0];
var grid = noone;
if (argument_count < 2){
    grid = global.terrain_walls;
}
else{
    grid = argument[1];
}
if (!isVisible(lastWall)){
    //terrain_set_colour(grid, lastWall[0], lastWall[1], c_black);
}
else if (isMarkedToDynamite(lastWall)){
    terrain_set_colour(grid, lastWall[0], lastWall[1], c_red);
}
else if (isMarkedToDrill(lastWall)){
    terrain_set_colour(grid, lastWall[0], lastWall[1], c_yellow);
}
else{
    terrain_set_colour(grid, lastWall[0], lastWall[1], c_white);
} 
