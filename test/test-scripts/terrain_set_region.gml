///terrain_set_region(grid,h1,v1,h2,v2,grid_value, *noOverflow)

var grid = argument[0]

var w = ds_grid_width(grid)
var h = ds_grid_height(grid)

var h1 = clamp(argument[1],0,w)
var v1 = clamp(argument[2],0,h)
var h2 = clamp(argument[3],0,w)
var v2 = clamp(argument[4],0,h)

var val = argument[5]

ds_grid_set_region(grid,h1,v1,h2,v2,val)
if (argument_count>6 && argument[6]){
    terrain_update_region(grid,h1,v1,h2,v2)
}
else{
    terrain_update_region(grid,h1-1,v1-1,h2+2,v2+2)
}
