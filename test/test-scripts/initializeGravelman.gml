///initializeGravelman()
with(object_gravelman){
    ds_grid_destroy(gravelGrid);
    instance_destroy();
}
instance_create(0,0, object_gravelman);

with object_gravelman{
    
    gravelGrid = ds_grid_create(argument0[0], argument0[1]);
    ds_grid_copy(gravelGrid, global.terrain_gravel);
}
