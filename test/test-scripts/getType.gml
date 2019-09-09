///getType(index_array_xy, *terrainGrid)
var pos = argument[0];
var terrain = noone;
if (argument_count > 1){
    terrain = argument[1];
}
else{
    terrain = global.terrain;
}
if (pos[0] < ds_grid_width(terrain) && pos[1] < ds_grid_height(terrain)
    && pos[0] >= 0 && pos[1] >= 0){
    var thisBlock = ds_grid_get(terrain, pos[0], pos[1]);
    return thisBlock;
}
return false;
