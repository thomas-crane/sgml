///debugParamGet(param)
if (instance_exists(object_debug)){
    var param = ds_map_find_value(object_debug.debugOptions, argument[0]);
    if (!is_undefined(param)){
        return param;
    }
}
return false;
