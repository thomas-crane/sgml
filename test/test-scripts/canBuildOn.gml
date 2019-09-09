///canBuildOn(object_building_, index_arr_xy)
var pos = argument[1];
if (!ds_exists(global.terrain, ds_type_grid)){
    return false;
}
if (pos[0] >= 0 &&
    pos[0] < ds_grid_width(global.terrain) &&
    pos[1] >= 0 &&
    pos[1] < ds_grid_height(global.terrain) &&
    isVisible(argument[1])){
    
    switch (argument[0]){
        default:
            return (getType(argument[1]) == TYPE_DIRT && !isOccupied(argument[1]));
            break;
        
        case object_building_sismic:
            return (getType(argument[1]) == TYPE_EXITPOINT && !isOccupied(argument[1]));
    }
}
return false;
