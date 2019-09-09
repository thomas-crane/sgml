///createVisualWall(array_xy_index, TERRAIN_WALL_, *grid=global.terrain_walls, *noOverflow)
var grid = noone;
if (argument_count>2){
    grid = argument[2];
}
else{
    grid = global.terrain_walls;
}
p1 = argument[0];
wt = argument[1];
var no = false;
if (argument_count >3){
    no = argument[3];
}
terrain_set_region(grid, p1[0], p1[1], p1[0], p1[1],wt, no)
