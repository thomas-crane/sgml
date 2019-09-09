///getGravel(array_iso_index)
if (instance_exists(object_gravelman)){
    var grid = object_gravelman.gravelGrid;
    var gravel = ds_grid_get(grid, argument0[0], argument0[1]);
    if (is_undefined(gravel) || gravel == false){
        gravel = noone;
    }
    return gravel;
}
return noone;
