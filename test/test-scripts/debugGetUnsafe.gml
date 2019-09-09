///debugGetUnsafe(param)
if (instance_exists(object_debug)){
    var param = ds_map_find_value(object_debug.debugOptions, argument[0]);
    return param;
}
return false;
