///ds_map_logcreate()
// Logs creation of map
var map = ds_map_create();
if (DEBUG && DEBUG_MAPS){
    log("Creating map ["+string(map)+"]", object_get_name(object_index), "MAPS.LOG");
}

return map;
