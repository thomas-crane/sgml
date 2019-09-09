///clearVisualWall(array_xy_index, *grid=global.terrain_walls)
var grid = global.terrain_walls;
if (argument_count>1){
    grid = argument[1];
}
var p1 = argument[0];

terrain_set_region(grid, p1[0], p1[1], p1[0], p1[1], TERRAIN_WALL_CLEAR)
terrain_update_region(grid, p1[0]-1, p1[1]-1, p1[0]+2, p1[1]+2);
