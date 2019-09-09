///miniTimeStart(str_name)
if (instance_exists(object_debug)){
    object_debug.miniTimeDisplayArr[array_length_1d(object_debug.miniTimeDisplayArr)] = argument[0];
    object_debug.miniTimeArr[array_length_1d(object_debug.miniTimeArr)] = get_timer();
}
