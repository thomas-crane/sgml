/// terrain_get_colour(grid,x,y)
/// retourne la couleur d'une tile

var grid = argument0
var xx = argument1
var yy = argument2

var w = ds_grid_width(grid)
var h = ds_grid_height(grid)

for(var i=0; i<2; i++)
    {
    if tile_exists(global.terrain_walls_tiles[xx*h+yy,i])
        return tile_get_blend(global.terrain_walls_tiles[xx*h+yy,i])
    }
