///teleportBack(instance_)
var object = argument[0];
if (isBuilding(object.object_index)){
    object.dead = true;
    return true;
}
else if (isEmmet(object.object_index)){
    object.dead = true;
    return true;
}
return false;
