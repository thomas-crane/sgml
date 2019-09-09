///debugParamSet(param, value)
if (instance_exists(object_debug)){
    if (ds_map_exists(object_debug.debugOptions, argument[0])){
        ds_map_replace(object_debug.debugOptions, argument[0], argument[1]);
    }
    else{
        ds_map_add(object_debug.debugOptions, argument[0], argument[1]);
    }
    show_debug_message(object_get_name(object_index)+" set "+argument[0]+" to "+string(argument[1]));
}
