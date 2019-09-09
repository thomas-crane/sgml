///pathTo(array_xy, speed)
path_end();
path = path_add();
mp_grid_path(global.grid, path, x, y, argument0[0], argument0[1], true);
path_start(path, argument1, path_action_stop, false);
