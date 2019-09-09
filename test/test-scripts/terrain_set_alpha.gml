/// terrain_set_alpha(grid,x,y,alpha, *0-1)
/// change l'opacité d'une tile

var grid = argument[0];
var xx = argument[1];
var yy = argument[2];
var alpha = argument[3];
var height = -1;
if (argument_count > 4){
    height = argument[4];
}

var w = ds_grid_width(grid)
var h = ds_grid_height(grid)

xx = clamp(xx, 0, w-1);
yy = clamp(yy, 0, h-1);

if (height < 0){
    for(var i=0; i<2; i++)
        {
        if tile_exists(global.terrain_walls_tiles[xx*h+yy,i])
            tile_set_alpha(global.terrain_walls_tiles[xx*h+yy,i], alpha)
        }
}
else{
    if tile_exists(global.terrain_walls_tiles[xx*h+yy,height])
            tile_set_alpha(global.terrain_walls_tiles[xx*h+yy,height], alpha)
}
