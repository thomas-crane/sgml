///debugMe(str.name, any.input)
if (!DEBUG && !debugParamGet("softDebug")){
    return false;
}
if (instance_exists(object_debug)){
    object_debug.debugArr[array_length_1d(object_debug.debugArr)] = argument1;
    object_debug.displayArr[array_length_1d(object_debug.displayArr)] = argument0;
}
