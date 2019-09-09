///miniTimeStop(str_name)
if (instance_exists(object_debug)){
    for (var j = 0; j < array_length_1d(object_debug.miniTimeDisplayArr); j++){
        if (object_debug.miniTimeDisplayArr[j] == argument[0]){
            object_debug.miniTimeArr[j] = get_timer() - object_debug.miniTimeArr[j];
        }
    }
}
