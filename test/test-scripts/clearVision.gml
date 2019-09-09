///clearVision()
if (instance_exists(object_visionman)){
    var vision = object_visionman.seenRooms;
    ds_grid_clear(vision, false);
}
refreshVision();
