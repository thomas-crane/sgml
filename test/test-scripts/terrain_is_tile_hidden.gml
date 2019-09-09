/// terrain_is_tile_hidden(grid,x,y)
/// la tile est elle complètement entouré par d'autres tiles

var grid = argument0
var xx = argument1
var yy = argument2

var w = ds_grid_width(grid)
var h = ds_grid_height(grid)

return global.terrain_walls_tiles[xx*h+yy,2]
