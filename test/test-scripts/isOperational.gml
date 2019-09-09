///isOperational(instance_object_building_, *powerCheck=true)
var thisBuild = argument[0];
var powerCheck = true;
if (argument_count > 1){
    powerCheck = argument[1];
}
if (!is_undefined(thisBuild) &&
    thisBuild >= 0 &&
    instance_exists(thisBuild) && 
    (!powerCheck || thisBuild.powered || !powerNeeded(thisBuild)) && 
    thisBuild.powerSwitch &&
    !thisBuild.dead && 
    thisBuild.initialized){
    return true;
}
