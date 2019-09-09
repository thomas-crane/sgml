///markWallToDynamite(array_iso_index)
if (instance_exists(object_drillman)){
    clearWallMarkers(argument[0]);
    ds_list_add(object_drillman.dynamiteObjectives, argument[0]);
    var ii = argument[0];
    var pos = array(ii[0]*G_CELLSIZE, ii[1]*G_CELLSIZE);
    liberateObject(object_pickable_dynamite, instance_nearest(pos[0], pos[1], object_building_stocker));
}
