///refreshPathfinder()

mp_grid_destroy(global.grid);
with (object_pathfinder){
    var precision = 1;
    global.grid = mp_grid_create(0, 0, room_width/(G_CELLSIZE/precision), room_height/(G_CELLSIZE/precision), (G_CELLSIZE/precision), (G_CELLSIZE/precision));
    mp_grid_add_instances(global.grid, object_solid, true);
}

