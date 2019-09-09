///canGo(array_xy, *startpoint_array_xy)
var path = path_add();
var destination = argument[0];
if (argument_count< 2){
    return mp_grid_path(global.grid, path, x, y, destination[0], destination[1], true);
}
else{
    var pos = argument[1];
    return mp_grid_path(global.grid, path, pos[0], pos[1], destination[0], destination[1], true);
}
