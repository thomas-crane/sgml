///markWallToDrill(array_iso_index)
if (instance_exists(object_drillman)){
    clearWallMarkers(argument[0]);
    ds_list_add(object_drillman.drillObjectives, argument[0]);
}
