///initializeVisionman()
with (object_visionman){
    ds_grid_destroy(seenRooms);
    ds_grid_destroy(checkedGrid);
    seenRooms = ds_grid_create(argument0[0], argument0[1]);
    ds_grid_clear(seenRooms, false);
    checkedGrid = ds_grid_create(argument0[0], argument0[1]);
}
