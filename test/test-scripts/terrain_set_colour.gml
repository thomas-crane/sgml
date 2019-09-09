/// terrain_set_colour(grid,x,y,col)
/// change la couleur d'une tile

var grid = argument0
var xx = argument1
var yy = argument2
var col = argument3

var w = ds_grid_width(grid)
var h = ds_grid_height(grid)

xx = clamp(xx, 0, w-1);
yy = clamp(yy, 0, h-1);

for(var i=0; i<2; i++)
    {
    if tile_exists(global.terrain_walls_tiles[xx*h+yy,i])
        tile_set_blend(global.terrain_walls_tiles[xx*h+yy,i],col)
    }
