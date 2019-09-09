/// terrain_update_region(grid,h1,v1,h2,v2)
/// met à jour les tiles d'une région

var grid = argument0

var w = ds_grid_width(grid)
var h = ds_grid_height(grid)

var h1 = clamp(argument1,0,w)
var v1 = clamp(argument2,0,h)
var h2 = clamp(argument3,0,w)
var v2 = clamp(argument4,0,h)

for(var xx=h1; xx<h2; xx++){
    for(var yy=v1; yy<v2; yy++){
    
        var index = clamp(xx*h+yy,0,w*h-1)
        
        if tile_exists(global.terrain_walls_tiles[index,0])
            tile_delete(global.terrain_walls_tiles[index,0])
        if tile_exists(global.terrain_walls_tiles[index,1])
            tile_delete(global.terrain_walls_tiles[index,1])
        global.terrain_walls_tiles[index,0] = noone
        global.terrain_walls_tiles[index,1] = noone
        global.terrain_walls_tiles[index,2] = false
        
        terrain_add_tile(xx,yy,grid,32,w,h,grid[# xx,yy])
        revertWallColor(array(xx, yy), grid);
    }
}
