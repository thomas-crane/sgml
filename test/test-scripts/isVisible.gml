///isVisible(array_iso_index)
if (instance_exists(object_visionman)){
    var vision = object_visionman.seenRooms;
    if (argument0[0] < ds_grid_width(vision) && argument0[0] > 0 && argument0[1] < ds_grid_height(vision) && argument0[1] > 0 && 
    ds_grid_get(vision, argument0[0], argument0[1])){
        return true;
    }
}
return false;
