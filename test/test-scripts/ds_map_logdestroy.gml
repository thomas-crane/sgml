///ds_map_logdestroy(map)
// Logs destruction of map

if (DEBUG && DEBUG_MAPS){
    log("Destroying map ["+string(argument0)+"."+string_delete(json_encode(argument0), 256, 100000)+"]", object_get_name(object_index), "MAPS.LOG");
}

ds_map_destroy(argument0);
